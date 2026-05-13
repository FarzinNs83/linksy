import user from "../models/user_model.js";
import bcrypty from 'bcrypt';
import token from '../utils/jwt.js';

async function register(req, res) {
    try {
        const { name, email, pw } = req.body;
        const hashbrown = await bcrypty.hash(pw, 10);
        const newUser = await user.create({ name: name, email: email, pw: hashbrown });
        const jwt = await token(newUser._id);
        res.status(201).json({ code: 201, message: "User registered successfully", token: jwt });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}
async function getUser(req, res) {
    try {
        const id = req.params.id;
        if (!id) return res.status(404).json({ code: 404, error: "User Not Found" });
        const userDetail = await user.findById(id).populate("posts");
        return res.status(200).json({ code: 200, message: "User Detail Fetched Successfuly", user: userDetail });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}
async function login(req, res) {
    try {
        const { email, pw } = req.body;

        const findUser = await user.findOne({ email: email });
        if (findUser && await bcrypty.compare(pw, findUser.pw)) {
            const jwt = await token(findUser._id);
            res.status(201).json({ code: 201, message: "Login successfull", token: jwt });
        } else {
            res.status(401).json({ code: 401, error: "Invalid email or password" });
        }
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}
async function updateUser(req, res) {
    try {
        const body = req.body;
        const uid = req.params.uid;
        const data = await user.findOneAndUpdate({ _id: uid }, body, { new: true })
        return res.status(201).json({ code: 201, message: "User Updated Successfully", data: data })
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}
export default { register, login, getUser, updateUser };
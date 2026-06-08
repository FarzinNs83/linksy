import User from "../models/user_model.js";
import bcrypty from 'bcrypt';
import token from '../utils/jwt.js';
import fs from "fs";
import path from "path";

async function register(req, res) {
    try {
        const { name, email, pw } = req.body;

        const image = req.file
            ? req.file.filename
            : null;

        const hashbrown = await bcrypty.hash(pw, 10);

        const newUser = await User.create({
            name: name,
            email: email,
            pw: hashbrown,
            image: image
        });

        const jwt = await token(newUser._id);

        res.status(201).json({
            code: 201,
            message: "User registered successfully",
            token: jwt,
            data : newUser
        });

    } catch (error) {
        if (error.code === 11000) {
            return res.status(400).json({
                message: "Email already exists",
            });
        }
        res.status(500).json({ code: 500, error: error.message });
    }
}
async function getUser(req, res) {
    try {
        const id = req.params.id;
        if (!id) return res.status(404).json({ code: 404, error: "User Not Found" });
        const userDetail = await User.findById(id).populate("posts");
        return res.status(200).json({ code: 200, message: "User Detail Fetched Successfuly", user: userDetail });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}
async function login(req, res) {
    try {
        const { email, pw } = req.body;

        const findUser = await User.findOne({ email: email });
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
        const uid = req.params.uid;
        const body = { ...req.body };

        const user = await User.findById(uid);

        if (!user) {
            return res.status(404).json({
                code: 404,
                message: "User not found",
            });
        }

        if (req.file) {
            if (user.image) {
                const oldPath = path.join("uploads", user.image);

                if (fs.existsSync(oldPath)) {
                    fs.unlinkSync(oldPath);
                }
            }

            body.image = req.file.filename;
        }

        const data = await User.findByIdAndUpdate(
            uid,
            body,
            { new: true }
        );

        return res.status(200).json({
            code: 200,
            message: "User Updated Successfully",
            data,
        });

    } catch (error) {
        return res.status(500).json({
            code: 500,
            error: error.message,
        });
    }
}
async function searchUser(req, res) {
    try {
        const q = req.query.q?.trim() || "";
        const page = parseInt(req.query.page) || 1;
        const limit = parseInt(req.query.limit) || 5;

        const skip = (page - 1) * limit;

        const users = await User.find({
            name: {
                $regex: q,
                $options: "i",
            },
        }).select("name image")
            .skip(skip)
            .limit(limit);

        const total = await User.countDocuments({
            name: {
                $regex: q,
                $options: "i",
            },
        });

        res.status(200).json({
            code: 200,
            page,
            limit,
            total,
            totalPages: Math.ceil(total / limit),
            users,
        });
    } catch (error) {
        res.status(500).json({
            code: 500,
            error: error.message,
        });
    }
}
export default { register, login, getUser, updateUser, searchUser };
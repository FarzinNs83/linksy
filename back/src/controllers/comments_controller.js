import comments from "../models/comments_model.js";

async function getComments(req, res) {
    try {
        const id = req.params.id;
        const data = await comments.findById(id).populate("user", "name image");
        return res.status(200).json({ code: 200, message: "Comments Fetched Successfully", data: data });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}
async function postComment(req, res) {
    try {
        const id = req.params.id;
        const body = req.body;
        const data = await comments.create(body);
        return res.status(201).json({ code: 200, message: "Comment Post Successfully", data: data });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}

export default { getComments, postComment }
import post from "../models/post_model.js";
import user from "../models/user_model.js";

async function publishPost(req, res) {
    try {
        const body = req.body;

        const image = req.file
            ? req.file.filename
            : null;

        const data = await post.create({
            ...body,
            image,
        });

        await user.findByIdAndUpdate(
            body.user,
            {
                $inc: { postCount: 1 },
            }
        );

        const postList = await user.findById(body.user);

        postList.posts.push(data._id);

        await postList.save();

        return res.status(201).json({
            code: 201,
            message: "Post Published Successfully",
            data,
        });
    } catch (error) {
        res.status(500).json({
            code: 500,
            error: error.message,
        });
    }
}

async function getPosts(req, res) {
    const page = req.query.page || 1;

    try {
        const total = await post.countDocuments();
        const totalPage = Math.ceil(total / 4);
        const data = await post.find().populate("user", "name image").skip((page - 1) * 4).limit(4);
        if (!data) return res.status(404).json({ code: 404, error: "No Posts Found!" });
        if (page > totalPage) {
            return res.status(404).json({ code: 404, message: "No more post available", total: total, page: page, totalPage: totalPage });
        }
        return res.status(200).json({ code: 200, message: "Posts Fetched Successfuly", total: total, page: page, totalPage: totalPage, data: data });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });

    }
}

async function deletePost(req, res) {
    try {
        const id = req.params.id;
        const data = await post.findByIdAndDelete(id);
        if (!data) return res.status(404).json({ code: 404, error: "Post Not Found" });
        await user.findByIdAndUpdate(data.user, { $inc: { postCount: -1 } });
        // const postList = await user.findById(data.user);
        // postList.posts.pop(data._id);
        // await postList.save();
        return res.status(200).json({ code: 200, message: "Posts Deleted Successfuly", data: data });

    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}

async function updatePost(req, res) {
    try {
        const id = req.params.id;
        const updatedData = await post.findOneAndUpdate({ _id: id }, req.body, { new: true })
        return res.status(201).json({ code: 201, message: "Posts Deleted Successfuly", data: updatedData });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }

}

async function updateLike(req, res) {
    try {
        const id = req.params.id;
        const data = await post.findByIdAndUpdate(id, { $inc: { likes: 1 } });
        return res.status(201).json({ code: 201, message: "Post Liked Successfully", likeCount: data.likes });
    } catch (error) {
        res.status(500).json({ code: 500, error: error.message });
    }
}

export default { publishPost, getPosts, deletePost, updatePost, updateLike }
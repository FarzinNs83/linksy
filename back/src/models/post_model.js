import mongoose, { model, Schema } from "mongoose";

const post = new mongoose.Schema({
    user: { type: mongoose.Schema.Types.ObjectId, required: true, ref: "User" },
    title: { type: String, required: true },
    image: { type: String, required: true },
    likes: { type: Number, default: 0 },
    commentCount: { type: Number, default: 0 },
    comments: [{ type: Schema.Types.ObjectId, ref: "Comments" }]
}, { timestamps: true });

export default model("Post", post);
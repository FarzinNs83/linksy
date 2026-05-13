import mongoose, { model, Schema } from "mongoose";

const user = new mongoose.Schema({
    name: { type: String, required: true },
    image: { type: String, default: '' },
    bio: { type: String, default: '' },
    email: { type: String, required: true, unique: true, match: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/ },
    pw: { type: String, required: true, minLength: 8 },
    followers: { type: Number, default: 0 },
    followings: { type: Number, default: 0 },
    postCount: { type: Number, default: 0 },
    posts: [{ type: Schema.Types.ObjectId, required: true, ref: "Post" }]
}, { timestamps: true });

export default model("User", user);
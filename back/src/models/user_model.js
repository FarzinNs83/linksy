import mongoose, { model, Schema } from "mongoose";

const user = new mongoose.Schema({
    name: { type: String, required: true },
    image: { type: String, default: '' },
    username: { type: String, required: true },
    bio: { type: String, default: '' },
    email: { type: String, required: true, unique: true, match: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/ },
    pw: { type: String, required: true, minLength: 8 },
    followers: { type: Number, default: 0 },
    followings: { type: Number, default: 0 },
    postCount: { type: Number, default: 0 },
    posts: [{ type: Schema.Types.ObjectId, required: true, ref: "Post" }],
    socials: [{ type: String, default: [] }],
    cats: [{ type: String, default: [] }],
    bookmark: [{ type: Schema.Types.ObjectId, ref: "Post" }],
}, {
    timestamps: true,
});

export default model("User", user);
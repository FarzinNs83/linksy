import mongoose, { model, Schema } from "mongoose";

const comments = new Schema({
    comment: { type: String, required: true },
    isEdited: { type: Boolean, default: false },
    user: { type: Schema.Types.ObjectId, required: true, ref: "User" },
}, { timestamps: true });

export default model("Comments", comments);
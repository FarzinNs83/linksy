import mongoose, { model, Schema } from "mongoose";

const cats = new mongoose.Schema({
    categories : [{ type: String, required: true }],

}, { timestamps: true });

export default model("Cats", cats);
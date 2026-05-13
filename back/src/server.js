import 'dotenv/config';
import express from 'express';
const app = express();
import cors from 'cors';
import db from "./config/db.js";
import router from "./routes/index.js";
import upload from "./utils/upload.js";
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(upload.single('image'));
app.use(router);
db.connectDb();
app.listen(process.env.PORT, () => {
    console.log("Connected to server");

});
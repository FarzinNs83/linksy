import express from 'express';
const router = express.Router();
import api from "./api-v1/v1.js";

router.use("/api/v1/", api);

export default router;
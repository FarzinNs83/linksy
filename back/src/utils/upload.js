import multer from "multer";
import path from "path";

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "images/");
    },

    filename: function (req, file, cb) {
        const fileName =
            Date.now() + path.extname(file.originalname);

        cb(null, fileName);
    },
});

const fileFilter = function (req, file, cb) {
    if (
        file.mimetype === "image/jpeg" ||
        file.mimetype === "image/png" ||
        file.mimetype === "image/jpg"
    ) {
        cb(null, true);
    } else {
        cb(new Error("File type not supported!"), false);
    }
};

const upload = multer({
    storage,
    fileFilter,
});

export default upload;
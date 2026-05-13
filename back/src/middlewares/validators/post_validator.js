import { body, query } from "express-validator"
import BaseValidator from "./base_validator.js"

export default class PostValidator {
    static addPostValidator() {
        return [
            body("user").notEmpty().isMongoId().withMessage("User Id is required").bail(),
            body("title").notEmpty().withMessage("Title is required"),
            BaseValidator.validator
        ];
    }
    static deletePostValidator() {
        return [
            body("id").notEmpty().isMongoId().withMessage("Id is required"),
            BaseValidator.validator
        ];
    }
    static updatePostValidator() {
        return [
            body("id").notEmpty().isMongoId().withMessage("Id is required").bail(),
            BaseValidator.validator
        ];
    }
}

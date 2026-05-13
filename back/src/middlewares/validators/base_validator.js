import { validationResult } from "express-validator"

export default class BaseValidator {
  static validator(req, res, next) {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ code: 400, errors: errors.array().map(err => err.msg) });
    }
    next();
  }
}

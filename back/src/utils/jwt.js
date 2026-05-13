import jwt from "jsonwebtoken";

async function generateToken(userId) {
  const token = jwt.sign({ userId: userId }, process.env.JWT_SECRET, { expiresIn: process.env.JWT_EXPIRES_IN });
  return token;
}
export default generateToken;

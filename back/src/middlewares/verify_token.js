import jwt from 'jsonwebtoken'

function verifyToken(req, res, next) {
  const header = req.headers.authorization
  if (!header) {
    return res.status(401).json({ message: 'Authorization header missing' })
  }
  const [type, token] = header.split(' ')
  if (type != 'Bearer' || !token) {
    res.status(401).json({ message: 'Invalid authorization format. Use : Bearer <token>' })
  }

  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET)
    req.user = payload
    next()
  } catch (error) {
    return res.status(401).json({ message: "Invalid / Expired token" });
  }
}
export default verifyToken

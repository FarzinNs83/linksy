import express from 'express';
const router = express.Router();
import auth from "../../controllers/user_controller.js";
import post from "../../controllers/post_controller.js"
import comments from '../../controllers/comments_controller.js';
import PostValidator  from '../../middlewares/validators/post_validator.js';
import verifyToken from '../../middlewares/verify_token.js';

//Auth
router.post('/register', auth.register);
router.post('/login', auth.login);
router.get('/getUser/:id', auth.getUser);
router.put('/updateUser/:uid', auth.updateUser);
//Posts
router.post('/publishPost',post.publishPost);
router.get('/getPosts', post.getPosts);
router.delete('/deletePost/:id', post.deletePost);
router.put('/updatePost/:id', post.updatePost);
router.put('/updateLike/:id', post.updateLike);
//Comments
router.get('/getComments', comments.getComments);
router.get('/postComment', comments.postComment);

export default router;
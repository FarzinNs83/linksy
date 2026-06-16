import express from 'express';
const router = express.Router();
import auth from "../../controllers/user_controller.js";
import post from "../../controllers/post_controller.js"
import comments from '../../controllers/comments_controller.js';
import PostValidator  from '../../middlewares/validators/post_validator.js';
import verifyToken from '../../middlewares/verify_token.js';
import upload from '../../utils/upload.js';

//User
router.post('/register',upload.single('image'), auth.register); //Done
router.post('/login', auth.login); //Done
router.get('/getUser/:id', auth.getUser);
router.get('/searchUser', auth.searchUser);
router.put('/updateUser/:uid', upload.single('image'), auth.updateUser);
//Posts
router.post('/publishPost',upload.single('image'),post.publishPost);
router.get('/getPosts', post.getPosts); //Done
router.delete('/deletePost/:id', post.deletePost);
router.put('/updatePost/:id', post.updatePost);
router.put('/updateLike/:id', post.updateLike);
//Comments
router.get('/getComments', comments.getComments); //Done
router.post('/postComment', comments.postComment);

export default router;
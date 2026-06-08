import 'dart:io';

class UrlConst {
  UrlConst._();
  static String base = Platform.isWindows ? "http://localhost:3000/api/v1" : "http://10.0.2.2:3000/api/v1" ;
  static String login = "$base/login";
  static String register = "$base/register";
  static String getUser = "$base/getUser";
  static String getPosts = "$base/getPosts";
  static String publishPost = "$base/publishPost";
  static String deletePost = "$base/deletePost";
  static String updatePost = "$base/updatePost";
  static String updateLike = "$base/updateLike";
  static String images = Platform.isWindows ?"http://localhost:3000/images/" : "http://10.0.2.2:3000/images/";
}

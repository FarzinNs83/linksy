import '../../../../core/constant/url_const.dart';
import '../../domain/entities/user_detail_entity.dart';
class UserDetailModel {
  final String id;
  final String name;
  final String image;
  final String username;
  final String email;

  UserDetailModel({
    required this.id,
    required this.name,
    required this.image,
    required this.username,
    required this.email,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      id: json['_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      image: "${UrlConst.images}${json['image']}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'username': username,
      'email': email,
    };
  }
}
extension UserDetailMapper on UserDetailModel {
  UserDetailEntity toEntity() {
    return UserDetailEntity(
      id: id,
      name: name,
      image: image,
      username: username,
      email: email,
    );
  }
}
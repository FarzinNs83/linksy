import '../../../../core/constant/url_const.dart';
import '../../domain/entities/user_detail_entity.dart';
class UserDetailModel {
  final String id;
  final String name;
  final String image;

  UserDetailModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      id: json['_id'],
      name: json['name'],
      image: "${UrlConst.images}${json['image']}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
    };
  }
}
extension UserDetailMapper on UserDetailModel {
  UserDetailEntity toEntity() {
    return UserDetailEntity(
      id: id,
      name: name,
      image: image,
    );
  }
}
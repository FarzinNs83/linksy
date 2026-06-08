import 'package:front/features/home/data/models/user_detail_model.dart';

import '../../domain/entities/comment_entity.dart';


class CommentModel {
  final String id;
  final String comment;
  final UserDetailModel? user;
  CommentModel({required this.id, required this.comment, required this.user});
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      comment: json['comment'],
      user: json['user'] != null ? UserDetailModel.fromJson(json['user']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'comment': comment, 'user': user};
  }
}
extension CommentMapper on CommentModel {
  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      comment: comment,
      user: user?.toEntity(),
    );
  }
}
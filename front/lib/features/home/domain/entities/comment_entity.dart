import 'package:front/features/home/domain/entities/user_detail_entity.dart';

class CommentEntity {
  final String id;
  final String comment;
  final UserDetailEntity? user;
  CommentEntity({required this.id, required this.comment, required this.user});
  factory CommentEntity.fromJson(Map<String, dynamic> json) {
    return CommentEntity(
      id: json['id'],
      comment: json['comment'],
      user: json['user'] != null ? UserDetailEntity.fromJson(json['user']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'comment': comment, 'user': user};
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => _HomeModel(
  id: json['_id'] as String,
  title: json['title'] as String,
  image: json['image'] as String,
  likes: (json['likes'] as num).toInt(),
  commentCount: (json['commentCount'] as num).toInt(),
  comments: (json['comments'] as List<dynamic>)
      .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  user: UserDetailModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeModelToJson(_HomeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'likes': instance.likes,
      'commentCount': instance.commentCount,
      'comments': instance.comments,
      'user': instance.user,
    };

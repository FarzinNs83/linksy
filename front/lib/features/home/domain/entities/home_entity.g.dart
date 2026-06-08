// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) => _HomeEntity(
  id: json['_id'] as String,
  title: json['title'] as String,
  image: json['image'] as String,
  likes: (json['likes'] as num).toInt(),
  commentCount: (json['commentCount'] as num).toInt(),
  user: UserDetailEntity.fromJson(json['user'] as Map<String, dynamic>),
  comments: (json['comments'] as List<dynamic>)
      .map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeEntityToJson(_HomeEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'likes': instance.likes,
      'commentCount': instance.commentCount,
      'user': instance.user,
      'comments': instance.comments,
    };

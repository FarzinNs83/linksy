// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublishPostModel _$PublishPostModelFromJson(Map<String, dynamic> json) =>
    _PublishPostModel(
      id: json['_id'] as String,
      uid: json['user'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$PublishPostModelToJson(_PublishPostModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.uid,
      'title': instance.title,
      'image': instance.image,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublishPostEntity _$PublishPostEntityFromJson(Map<String, dynamic> json) =>
    _PublishPostEntity(
      id: json['_id'] as String,
      uid: json['user'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$PublishPostEntityToJson(_PublishPostEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.uid,
      'title': instance.title,
      'image': instance.image,
    };

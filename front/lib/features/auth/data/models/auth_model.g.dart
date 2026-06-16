// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => _AuthModel(
  id: json['_id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  pw: json['pw'] as String,
  image: json['image'] as String,
  username: json['username'] as String,
);

Map<String, dynamic> _$AuthModelToJson(_AuthModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'pw': instance.pw,
      'image': instance.image,
      'username': instance.username,
    };

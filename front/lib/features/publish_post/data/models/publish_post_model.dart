import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/publish_post_entity.dart';

part 'publish_post_model.freezed.dart';
part 'publish_post_model.g.dart';

@freezed
abstract class PublishPostModel with _$PublishPostModel {
  const factory PublishPostModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "user") required String uid,
    required String title,
    required String image,
  }) = _PublishPostModel;

  factory PublishPostModel.fromJson(Map<String, dynamic> json) =>
      _$PublishPostModelFromJson(json);
}

extension PublishPostMapper on PublishPostModel {
  PublishPostEntity toEntity() {
    return PublishPostEntity(
      id: id,
      uid: uid,
      title: title,
      image: image,
    );
  }
}

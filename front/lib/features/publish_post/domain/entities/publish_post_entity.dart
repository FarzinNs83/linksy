import 'package:freezed_annotation/freezed_annotation.dart';

part 'publish_post_entity.freezed.dart';
part 'publish_post_entity.g.dart';

@freezed
abstract class PublishPostEntity with _$PublishPostEntity {
  const factory PublishPostEntity({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "user") required String uid,
    required String title,
    required String image,
  }) = _PublishPostEntity;

  factory PublishPostEntity.fromJson(Map<String, dynamic> json) =>
      _$PublishPostEntityFromJson(json);
}

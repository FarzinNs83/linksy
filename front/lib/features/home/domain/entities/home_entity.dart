import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/home/domain/entities/comment_entity.dart';
import 'package:front/features/home/domain/entities/user_detail_entity.dart';
part 'home_entity.freezed.dart';
part 'home_entity.g.dart';

@freezed
abstract class HomeEntity with _$HomeEntity {
  const factory HomeEntity({
    @JsonKey(name: "_id") required String id,
    required String title,
    required String image,
    required int likes,
    required int commentCount,
    required UserDetailEntity user,
    required List<CommentEntity> comments,
  }) = _HomeEntity;

  factory HomeEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeEntityFromJson(json);
}

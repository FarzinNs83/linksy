import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    @JsonKey(name: "_id") required String id,
    required String name,
    required String email,
    required String pw,
    required String image,
    required String username,
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    @JsonKey(name: "_id") required String id,
    required String name,
    required String email,
    required String pw,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

extension AuthMapper on AuthEntity {
  AuthModel toModel() {
    return AuthModel(id: id, name: name, email: email, pw: pw);
  }
}

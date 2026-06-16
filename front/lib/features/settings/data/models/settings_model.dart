import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/settings_entity.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
abstract class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @JsonKey(name: "_id") required String id,
    String? name,
    String? email,
    String? username,
    String? image,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}

extension SettingsMapper on SettingsModel {
  SettingsEntity toEntity() {
    return SettingsEntity(
      id: id,
      name: name,
      email: email,
      username: username,
      image: image,
    );
  }
}
extension SettingsEntityMapper on SettingsEntity {
  SettingsModel toModel() {
    return SettingsModel(
      id: id,
      name: name,
      email: email,
      username: username,
      image: image,
    );
  }
}

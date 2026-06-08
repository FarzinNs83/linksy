import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/constant/url_const.dart';
import 'package:front/features/home/data/models/comment_model.dart';
import 'package:front/features/home/data/models/user_detail_model.dart';
import '../../domain/entities/home_entity.dart';
part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    @JsonKey(name: "_id") required String id,
    required String title,
    required String image,
    required int likes,
    required int commentCount,
    required List<CommentModel> comments,
    required UserDetailModel user,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}

extension HomeMapper on HomeModel {
  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      title: title,
      image: "${UrlConst.images}$image",
      likes: likes,
      commentCount: commentCount,
      user: user.toEntity(),
      comments: comments.map((c) => c.toEntity()).toList(),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publish_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublishPostModel {

@JsonKey(name: "_id") String get id;@JsonKey(name: "user") String get uid; String get title; String get image;
/// Create a copy of PublishPostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishPostModelCopyWith<PublishPostModel> get copyWith => _$PublishPostModelCopyWithImpl<PublishPostModel>(this as PublishPostModel, _$identity);

  /// Serializes this PublishPostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishPostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,title,image);

@override
String toString() {
  return 'PublishPostModel(id: $id, uid: $uid, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class $PublishPostModelCopyWith<$Res>  {
  factory $PublishPostModelCopyWith(PublishPostModel value, $Res Function(PublishPostModel) _then) = _$PublishPostModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "user") String uid, String title, String image
});




}
/// @nodoc
class _$PublishPostModelCopyWithImpl<$Res>
    implements $PublishPostModelCopyWith<$Res> {
  _$PublishPostModelCopyWithImpl(this._self, this._then);

  final PublishPostModel _self;
  final $Res Function(PublishPostModel) _then;

/// Create a copy of PublishPostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? title = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PublishPostModel].
extension PublishPostModelPatterns on PublishPostModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublishPostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublishPostModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublishPostModel value)  $default,){
final _that = this;
switch (_that) {
case _PublishPostModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublishPostModel value)?  $default,){
final _that = this;
switch (_that) {
case _PublishPostModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "user")  String uid,  String title,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublishPostModel() when $default != null:
return $default(_that.id,_that.uid,_that.title,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "user")  String uid,  String title,  String image)  $default,) {final _that = this;
switch (_that) {
case _PublishPostModel():
return $default(_that.id,_that.uid,_that.title,_that.image);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "user")  String uid,  String title,  String image)?  $default,) {final _that = this;
switch (_that) {
case _PublishPostModel() when $default != null:
return $default(_that.id,_that.uid,_that.title,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublishPostModel implements PublishPostModel {
  const _PublishPostModel({@JsonKey(name: "_id") required this.id, @JsonKey(name: "user") required this.uid, required this.title, required this.image});
  factory _PublishPostModel.fromJson(Map<String, dynamic> json) => _$PublishPostModelFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override@JsonKey(name: "user") final  String uid;
@override final  String title;
@override final  String image;

/// Create a copy of PublishPostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishPostModelCopyWith<_PublishPostModel> get copyWith => __$PublishPostModelCopyWithImpl<_PublishPostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublishPostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishPostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,title,image);

@override
String toString() {
  return 'PublishPostModel(id: $id, uid: $uid, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class _$PublishPostModelCopyWith<$Res> implements $PublishPostModelCopyWith<$Res> {
  factory _$PublishPostModelCopyWith(_PublishPostModel value, $Res Function(_PublishPostModel) _then) = __$PublishPostModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "user") String uid, String title, String image
});




}
/// @nodoc
class __$PublishPostModelCopyWithImpl<$Res>
    implements _$PublishPostModelCopyWith<$Res> {
  __$PublishPostModelCopyWithImpl(this._self, this._then);

  final _PublishPostModel _self;
  final $Res Function(_PublishPostModel) _then;

/// Create a copy of PublishPostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? title = null,Object? image = null,}) {
  return _then(_PublishPostModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

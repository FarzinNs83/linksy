// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publish_post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublishPostEntity {

@JsonKey(name: "_id") String get id;@JsonKey(name: "user") String get uid; String get title; String get image;
/// Create a copy of PublishPostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishPostEntityCopyWith<PublishPostEntity> get copyWith => _$PublishPostEntityCopyWithImpl<PublishPostEntity>(this as PublishPostEntity, _$identity);

  /// Serializes this PublishPostEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishPostEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,title,image);

@override
String toString() {
  return 'PublishPostEntity(id: $id, uid: $uid, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class $PublishPostEntityCopyWith<$Res>  {
  factory $PublishPostEntityCopyWith(PublishPostEntity value, $Res Function(PublishPostEntity) _then) = _$PublishPostEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "user") String uid, String title, String image
});




}
/// @nodoc
class _$PublishPostEntityCopyWithImpl<$Res>
    implements $PublishPostEntityCopyWith<$Res> {
  _$PublishPostEntityCopyWithImpl(this._self, this._then);

  final PublishPostEntity _self;
  final $Res Function(PublishPostEntity) _then;

/// Create a copy of PublishPostEntity
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


/// Adds pattern-matching-related methods to [PublishPostEntity].
extension PublishPostEntityPatterns on PublishPostEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublishPostEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublishPostEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublishPostEntity value)  $default,){
final _that = this;
switch (_that) {
case _PublishPostEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublishPostEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PublishPostEntity() when $default != null:
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
case _PublishPostEntity() when $default != null:
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
case _PublishPostEntity():
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
case _PublishPostEntity() when $default != null:
return $default(_that.id,_that.uid,_that.title,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublishPostEntity implements PublishPostEntity {
  const _PublishPostEntity({@JsonKey(name: "_id") required this.id, @JsonKey(name: "user") required this.uid, required this.title, required this.image});
  factory _PublishPostEntity.fromJson(Map<String, dynamic> json) => _$PublishPostEntityFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override@JsonKey(name: "user") final  String uid;
@override final  String title;
@override final  String image;

/// Create a copy of PublishPostEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishPostEntityCopyWith<_PublishPostEntity> get copyWith => __$PublishPostEntityCopyWithImpl<_PublishPostEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublishPostEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishPostEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,title,image);

@override
String toString() {
  return 'PublishPostEntity(id: $id, uid: $uid, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class _$PublishPostEntityCopyWith<$Res> implements $PublishPostEntityCopyWith<$Res> {
  factory _$PublishPostEntityCopyWith(_PublishPostEntity value, $Res Function(_PublishPostEntity) _then) = __$PublishPostEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "user") String uid, String title, String image
});




}
/// @nodoc
class __$PublishPostEntityCopyWithImpl<$Res>
    implements _$PublishPostEntityCopyWith<$Res> {
  __$PublishPostEntityCopyWithImpl(this._self, this._then);

  final _PublishPostEntity _self;
  final $Res Function(_PublishPostEntity) _then;

/// Create a copy of PublishPostEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? title = null,Object? image = null,}) {
  return _then(_PublishPostEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

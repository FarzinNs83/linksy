class UserDetailEntity {
  final String id;
  final String name;
  final String image;

  UserDetailEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  factory UserDetailEntity.fromJson(Map<String, dynamic> json) {
    return UserDetailEntity(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
    };
  }
}
class UserDetailEntity {
  final String id;
  final String name;
  final String username;
  final String image;
  final String? email;

  UserDetailEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.image,
    required this.email,
  });

  UserDetailEntity copyWith({
    String? id,
    String? name,
    String? username,
    String? image,
    String? email,
  }) {
    return UserDetailEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      image: image ?? this.image,
      email: email ?? this.email,
    );
  }

  factory UserDetailEntity.fromJson(Map<String, dynamic> json) {
    return UserDetailEntity(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'username': username,
      'email': email,
    };
  }
}
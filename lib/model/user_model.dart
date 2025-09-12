import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String quote;

  @HiveField(2)
  final String? imagePath;

  UserModel({required this.username, required this.quote, this.imagePath});

  UserModel copyWith({String? username, String? quote, String? imagePath}) {
    return UserModel(
      username: username ?? this.username,
      quote: quote ?? this.quote,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}

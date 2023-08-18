import 'package:my_app/models/post_model.dart';

class AccountModel {
  String name;
  String nickname;
  List<String>? followers;
  List<String>? following;
  String description;
  String location;
  DateTime joinedAt;
  String profilePicture;
  String bannerPicture;
  bool verified;
  List<PostModel>? posts;
  
  AccountModel({
    required this.name,
    required this.nickname,
    required this.followers,
    required this.following,
    required this.description,
    required this.location,
    required this.joinedAt,
    required this.profilePicture,
    required this.bannerPicture,
    required this.verified,
    required this.posts
  });

    factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      name: json['name'],
      nickname: json['nickname'],
      followers: (json['followers'] as List<dynamic>).cast<String>(),
      following: (json['following'] as List<dynamic>).cast<String>(),
      description: json['description'],
      location: json['location'],
      joinedAt: DateTime.parse(json['joinedAt']),
      profilePicture: json['profilePicture'],
      bannerPicture: json['bannerPicture'],
      verified: json['verified'],
      posts: [],
    );
  }
}



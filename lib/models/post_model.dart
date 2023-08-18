// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'account_model.dart';

class PostModel {
  String accountName;
  DateTime postedAt;
  String? media;
  int description;
  int retweets;
  int likes;
  int views;
  int interactions;
  int bookmarks;
  
  PostModel({
    required this.accountName,
    required this.postedAt,
    this.media,
    required this.description,
    required this.retweets,
    required this.likes,
    required this.views,
    required this.interactions,
    required this.bookmarks,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      accountName: json['accountName'],
      postedAt: DateTime.parse(json['postedAt']),
      media: json['media'],
      description: json['description'],
      retweets: json['retweets'],
      likes: json['likes'],
      views: json['views'],
      interactions: json['interactions'],
      bookmarks: json['bookmarks'],
    );
  } 

}

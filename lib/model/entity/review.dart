import 'package:karikore/model/entity/user.dart';

class Review {
  final String id;
  final String title;
  final String description;

  final User postedBy;
  final DateTime postedAt;
  final DateTime? updatedAt;

  Review({
    required this.id,
    required this.title,
    required this.description,
    required this.postedBy,
    required this.postedAt,
    this.updatedAt
  });
}
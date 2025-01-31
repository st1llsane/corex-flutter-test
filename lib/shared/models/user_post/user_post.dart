import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post.freezed.dart';
part 'user_post.g.dart';

@freezed
class UserPost with _$UserPost {
  const factory UserPost({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);
}

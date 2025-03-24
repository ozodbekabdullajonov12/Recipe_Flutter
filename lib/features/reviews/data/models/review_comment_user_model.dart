class ReviewCommentUserModel {
  final int id;
  final String username, profilePhoto;

  ReviewCommentUserModel({
    required this.id,
    required this.username,
    required this.profilePhoto,
  });

  factory ReviewCommentUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewCommentUserModel(
      id: json["id"],
      username: json["username"],
      profilePhoto: json["profilePhoto"],
    );
  }
}

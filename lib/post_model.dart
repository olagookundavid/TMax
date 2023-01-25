class Posts {
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final num userId;
  final num? id;
  final String? title;
  final String? body;

  factory Posts.fromJson(Map<String, dynamic> map) => Posts(
        userId: map["userId"],
        id: map["id"],
        title: map["title"],
        body: map["body"],
      );
}

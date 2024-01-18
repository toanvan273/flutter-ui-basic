class Comment {
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({required this.id,required this.name,required this.email,required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'name': String name,
      'id': int id,
      'email': String email,
      'body': String body
      } =>
          Comment(
              id: id,
              name: name,
              email: email,
              body: body
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
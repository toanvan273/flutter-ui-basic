class Post {
  int id;
  String title;
  String body;

  Post({
    required this.id,
    required this.title,
    required this.body
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }


  @override
  String toString() {
    return 'Post{ id: $id title: $title body: $body }';
  }
}

List<Post> list_post = <Post>[
  Post(id: 1, title: 'title 1', body: 'body 1'),
  Post(id: 2, title: 'title 2', body: 'body 2'),
  Post(id: 3, title: 'title 3', body: 'body 3'),
  Post(id: 4, title: 'title 4', body: 'body 4'),
];
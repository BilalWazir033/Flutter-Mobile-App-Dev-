
class Post {
  final int id;
  final String title;

  Post({
    required this.id,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> data) {
    return Post(
      id: data['id'] as int,
      title: data['title'] as String,
    );
  }
}


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostService {
  static Future<List<Post>> loadPosts() async {
    final uri = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts?_limit=10',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Unable to load posts');
    }

    final rows = jsonDecode(response.body) as List<dynamic>;

    return rows
        .map((item) => Post.fromJson(
              item as Map<String, dynamic>,
            ))
        .toList();
  }
}

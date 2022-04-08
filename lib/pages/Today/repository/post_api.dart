import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tarihte_bugun_app/pages/Today/models/post_model.dart';

class PostApi {
  Future<List<Post>> getPost() async {
    // ignore: prefer_const_declarations
    final baseUrl = 'https://api.ubilisim.com/tarihtebugun/';
    final response = await http.get(Uri.parse(baseUrl));
    final json1 = jsonDecode(response.body);
    final json2 = json1["tarihtebugun"] as List;
    final posts = json2.map((e) => Post.fromJson(e)).toList();
    return posts;
  }
}

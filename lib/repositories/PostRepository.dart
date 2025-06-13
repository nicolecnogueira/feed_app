import 'package:dio/dio.dart';
import '../models/PostModel.dart';

class PostRepository {

  final Dio _dio;

  PostRepository(this._dio);

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      final List<dynamic> data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar os posts: $e');
      throw Exception('Falha ao carregar os posts');
    }
  }
}
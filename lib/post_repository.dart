import 'package:dio/dio.dart';
import 'package:tmax/post_model.dart';

class PostsRepository {
  final Dio _dio = Dio();

  // PostsRepository(this._dio);

  Future<ApiResponse<List<Posts>>> getPosts() async {
    final response =
        await _dio.get("http://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      List data = response.data;
      List<Posts> posts = data.map((post) => Posts.fromJson(post)).toList();

      return ApiResponse<List<Posts>>(
        success: true,
        data: posts,
        message: "Posts fetched successfully",
      );
    } else if (response.statusCode == 400) {
      return ApiResponse(
        success: false,
        data: null,
        message: "Auth error",
      );
    }
    return ApiResponse(
      success: false,
      data: null,
      message: "An error occurred",
    );
  }
}

//convience class
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String message;
  ApiResponse({
    required this.success,
    required this.data,
    required this.message,
  });
}

enum NetworkState { success, error, loading }

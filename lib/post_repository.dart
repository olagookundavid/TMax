import 'package:dio/dio.dart';
import 'package:tmax/api_response.dart';
import 'package:tmax/constants.dart';
import 'package:tmax/post_model.dart';

class PostsRepository {
  //former way
  // final Dio _dio = Dio();

  //dependency injection
  PostsRepository(this._dio); //constructor
  final Dio _dio;
  Future<ApiResponse<List<Posts>>> getPosts() async {
    final response = await _dio.get(AppStrings.url);
    if (response.statusCode == 200) {
      List data = response.data;
      List<Posts> posts = data.map((post) => Posts.fromJson(post)).toList();

      return ApiResponse<List<Posts>>(
        success: true,
        data: posts,
        message: AppStrings.successMsg,
      );
    } else if (response.statusCode == 400) {
      return ApiResponse(
        success: false,
        data: null,
        message: AppStrings.authErrorMsg,
      );
    }
    return ApiResponse(
      success: false,
      data: null,
      message: AppStrings.errorMsg,
    );
  }
}

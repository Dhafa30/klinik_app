import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://655c62d825b76d9884fd1be3.mockapi.io/poli',
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 3000)));

class apiClient {
  Future<Response> get(String path) async {
    try {
      final response = await dio.get(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

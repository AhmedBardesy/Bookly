import 'package:dio/dio.dart';

// raper for api $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
class ApiService {
  ApiService(this._dio);
  final _baseurl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseurl$endpoint');
    return response.data;
  }
}
 
import 'dart:typed_data';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Base url
    _dio.options.baseUrl = "http://localhost:8080/api";

    // Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  // GET path is the endpoint
  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioError catch (e) {
      // print(e.response!.data);
      throw ('Error en el servidor(get): ${e.message}');
    }
  }

  // POST path
  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el servidor(post): ${e.message}');
    }
  }

  // PUT path
  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el servidor(put): ${e.message}');
    }
  }

  // DELETE path
  static Future delete(String path) async {
    try {
      final resp = await _dio.delete(path);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el servidor(delete): ${e.message}');
    }
  }

  // UPLOAD file
  static Future uploadFile(String path, Uint8List bytes) async {
    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes),
    });
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el servidor(put): ${e.message}');
    }
  }
}

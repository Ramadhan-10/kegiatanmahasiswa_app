import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

class InfoRepository {
  final Dio _dio = Dio();

  Future addInfo(
      {required String title,
      required String content,
      required String date,
      required File image}) async {
    try {
      FormData formData = FormData.fromMap({
        'judul': title,
        'deskripsi': content,
        'tanggal': date,
        'url_image':
            await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
      });

      Response response = await _dio.post(
        'https://client-server-f.000webhostapp.com/taskapp/addinfo.php',
        data: formData,
      );
      log('${response.data}');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('failed to add information');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future getInfoList(keyword) async {
    try {
      log("GETTING INFORMATION");
      var response = await _dio.get(
        'https://client-server-f.000webhostapp.com/taskapp/listinfo.php',
        queryParameters: {'key': keyword},
      );
      log("list $response");

      if (response.statusCode == 200) {
        List infoList = response.data;
        return infoList;
      } else {
        log('Error: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      log('Dio Error: $error');
    }
  }

  Future selectInfo(String id) async {
    FormData formData = FormData.fromMap({
      'idinfo': id,
    });
    final response = await _dio.post(
      'https://client-server-f.000webhostapp.com/taskapp/selectdata.php',
      data: formData,
    );
    Map<String, dynamic> responseData =
        Map<String, dynamic>.from(response.data);
    log("Res $responseData");
    if (responseData['success'] == true) {
      responseData['data']['status'] = true;
      return responseData['data'];
    } else {
      return {'status': false, 'msg': responseData['msg']};
    }
  }

  Future deleteInfo(String id) async {
    try {
      FormData formData = FormData.fromMap({
        'idinfo': id,
      });
      final response = await _dio.post(
        'https://client-server-f.000webhostapp.com/taskapp/deleteinfo.php',
        data: formData,
      );
      Map responseData = response.data;
      log("Res $responseData");
      if (responseData['status'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw error.toString();
    }
  }

  Future editInfo(
      {required String id,
      required String title,
      required String content,
      required String date,
      File? image}) async {
    try {
      FormData formData = FormData.fromMap({
        'idinfo': id,
        'judul': title,
        'deskripsi': content,
        'tanggal': date,
      });
      if (image != null) {
        formData = FormData.fromMap({
          'idinfo': id,
          'judul': title,
          'deskripsi': content,
          'tanggal': date,
          'url_image':
              await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
        });
      }

      Response response = await _dio.post(
        'https://client-server-f.000webhostapp.com/taskapp/editinfo.php',
        data: formData,
      );
      log("RES ${response.data}");

      if (response.statusCode == 200 && response.data['status'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

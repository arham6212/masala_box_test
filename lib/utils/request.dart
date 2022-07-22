import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:masala_box_test/components/toast.dart';

import '../common/config.dart';
import 'tools.dart';

enum ConnectionType { post, get, put, delete }

class Request {
  static final Dio _dio = Dio();



  static Future send(String endPoint,
      {required ConnectionType connectionType,
      Map<String, dynamic>? body}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Options options = Options(
          validateStatus: (status) => true,
          sendTimeout: 100000,
          receiveTimeout: 100000,
        );
        body ??= {};

        String fullURL = Configuration.baseUrl + endPoint + '?client_id=${Configuration.clientId}';
        Response response;
        Tools.printLog(fullURL);
        Tools.printLog(connectionType.toString());
        Tools.printLog(json.encode(body));

        switch (connectionType) {
          case ConnectionType.get:
            response = await _dio.get(fullURL, options: options);
            break;
          case ConnectionType.post:
            response = await _dio.post(
              fullURL,
              options: options,
              data: body,
            );
            break;
          case ConnectionType.put:
            response = await _dio.put(
              fullURL,
              options: options,
              data: body,
            );
            break;
          case ConnectionType.delete:
            response = await _dio.delete(
              fullURL,
              options: options,
              data: body,
            );
            break;
        }
        int statusCode = 200;
        var errorMessage = 'Something went wrong !';
        // check if error message exist
        if (statusCode < 200 || statusCode > 399) {
          errorMessage = response.data['message'];
        }
        // check forbidden access
        if (statusCode == 403 || statusCode == 401) {
          // Do something here
        }
        //other error code
        if (statusCode < 200 || statusCode > 399) {
          return throw Exception(errorMessage);
        }
        // success
        if (response.data is bool) {
          return {'flash': response.data};
        }
        return response.data;
      } else {
        toast('Internet is not working at this moment');
        return throw Exception(
            'Seems like your internet is not working, please check your connection and try again');
      }
    } on SocketException catch (_) {
      return throw Exception(
          'Seems like your internet is not working, please check your connection and try again');
    } on TimeoutException catch (error) {
      return throw Exception(
          error.message); // 'Connection Timeout! Try again later'
    } catch (error) {
      // check unauthorize access
      // if (error.response.statusCode == 401 ||
      //     error.response.statusCode == 403) {
      //   eventBus.fire(UserUnauthorizeEvent(
      //       message: error.response.statusMessage ?? 'Something went wrong !'));
      // }
      return throw Exception(error);
    }
  }
}

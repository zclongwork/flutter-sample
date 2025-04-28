import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logger/logger.dart';

import 'Url.dart';

var logger = Logger(printer: PrettyPrinter());

class HttpManager {

  late Dio _dio;

  static final HttpManager _instance = HttpManager._internal();

  factory HttpManager() {
    return _instance;
  }

  HttpManager._internal() {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
        baseUrl: Url.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5));
    _dio = Dio(options);
    // 需要抓包的话，可将下方代码 开启
   initAdapter();
  }


  // 模拟器配置代理：
  // adb shell settings put global http_proxy 10.200.45.140:8888
  // 移除代理：
  // adb shell settings delete global http_proxy
  void initAdapter() {
    _dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
      // Config the client.
      return HttpClient()
        ..findProxy = (uri) {
          return 'PROXY 10.200.45.140:8888'; // 代理服务器地址和端口
          // return 'PROXY 192.168.18.238:8888'; // 代理服务器地址和端口
        }
        ..badCertificateCallback = (cert, host, port) => true; // 忽略证书验
    });
  }

  Future<Response> _get(String url,
      {Map<String, dynamic>? queryParameters,
      }) async {
    Response response = await _dio.get(url,
      queryParameters: queryParameters,);
    return response;
  }

  void getData(String url,
      {Map<String, String>? headers,
      required Function(Map<String, dynamic> json) success,
      required Function fail,
      Function? complete}) async {
    try {
      // var httpClient = new HttpClient();

      var response = await _get(url);
      if (response.statusCode == 200) {
        var result = response.data;
        success(result);
      } else {
        logger.e("error $url ${response.statusCode}");
        throw Exception('"Request failed with status: ${response.statusCode}"');

      }
    } catch (e) {
      fail(e);
      logger.e("error getData $url ${e.toString()}");
    } finally {
      if (complete != null) {
        complete();
      }
    }
  }

  Future requestData(String url, {Map<String, String>? headers}) async {
    try {
      var response = await _get(url, queryParameters: headers);

      if (response.statusCode == 200) {
        var result = response.data;
        return result;
      } else {
        throw Exception('"Request failed with status: ${response.statusCode}"');
      }
    } catch (e) {
      Future.error(e);
    }
  }

}

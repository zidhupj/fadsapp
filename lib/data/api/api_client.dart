import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    token = "";
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      return await get(uri);
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }

  Future<Response> postData(String uri, Map<String, dynamic> data) async {
    try {
      print(data);
      return await post(uri, data);
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}

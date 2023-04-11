import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource extends GetConnect implements GetxService {
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  RemoteDataSource({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(minutes: 5);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }

  Future<Response> getData(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      print("Error from the api client is " + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<http.Response> postData(String url, Map data) async {
    try {
      final response = await http.post(Uri.parse(url), body: data);
      print("response.hashCode");
      print(response.hashCode);
      print(response.body);
      return response;
    } catch (e) {
      print("Error from the api client is : " + e.toString());
      return http.Response(e.toString(), 500);
    }
  }
}

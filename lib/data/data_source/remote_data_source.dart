import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/main.dart';

class RemoteDataSource extends GetConnect implements GetxService {
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  TokenResponse? _tokenResponse;
  RemoteDataSource({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(minutes: 5);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }

  Future<bool> withPassword(String email, String password) async {
    try {
      String grantType = 'password';
      String withRefreshToken = 'true';
      String refreshToken = '';
      Map formData = <String, dynamic>{};
      formData['grantType'] = grantType;
      formData['email'] = email;
      formData['password'] = password;
      formData['withRefreshToken'] = withRefreshToken;
      formData['refreshToken'] = refreshToken;
      http.Response response = await http.post(
        Uri.parse('${AppConstants.BASE_URL}/token'),
        body: formData,
      );
      _tokenResponse = TokenResponse.fromJson(jsonDecode(response.body));
      print(_tokenResponse!.accessToken);
      sharedPreferences.setString(
          AppConstants.REFRESH_TOKEN, _tokenResponse!.refreshToken.toString());
      _mainHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_tokenResponse!.accessToken}'
      };
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(http.Response(e.toString(), e.hashCode));
      return false;
    }
  }

  Future<bool> withRefreshToken(String? refreshToken) async {
    try {
      String grantType = 'refreshToken';
      String withRefreshToken = 'true';
      Map formData = <String, dynamic>{};
      formData['grantType'] = grantType;
      formData['email'] = '';
      formData['password'] = '';
      formData['withRefreshToken'] = withRefreshToken;
      formData['refreshToken'] = refreshToken;
      http.Response response = await http.post(
        Uri.parse('${AppConstants.BASE_URL}/token'),
        body: formData,
      );
      _tokenResponse = TokenResponse.fromJson(jsonDecode(response.body));
      sharedPreferences.setString(
          AppConstants.REFRESH_TOKEN, _tokenResponse!.refreshToken.toString());
      _mainHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_tokenResponse!.accessToken}'
      };
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(http.Response(e.toString(), e.hashCode));
      return false;
    }
  }

  Future<Response> getData(String url) async {
    try {
      // bool istokens = await withRefreshToken(
      //     sharedPreferences.getString(AppConstants.REFRESH_TOKEN));
      // if (istokens) {
      Response response = await get(url, headers: _mainHeaders);
      // print("get");
      // print(response.body);
      print(response.headers);
      return response;
      // } else {
      //   return const Response(statusCode: 1, statusText: "401");
      // }
    } catch (e) {
      // ignore: avoid_print
      print("Error from the api client is $e");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<http.Response> postData(String url, Map data) async {
    try {
      // bool tokens = await withRefreshToken(
      //     sharedPreferences.getString(AppConstants.REFRESH_TOKEN));
      final response =
          await http.post(Uri.parse(url), body: data, headers: _mainHeaders);
      // print("response.hashCode");
      // print(response.hashCode);
      // print(response.body);
      return response;
    } catch (e) {
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print("Error from the api client is : " + e.toString());
      return http.Response(e.toString(), 500);
    }
  }

  Future<http.Response> postLogin(
      String url, Map data, String email, String password) async {
    try {
      bool tokens = await withPassword(email, password);
      final response =
          await http.post(Uri.parse(url), body: data, headers: _mainHeaders);
      // print("response.hashCode");
      // print(response.hashCode);
      // print(response.body);
      return response;
    } catch (e) {
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print("Error from the api client is : " + e.toString());
      return http.Response(e.toString(), 500);
    }
  }

  Future<Response> postRequest(String url, Map data) async {
    try {
      Response response = await post(url, data, headers: _mainHeaders);
      return response;
    } catch (e) {
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print("Error from the api client is " + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}

class TokenResponse {
  String? accessToken;
  String? refreshToken;

  TokenResponse({this.accessToken, this.refreshToken});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

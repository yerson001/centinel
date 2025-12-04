import 'dart:convert';
import 'package:sivcam/core/errors/auth/auth_listToString.dart';
import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/login/data/api/apiConfig.dart';
import 'package:http/http.dart' as http;
import 'package:sivcam/features/auth/login/data/models/authResponse.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String dni, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/login');
      Map<String, String> headers = {'Content-type': 'application/json'};
      String body = json.encode({'dni': dni, 'password': password});
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print('data remote: ${authResponse.token}');
        return SuccessResource(authResponse);
      } else {
        return ErrorResource(listToString(data['message']));
      }
    } catch (e) {
      print('Error $e');
      return ErrorResource(e.toString());
    }
  }
}

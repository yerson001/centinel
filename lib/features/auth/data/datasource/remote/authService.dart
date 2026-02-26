import 'dart:convert';
import 'package:sivcam/core/constants/apiConstants.dart';
import 'package:sivcam/core/errors/auth/auth_listToString.dart';
import 'package:sivcam/core/errors/resource.dart';
import 'package:http/http.dart' as http;
import 'package:sivcam/features/auth/data/models/authResponse.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String dni, String password) async {
    try {
      Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.loginEndPoint);
      String body = json.encode({'dni': dni, 'password': password});
      final response = await http.post(
        url,
        headers: ApiConstants.headers,
        body: body,
      );
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

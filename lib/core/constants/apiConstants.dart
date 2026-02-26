class ApiConstants {
  //static const String baseUrl = '104.225.141.191'; //server
  //static const String baseUrl = '192.168.1.49';     //local
  static const String baseUrl = '192.168.18.26:3000';
  static const int port = 3000;
  static const String ApiGoogleMaps = 'AIzaSyCz2_cuCf3LfiR-gjQBD-GXdIiCYOtpLMo';

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  //EndPoints
  static const String loginEndPoint = '/auth/login';
  static const String registerEndPoint = '/auth/register';
  static const String finallEndPoint = '/users/';
}

import 'package:http/http.dart';


enum Method {
  GET,
  POST
}

abstract class AuthBase
{
  var client      = null;
  String? address = null;

  AuthBase(String address){
    this.address = address;
  }

  Future<Response> make_http_request(String path, Method method, { Map<String, String>? querryParams = null, Object body = ""});
}
import 'dart:io';

import 'package:jenkins_remote_api/auth/auth_base.dart';
import 'package:http/http.dart';
import 'package:http_auth/http_auth.dart'                 as http_auth;

class HttpAuth extends AuthBase
{
  String? username;
  String? password;

  HttpAuth(String address, String username, String password) : super(address)
  {
    this.username = username;
    this.password = password;

    this.client = http_auth.BasicAuthClient(username, password);
  }


  @override
  Future<Response> make_http_request(String path, Method method, { Map<String, String>? querryParams = null, Object body = ""})
  {
    Future<Response> response;

    switch(method)
    {
      case Method.GET   : response = client.get(Uri.parse("$address/$path")); break;
      case Method.POST  : response = client.post(Uri.http(address.toString(), path),body); break;
      default: { throw Exception("Http request method ($method) not support!"); }
    }
    return response;
  }
}
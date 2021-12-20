import 'dart:convert';

import 'package:jenkins_remote_api/auth/auth_base.dart';
import 'package:jenkins_remote_api/auth/http_auth.dart';
import 'package:jenkins_remote_api/jenkins_remote_api.dart';

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart'           as http;
import 'package:http_auth/http_auth.dart' as http_auth;
import 'dart:convert';

void main() async {

  var url      = Uri.parse("http://127.0.0.1/computer/api/json");
  var username = "username";
  var password = "password";

  // Map<String, String> headerParams = {};
  // headerParams['Content-Type'] = "application/json";


  // var client    = http_auth.BasicAuthClient(username, password);
  // var response  = await client.get(url);

  HttpAuth client = new HttpAuth(url, username, password);

  var response = await client.make_http_request("/computer/api/json", Method.GET);

  print(response.body);


  Map<String,dynamic> res_json = json.decode(response.body);


  res_json.forEach((key, value) {
    print("$key => $value");
  });

  var file = await File('response.html');
  file.writeAsString(response.body);
}

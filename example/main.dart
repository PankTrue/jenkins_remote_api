import 'dart:convert';
import 'dart:io';

import 'package:jenkins_remote_api/jenkins_remote_api.dart';

void main() async {

  var url      = "http://127.0.0.1/";
  var username = "username";
  var password = "password";


  // AuthHttp client = new AuthHttp(url, username, password);

  // var response = await client.make_http_request("/computer/api/json", Method.GET);


    var base_client = new BaseClient(url, username, password);

    // var response = await base_client.make_http_request("/computer/api/json", Method.GET);

    // print(response.body);


    base_client.deserialize("");

  // var file = await File('response.html');
  // file.writeAsString(response.body);
}

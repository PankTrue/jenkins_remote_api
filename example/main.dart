import 'package:jenkins_remote_api/jenkins_remote_api.dart';

void main() async {

  var url      = "http://127.0.0.1";
  var username = "username";
  var password = "password";


  var base_client = new RemoteAccessApi(url, username, password);

  var response = await base_client.getListAll();


    print(response.jobs);


    // var response = await base_client.make_http_request("/computer/api/json", Method.GET);

    // print(response.body);

  // var file = await File('response.html');
  // file.writeAsString(response.body);
}

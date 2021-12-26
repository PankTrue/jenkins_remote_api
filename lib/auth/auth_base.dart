part of jenkins_remote_api;

enum Method {
  GET,
  POST
}

abstract class AuthBase
{
  var client      = null;
  String? host = null;

  AuthBase(String host){
    this.host = host;
  }

  Future<Response> make_http_request(String path, Method method, { Map<String, String>? querryParams, Map<String, String>? headers, String? body});
}
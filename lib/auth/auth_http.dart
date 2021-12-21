part of jenkins_remote_api;

class AuthHttp extends AuthBase
{
  String? username;
  String? password;

  AuthHttp(String host, String username, String password) : super(host)
  {
    this.username = username;
    this.password = password;

    this.client = new BasicAuthClient(username, password);
  }


  @override
  Future<Response> make_http_request( String path, Method method, { Map<String, String>? querryParams = null}) async {
    
    Future<Response> response;
    
    Uri request = Uri.http(host!, path, querryParams);

    switch(method)
    {
      case Method.GET   : response = client.get(request); break;
      case Method.POST  : response = client.post(request); break;
      default: { throw Exception("Request method $method not support for http!"); }
    }

    return response;
  }
}
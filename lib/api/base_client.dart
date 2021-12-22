part of jenkins_remote_api;


class BaseClient
{
  AuthBase? _client = null;

  BaseClient(String address, String username, String password){
    var uri = Uri.parse(address);
    switch(uri.scheme.toUpperCase())
    {
      case "HTTP" : _client = new AuthHttp(uri.host, username, password); break;
      default : throw Exception("Client for ${uri.scheme} is not implemented!");
      //TODO implement HTTPS client
    }
  }
}
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

  dynamic api_get_request(String url_prefix, { String url_suffix = "/api/json", Map<String,String>? querryParams = null}) async {
    var response = await _client!.make_http_request("$url_prefix$url_suffix", Method.GET, querryParams);

    return deserialize(response.body);
  }

  dynamic api_post_request(String url_prefix, { String url_suffix = "/api/json", Map<String,String>? querryParams = null}) async {
    var response = await _client!.make_http_request("$url_prefix$url_suffix", Method.POST, querryParams);

    return deserialize(response.body);
  }  

  dynamic deserialize(String value) {
    try {
      var json = jsonDecode(value);
      var targetType = json['_class'].split('.')[-1];

      return _deserialize(json, targetType);
    } catch(e) {
      return value;
    }
  }


  dynamic _deserialize(dynamic value, String targetType) {
    var ass = reflectClass(targetType as Type);

    ass.staticMembers;
  }
}
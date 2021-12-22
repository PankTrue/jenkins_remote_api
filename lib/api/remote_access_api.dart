part of jenkins_remote_api;


class RemoteAccessApi extends BaseClient
{
  RemoteAccessApi(String address, String username, String password) : super(address, username, password) { }

  
  
  Future<DefaultCrumbIssuer> getCrumb() async {
    var response = (await _client!.make_http_request("/crumbIssuer/api/json", Method.GET)).body;

    return DefaultCrumbIssuer.fromJson(json.decode(response));
  }

  Future<ComputerSet> getComputers() async {
    var response = (await _client!.make_http_request("/computer/api/json", Method.GET)).body;

    return ComputerSet.fromJson(json.decode(response));
  }

  Future<Queue> getQueue() async {
    var response = (await _client!.make_http_request("/queue/api/json", Method.GET)).body;

    return Queue.fromJson(json.decode(response));
  }



  Future<Queue> getItemById(int task_id) async {
    var response = (await _client!.make_http_request("/queue/item/${task_id}/api/json", Method.GET)).body;

    return Queue.fromJson(json.decode(response));
  }

  
  Future<Hudson> getListAll() async {
    var response = (await _client!.make_http_request("/api/json", Method.GET)).body;

    return Hudson.fromJson(json.decode(response));
  }

}
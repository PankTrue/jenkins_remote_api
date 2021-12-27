part of jenkins_remote_api;


class RemoteAccessApi extends BaseClient
{
  RemoteAccessApi(String address, String username, String password) : super(address, username, password) { }


  
  Future<DefaultCrumbIssuer> getCrumb() async {
    var response = (await _client!.make_http_request("/crumbIssuer/api/json", Method.GET)).body;

    return DefaultCrumbIssuer.fromJson(json.decode(response));
  }
  
  Future<Hudson> getListAll() async {
    var response = (await _client!.make_http_request("/api/json", Method.GET)).body;

    return Hudson.fromJson(json.decode(response));
  }

  Future<ComputerSet> getComputers() async {
    var response = (await _client!.make_http_request("/computer/api/json", Method.GET)).body;

    return ComputerSet.fromJson(json.decode(response));
  }

  Future<Queue> getQueue() async {
    var response = (await _client!.make_http_request("/queue/api/json", Method.GET)).body;

    return Queue.fromJson(json.decode(response));
  }

  Future<Queue> getQueueItem(int number) async {
    var response = (await _client!.make_http_request("/queue/item/$number/api/json", Method.GET)).body;

    return Queue.fromJson(json.decode(response));
  }
  
  Future<FreeStyleProject> getJob(String name) async {
    var response = (await _client!.make_http_request("/job/$name/api/json", Method.GET)).body;

    return FreeStyleProject.fromJson(json.decode(response));
  }  
  
  Future<XmlDocument> getJobConfig(String name) async {
    var response = (await _client!.make_http_request("/job/$name/config.xml", Method.GET)).body;

    return XmlDocument.parse(response);
  }

  Future<FreeStyleBuild> getJobLastBuild(String name) async {
    var response = (await _client!.make_http_request("/job/$name/lastBuild/api/json", Method.GET)).body;

    return FreeStyleBuild.fromJson(json.decode(response));
  }

  Future<String> getJobProgressiveText(String name, int number) async {
    var response = (await _client!.make_http_request("/job/$name/$number/logText/progressiveText", Method.GET)).body;

    return response;
  }

  Future<ListView> getView(String name) async {
    var response = (await _client!.make_http_request("/view/$name/api/json", Method.GET)).body;

    return ListView.fromJson(json.decode(response));
  }

  Future<XmlDocument> getViewConfig(String name) async {
    var response = (await _client!.make_http_request("/view/$name/config.xml", Method.GET)).body;

    return XmlDocument.parse(response);
  }

  
  Future<Response> createItem(String name, String config_xml, {String? copyFrom}) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers["Content-Type"]   = "application/xml";
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    Map<String, String> querryParams = {};
    querryParams["name"] = name;
    querryParams["from"] = copyFrom ?? "";

    return (await _client!.make_http_request("/createItem", Method.POST, querryParams: querryParams, headers: headers,body: config_xml));
  }

  Future<Response> createView(String name, String config_xml) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers["Content-Type"]   = "application/xml";
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    Map<String, String> querryParams = {};
    querryParams["name"] = name;

    return (await _client!.make_http_request("/createView", Method.POST, querryParams: querryParams, headers: headers, body: config_xml));
  }

  Future<Response> viewConfigUpdate(String name, String config_xml) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    return (await _client!.make_http_request("/view/$name/config.xml", Method.POST, headers: headers, body: config_xml));
  }

  Future<Response> jobBuild(String name, { Map<String, String>? params }) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    return (await _client!.make_http_request("/job/$name/buildWithParameters", Method.POST, querryParams: params, headers: headers));
  }
  

  Future<Response> jobConfigUpdate(String name, String config_xml) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    return (await _client!.make_http_request("/job/$name/config.xml", Method.POST, headers: headers, body: config_xml));
  }


  Future<Response> jobDelete(String name) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    return (await _client!.make_http_request("/job/$name/doDelete", Method.POST, headers: headers));
  }

  Future<Response> jobDisable(String name) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    return (await _client!.make_http_request("/job/$name/disable", Method.POST, headers: headers));
  }

  Future<Response> jobEnable(String name) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    return (await _client!.make_http_request("/job/$name/enable", Method.POST, headers: headers));
  }

  Future<Response> jobLastBuildStop(String name) async {

    var crumb = await getCrumb();

    Map<String, String> headers = {};
    headers[crumb.crumbRequestField ?? ""]  = crumb.crumb ?? "";

    return (await _client!.make_http_request("/job/$name/lastBuild/stop", Method.POST, headers: headers));
  }

}
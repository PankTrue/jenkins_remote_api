part of jenkins_remote_api;

class Pipelines {
  Pipelines();

  @override
  String toString() {
    return 'Pipelines[]';
  }

  Pipelines.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
    };
  }

  static List<Pipelines> listFromJson(List<dynamic> json) {
    return json == null ? <Pipelines>[] : json.map((value) => new Pipelines.fromJson(value)).toList();
  }

  static Map<String, Pipelines> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Pipelines>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Pipelines.fromJson(value));
    }
    return map;
  }
}


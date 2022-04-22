## jenkins_remote_api

jenkins_remote_api is free, open-source library to use jenkins api.


## Getting started

Add dependency to your pubspec.yaml

```yaml
dependencies:
  jenkins_remote_api: 
    git: 'https://github.com/PankTrue/jenkins_remote_api'
```

## Usage

```dart
  //create client
  var base_client = new RemoteAccessApi(url, username, password);

  //get all pipelines 
  var response = await base_client.getListAll();

  print(response.jobs);
```

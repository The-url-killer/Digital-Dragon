import 'dart:convert';

import 'package:http/http.dart' as http;

Uri createUrl({url}) {
  return Uri.http('localhost:8080', url, {'q': '{http}'});
}

void post({url, body, headers}) async {
  var uri = createUrl(url: url);

  await http.post(uri,
      body: json.encode(body), headers: {"Content-Type": "application/json", ...headers});
}

Future<dynamic> get({url, request, headers}) async {
  url = url + "/" + request;
  var uri = createUrl(url: url);

  return await http.get(uri, headers: {"Content-Type": "application/json", ...headers});
}

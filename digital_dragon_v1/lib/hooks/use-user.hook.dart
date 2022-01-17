import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

fetch() async {
  var url = Uri.http('localhost:8080', '/sign-in', {'q': '{http}'});
  var login =
      json.encode({'email': 'felipinho@rei.delas', 'password': 'Reidelas'});

  var response = await http
      .post(url, body: login, headers: {"Content-Type": "application/json"});

  print(response.body);
}

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> login({email, password}) async {
  var url = Uri.http('localhost:8080', '/sign-in', {'q': '{http}'});
  var login = json.encode({'email': email, 'password': password});

  await http
      .post(url, body: login, headers: {"Content-Type": "application/json"});

  return email;
}

Future<String> signUp({name, email, password}) async {
  var url = Uri.http('localhost:8080', '/sign-up', {'q': '{http}'});
  var signUP =
      json.encode({'name': name, 'email': email, 'password': password});

  await http
      .post(url, body: signUP, headers: {"Content-Type": "application/json"});

  return email;
}

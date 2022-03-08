import 'package:digital_dragon_v1/hooks/use-requisitions.hook.dart';

dynamic login({email, password}) async {
  post(url: '/sign-in', body: {email, password});

  return email;
}

Future<String> signUp({name, email, password}) async {
  post(
      url: '/sign-up',
      body: {'name': name, 'email': email, 'password': password});

  return email;
}

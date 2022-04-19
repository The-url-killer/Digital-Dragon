import 'package:digital_dragon_v1/constants/base_url.dart';
import 'package:digital_dragon_v1/model/user-data.model.dart';
import 'package:dio/dio.dart';

login({email, password}) async {
  return await Dio().post(BaseUrl.baseUrl + "/sign-in",
      data: {"email": email, "password": password});
}

Future<String> signUp({name, email, password}) async {
  // requisition.post(
  //     url: '/sign-up',
  //     body: {'name': name, 'email': email, 'password': password});

  return email;
}

getUserInfos({email}) async {
  Response<dynamic> response =
      await Dio().get(BaseUrl.baseUrl + "/user-infos/" + email);
  dynamic user = response.data;

  return UserData(email: user["email"], name: user["name"], image: user["image"]);
}

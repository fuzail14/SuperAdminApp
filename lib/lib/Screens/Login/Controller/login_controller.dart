import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:miasuperadmin/lib/Services/Shared%20Preferences/MySharedPreferences.dart';
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../Model/User.dart';

class LoginController extends GetxController {
  TextEditingController userCnicController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
  }

  Future loginApi(
      String cnic, String password
      ) async {
    print(cnic);
    print(password);
    final response = await Http.post(
      Uri.parse(Api.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'cnic': cnic,
        'password': password,
      }),
    );


    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(data['data']['firstname']);

      final User user = User(
          id: data['data']['id'],
          firstName: data['data']['firstname'],
          lastName: data['data']['lastname'],
          cnic: data['data']['cnic'],
          roleId: data['data']['roleid'],
          roleName: data['data']['rolename'],
          bearerToken: data['Bearer']);

MySharedPreferences.setUserData(user: user);
      print("-------");
      print(user.id);
      print(response.statusCode);

      Get.toNamed(homeScreen, arguments: user);
      Get.snackbar(
          "Login Successfully", "Welcome back 😉 " + user.firstName.toString());
    } else {
      Get.snackbar("Login Failed", "UnAuthorized 😥");
    }
  }
}

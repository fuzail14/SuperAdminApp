import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:miasuperadmin/lib/Screens/Login/Model/User.dart';
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';

class SocietyController extends GetxController {
  final TextEditingController societyNameController = TextEditingController();
  final TextEditingController societyAddressController =
      TextEditingController();

  Future addSocietyApi(
      {required int userid,
      required String token,
      required String societyName,
      required String societyAddress,
        required User user

      }) async {
    print(societyName);
    print(userid);
    print(token);
    print(societyAddress);
    print(user);

    final response = await Http.post(
      Uri.parse(Api.add_society),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "societyname": societyName,
        "societyaddress": societyAddress,
        "user_id": userid
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.toNamed(
          homeScreen,
          arguments: user);
      societyNameController.text = "";
      societyAddressController.text = "";

      Get.snackbar("Society Add Successfully", "");
    } else {
      Get.snackbar("Failed to Add Society", "");
    }
  }
}

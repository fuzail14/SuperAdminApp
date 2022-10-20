import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';

class SocietyController extends GetxController {
  var userdata= Get.arguments;
  late final User user;
  final TextEditingController societyNameController = TextEditingController();
  final TextEditingController societyAddressController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this.user=userdata;
  }


  Future addSocietyApi(
      {required int id,
      required String token,
      required String societyName,
      required String societyAddress,
    }) async {
    print(societyName);
    print(id);
    print(token);
    print(societyAddress);


    final response = await Http.post(
      Uri.parse(Api.add_society),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "societyname": societyName,
        "societyaddress": societyAddress,
        "superadminid": id
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.offAndToNamed(viewSociety, arguments: user);
      societyNameController.text = "";
      societyAddressController.text = "";

      Get.snackbar("Society Add Successfully", "");
    } else {
      Get.snackbar("Failed to Add Society", "");
    }
  }
}

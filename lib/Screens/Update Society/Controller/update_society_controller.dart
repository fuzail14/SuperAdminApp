import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;
import '../../View Society/Model/Society.dart';

class UpdateSocietyController extends GetxController {
  late final Society society;
  late final User user;
  var data=Get.arguments;


  final TextEditingController societyNameController = TextEditingController();
  final TextEditingController societyAddressController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
society =data[0];
user=data[1];

societyNameController.text=society.name!;
societyAddressController.text=society.address!;



  }



  Future updateSocietyApi({
    required int societyid,
    required String token,
    required String societyname,
    required String societyaddress,

  }) async {

    print("update api");
    print(societyid.toString());
    print(token);
    print(societyname);
    print(societyaddress);


    final response = await Http.put(Uri.parse(Api.update_society),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "societyname": societyname,
          "societyaddress": societyaddress,
          "id": societyid
        }));
    var data = jsonDecode(response.body.toString());


    if (response.statusCode == 200) {
      print(response.body.toString());

      Get.offAndToNamed(viewSociety, arguments: user);
    } else {}
  }
}

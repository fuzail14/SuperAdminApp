import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
enum SocietyStructure {scenario0, scenario1, scenario2, scenario3 }



class SocietyController extends GetxController {
  var userdata = Get.arguments;
  late final User user;
  SocietyStructure structure = SocietyStructure.scenario1;

  final TextEditingController societyNameController = TextEditingController();
  final TextEditingController societyAddressController =
      TextEditingController();
  final TextEditingController societyAreaController = TextEditingController();

  String country = '';
  String state = '';
  String city = '';
  String typeval = 'society';
  List<String> type = ['society', 'building'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this.user = userdata;
  }

  Future addSocietyApi({
    required int id,
    required String token,
    required String country,
    required String state,
    required String city,
    required String area,
    required String type,
    required String societyName,
    required String societyAddress,
    required int structuretype
  }) async {
    final response = await Http.post(
      Uri.parse(Api.add_society),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "country": country,
        "state": state,
        "city": city,
        "area": area,
        
        "type": type,
        "name": societyName,
        "address": societyAddress,
        "superadminid": id,
        "structuretype":structuretype
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.offAndToNamed(viewSociety, arguments: user);
      societyNameController.text = "";
      societyAddressController.text = "";

      Get.snackbar("Add Successfully", "");
    } else {
      Get.snackbar("Failed to Add", "");
    }
  }
  selectedSocietyStructure(val)
  {
    structure = val;
    update();
  }


  Selecttype(val) {
    typeval = val;
    update();
  }
}

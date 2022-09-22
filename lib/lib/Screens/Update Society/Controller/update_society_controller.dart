import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;

class UpdateSocietyController extends GetxController {
  final TextEditingController societyNameController = TextEditingController();
  final TextEditingController societyAddressController =
      TextEditingController();
  var societyid = 0.obs;
  var userid = 0.obs;
  var token = "".obs;
  var societyname = "".obs;
  var societyaddress = "".obs;
  User? user;

  Future deleteSocietyApi(int societyid, String token) async {
    print(societyid.toString());
    print(token);

    final response = await Http.get(
      Uri.parse(Api.delete_society + "/" + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      print(mydata);
      Get.toNamed(viewSociety, arguments: user);
    } else {}
  }

  Future updateSocietyApi({
    required int societyid,
    required String token,
    required String societyname,
    required String societyaddress,
    required int userid,
  }) async {
    print("update api");
    print(societyid.toString());
    print(token);
    print(societyname);
    print(societyaddress);
    print(userid.toString());

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
    var mydata = data['data'];

    if (response.statusCode == 200) {
      print(response.body.toString());

      Get.toNamed(homeScreen, arguments: user);
    } else {}
  }
}

import 'dart:convert';
import 'package:get/get.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;

import '../Model/view_admin_details_model.dart';

class ViewAdminDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    user = arguments[0];
    societyid = arguments[1];
    societyname = arguments[2];
    
    futureData = ViewAdminApi(societyid, user!.bearerToken);
  }

  var arguments = Get.arguments;
  User? user;
  int? societyid;
  String? societyname;
  
  var currentSubAdminId;
  var currentToken;
  var listOfSubAdmin = <SubAdmin>[].obs;
  SubAdmin? viewSubAdminModel;
  late Future futureData;

  ViewAdminApi(societid, bearerToken) async {

    final response = await Http.get(
      Uri.parse(Api.viewsubadmin + "/" + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${bearerToken}"
      },
    );

    var data = jsonDecode(response.body.toString());

    var mydata = data['data'];
    print(mydata);

    print(mydata[0]['firstname']);
    print(mydata[0]['password']);

    if (response.statusCode == 200) {
      print('response 200');

      for (var e in mydata) {
        viewSubAdminModel = SubAdmin(
          firstname: e['firstname'],
          address: e['address'],
          cnic: e['cnic'],
          id: e['id'],
          image: e['image'],
          lastname: e['lastname'],
          mobileno: e['mobileno'],
          password: e['password'],
          roleid: e['roleid'],
          rolename: e['rolename'],
          societyid: e['societyid'],
          subadminid: e['subadminid'],
          superadminid: e['superadminid'],
        );

        listOfSubAdmin.add(viewSubAdminModel!);
        
        update();
      }
      return listOfSubAdmin;
    } else {
      return listOfSubAdmin;
    }
  }

  Future deleteSubAdminApi(int subadminid, String token) async {
    print(subadminid.toString());
    print(token);

    final response = await Http.get(
      Uri.parse(Api.deletesubadmin + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    
    if (response.statusCode == 200) {

      listOfSubAdmin.clear();
      futureData = ViewAdminApi(societyid, user!.bearerToken);
      Get.back();

      update();
    } else {}
    update();
  }
}

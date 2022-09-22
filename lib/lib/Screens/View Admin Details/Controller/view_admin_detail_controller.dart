import 'dart:convert';

import 'package:get/get.dart';
import 'package:miasuperadmin/lib/Screens/View%20Admin%20Details/Model/view_admin_details_model.dart';

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;

class ViewAdminDetailsController extends GetxController {
  var arguments = Get.arguments;
  User? user;
  int? societyid;
  var currentSubAdminId;
  var currentToekn;
  List<ViewSubAdminModel> listOfSubAdmin = [];
  ViewSubAdminModel? viewSubAdminModel;
  late Future futureData;

  ViewAdminApi(subAdminId, bearerToken) async {
    print('superadmin id $subAdminId');
    print('token $bearerToken');

    final response = await Http.get(
      Uri.parse(Api.viewsubadmin + "/" + subAdminId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${bearerToken}"
      },
    );

    var data = jsonDecode(response.body.toString());

    var mydata = data['data'];
    print("mydata $mydata");
    print("mydata ${mydata[0]['id']}");

    if (response.statusCode == 200) {
      print('response 200');

      for (var e in mydata) {
        viewSubAdminModel = ViewSubAdminModel(
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
        print(listOfSubAdmin.length);
        print('returning list $listOfSubAdmin');
      }
    }

    update();

    return listOfSubAdmin;
  }

  Future deleteSocietyApi(int subadminid, String token) async {
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
    var mydata = data['data'];

    print('my data.......$mydata');

    if (response.statusCode == 200) {

      listOfSubAdmin.clear();
      futureData = ViewAdminApi(societyid, user!.bearerToken);

      

    } else {}
    update();
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miasuperadmin/lib/Bindings/Routes/routes.dart';
import 'package:http/http.dart' as Http;
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/lib/Screens/View%20Admin%20Details/Controller/view_admin_detail_controller.dart';

import '../../../Constants/api_routes.dart';
import '../../View Admin Details/Model/view_admin_details_model.dart';

class UpdateAdminController extends GetxController {
  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController userMobileNoController = TextEditingController();
  TextEditingController userCnicController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  var argument = Get.arguments;
  
  ViewSubAdminModel? listOfSubAdmin;

  


  String? token;
  


  var file;
  var isFile = false;

  getFile() async {
    // String? base64Image;

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      // print(file);
      isFile = true;
      update();

      // isFile = true;
      //  List<int> imageBytes = _file!.readAsBytesSync();
      //
      //  print(imageBytes);
      // base64Image = base64Encode(imageBytes);
      //  print(base64Image);

      return file;
    } else {
      // User canceled the picker
    }
  }

  Future updateSubAdminApi(
      {required int subadminid,
      
      required String subadminfirstname,
      required String subadminlastname,
      //required String subadmincnic,
      required String subadminmobileno,
      required String subadminaddress,
      required String subadminpassword,
      required String bearerToken,
      
      }) async {
    print("update api");
    print(subadminid.toString());
    
    print(subadminfirstname);
    print(subadminaddress);
    print(bearerToken.toString());

    // final response = await Http.post(Uri.parse(Api.updatesubadmin),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //       'Authorization': "Bearer $bearerToken"
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       "firstname": subadminfirstname,
    //       "lastname": subadminlastname,
    //       //"cnic": subadmincnic,
    //       "address": subadminaddress,
    //       "mobileno": subadminmobileno,
    //       "password": subadminpassword,
    //       "id": subadminid
          
          
          
    //     }));
    // var data = jsonDecode(response.body.toString());
    // var mydata = data;
    // print('update api function calling data list $mydata');


   Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.updatesubadmin));
    request.headers.addAll(headers);

    //request.files.add(await Http.MultipartFile.fromPath('image', file.path));
    request.fields['firstname'] = subadminfirstname;
    request.fields['lastname'] = subadminlastname;
    //request.fields['cnic'] = cnic;

    request.fields['address'] = subadminaddress;
    request.fields['mobileno'] = subadminmobileno;
    //request.fields['roleid'] = 1.toString();
    //request.fields['rolename'] = 'subadmin';
    request.fields['password'] = subadminpassword;
    //request.fields['superadminid'] = userid.toString();
    request.fields['id'] = subadminid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);
    
    if (response.statusCode == 200) {
      print(response.body.toString());

      
     print('view admin py first aye update k liye ${argument[2]}');

      Get.offAndToNamed(viewAdminDetails,arguments: argument[2]);
    } else {}
  }
}

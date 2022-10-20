
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as Http;


import '../../../Bindings/Set Routes/set_routes.dart';
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

  SubAdmin? listOfSubAdmin;

  String? token;

File? file;
  var isFile = false;

  getFile() async {
    // String? base64Image;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
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

  Future updateSubAdminApi({
    required int subadminid,
    required String subadminfirstname,
    required String subadminlastname,
    required String subadminmobileno,
    required String subadminaddress,
    required String subadminpassword,
    required String bearerToken,
  File? file,
  }) async {
    print("update api");
    print(subadminid.toString());
    print(subadminfirstname);
    print(subadminaddress);
    print(bearerToken.toString());
    print( file);

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request = Http.MultipartRequest('POST', Uri.parse(Api.updatesubadmin));
    request.headers.addAll(headers);

    if ( file!=null)
      { request.files.add(await Http.MultipartFile.fromPath('image', file!.path));

      }

    request.fields['firstname'] = subadminfirstname;
    request.fields['lastname'] = subadminlastname;
    request.fields['address'] = subadminaddress;
    request.fields['mobileno'] = subadminmobileno;
    request.fields['password'] = subadminpassword;
    request.fields['id'] = subadminid.toString();
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body.toString());

      print('view admin py first aye update k liye ${argument[2]}');

      Get.offAndToNamed(viewAdminDetails, arguments: argument[2]);
    }

   else if (response.statusCode == 403) {



      Get.snackbar('Error', response.body.toString());
    }



    else {
         print("Server Error");

    }
  }
}

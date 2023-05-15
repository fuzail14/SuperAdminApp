import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../View Admin Details/Model/view_admin_details_model.dart';
class UpdateAdminController extends GetxController {
  var isHidden = true;
  TextEditingController subAdminFirstNameController = TextEditingController();
  TextEditingController subAdminLastNameController = TextEditingController();
  TextEditingController subAdminCnicController = TextEditingController();
  TextEditingController subAdminAddressController = TextEditingController();
  TextEditingController subAdminMobileNoController = TextEditingController();
  TextEditingController subAdminPasswordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    listOfSubAdmin = argument[0];
    token = argument[1];
    print('argument[0] ${listOfSubAdmin}');
    print('argument[1] ${token}');

    print(listOfSubAdmin!.password);
    // updateAdminController.file = updateAdminController.listOfSubAdmin!.image;

    subAdminFirstNameController.text = listOfSubAdmin!.firstname!;
    subAdminLastNameController.text = listOfSubAdmin!.lastname!;
    subAdminCnicController.text = listOfSubAdmin!.cnic!;
    subAdminMobileNoController.text = listOfSubAdmin!.mobileno!;
    subAdminAddressController.text = listOfSubAdmin!.address!;

  }

  var argument = Get.arguments;
  final formKey = GlobalKey<FormState>();
  final passowrdformKey = GlobalKey<FormState>();

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

    required String bearerToken,
    File? file,
  }) async {
    print("update api");
    print(subadminid.toString());
    print(subadminfirstname);
    print(subadminaddress);
    print(bearerToken.toString());
    print(file);

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request = Http.MultipartRequest('POST', Uri.parse(Api.updatesubadmin));
    request.headers.addAll(headers);

    if (file != null) {
      request.files.add(await Http.MultipartFile.fromPath('image', file.path));
    }

    request.fields['firstname'] = subadminfirstname;
    request.fields['lastname'] = subadminlastname;
    request.fields['address'] = subadminaddress;
    request.fields['mobileno'] = subadminmobileno;
    request.fields['id'] = subadminid.toString();
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body.toString());

      print('view admin py first aye update k liye ${argument[2]}');

      Get.offAndToNamed(viewAdminDetails, arguments: argument[2]);
    } else if (response.statusCode == 403) {
      Get.snackbar('Error', response.body.toString());
    } else {
      print("Server Error");
    }
  }



  Future resetPasswordApi({
    required int subadminid,

    required String bearerToken,
    required String password,

  }) async {
    print("reset password api");
    print(subadminid.toString());
    print(bearerToken.toString());
    print(file);

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request = Http.MultipartRequest('POST', Uri.parse(Api.resetpassword));
    request.headers.addAll(headers);


    request.fields['password'] = password;
    request.fields['id'] = subadminid.toString();
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      subAdminPasswordController.clear();

      print(response.body.toString());

Get.back();

update();

    } else if (response.statusCode == 403) {
      Get.snackbar('Error', response.body.toString());
    } else {
      print("Server Error");
    }
  }


  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future fcmtokenrefresh(int id, String fcmtoken, String bearertoken) async {
    print("Fcm token refresh Api   Hits ! ");

    try {
      final response = await Http.post(
        Uri.parse(Api.fcmtokenrefresh),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $bearertoken"
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'fcmtoken': fcmtoken,
        }),
      );
      print("Fcm token refresh Api Hits Successfully !");
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);

      print(data);
    } catch (SocketException) {
      Get.snackbar('Error Message', 'No Internet Connection');
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';

class AddAdminController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = argument[0];
    societyid = argument[1];

    token = user!.bearerToken;
  }

  var file;
  var isFile = false;
  var isHidden = false;

  var argument = Get.arguments;
  User? user;
  int? societyid;
  final formKey = GlobalKey<FormState>();

  String? token;

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

  TextEditingController subAdminFirstNameController = TextEditingController();
  TextEditingController subAdminLastNameController = TextEditingController();
  TextEditingController subAdminCnicController = TextEditingController();
  TextEditingController subAdminAddressController = TextEditingController();
  TextEditingController subAdminMobileNoController = TextEditingController();
  TextEditingController subAdminPasswordController = TextEditingController();

  addAdminApi(firstName, lastName, cnic, address, mobileno, password,
      int? userid, int societyid, String token, File? file) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.registersubadmin));
    request.headers.addAll(headers);
    if (file!=null){
      request.files.add(await Http.MultipartFile.fromPath('image', file.path));
    }
    request.fields['firstname'] = firstName;
    request.fields['lastname'] = lastName;
    request.fields['cnic'] = cnic;
    request.fields['address'] = address;
    request.fields['mobileno'] = mobileno;
    request.fields['roleid'] = 2.toString();
    request.fields['rolename'] = 'subadmin';
    request.fields['password'] = password;
    request.fields['superadminid'] = userid.toString();
    request.fields['societyid'] = societyid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("User Register Successfully", "");

      Get.offAndToNamed(viewAdminDetails, arguments: argument);

      // Get.toNamed(login);
    } else if (response.statusCode == 403) {
      var data = jsonDecode(response.body.toString());

      Get.snackbar(
        "Error",
        data.toString(),
      );
    } else {
      Get.snackbar("Failed to Register", "");
    }

    //   final response = await Http.post(
    //     Uri.parse(Api.registersubadmin),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //       'Authorization': "Bearer $token"
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       'firstname': subAdminFirstNameController,
    //       'lastname': subAdminLastNameController,
    //       'cnic': subAdminCnicController,
    //       'address': subAdminAddressController,
    //       'mobileno': subAdminMobileNoController,
    //       'roleid': 1,
    //       'rolename': "subadmin",
    //       'password': subAdminPasswordController,
    //       'superadminid': userid,
    //       'societyid': societyid
    //     }),
    //   );

    //   print(response.body);

    //   if (response.statusCode == 200) {

    //   }
  }
  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/update_admin_controller.dart';

class UpdateAdmin extends StatefulWidget {
  @override
  State<UpdateAdmin> createState() => _UpdateAdminState();
}

class _UpdateAdminState extends State<UpdateAdmin> {
  final _formKey = GlobalKey<FormState>();
  UpdateAdminController updateAdminController =
      Get.put(UpdateAdminController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateAdminController.listOfSubAdmin = updateAdminController.argument[0];
    updateAdminController.token = updateAdminController.argument[1];

    print('argument[0] ${updateAdminController.listOfSubAdmin}');
    print('argument[1] ${updateAdminController.token}');

    // updateAdminController.file = updateAdminController.listOfSubAdmin!.image;

    updateAdminController.userFirstNameController.text =
        updateAdminController.listOfSubAdmin!.firstname!;
    updateAdminController.userLastNameController.text =
        updateAdminController.listOfSubAdmin!.lastname!;
    updateAdminController.userCnicController.text =
        updateAdminController.listOfSubAdmin!.cnic!;
    updateAdminController.userMobileNoController.text =
        updateAdminController.listOfSubAdmin!.mobileno!;
    updateAdminController.userAddressController.text =
        updateAdminController.listOfSubAdmin!.address!;
    updateAdminController.userPasswordController.text =
        updateAdminController.listOfSubAdmin!.password!;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateAdminController>(
        init: UpdateAdminController(),
        builder: (controller) {
          print(
              'update SubAdmin screen ${controller.listOfSubAdmin!.lastname}');

          return Scaffold(
              appBar: AppBar(
                title: Text("Update Admin Details"),
                backgroundColor: primaryColor,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              controller.file = await updateAdminController.getFile();
                              print(controller.isFile);
                              print(controller.file);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: controller.isFile
                                      ? BoxDecoration(
                                          border:
                                              Border.all(color: primaryColor),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                  File(
                                                    controller.file!.path,
                                                  ),
                                                  scale: 1.0)),
                                        )
                                      : BoxDecoration(
                                          border:
                                              Border.all(color: primaryColor),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'images/user.jpg'))),
                                ),
                                Positioned(
                                  left: 120,
                                  top: 110,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.image,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            )),
                        MyTextFormField(
                            controller: controller.userFirstNameController,
                            hintText: "Enter First Name",
                            obscureText: false,
                            labelText: "First Name",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                        MyTextFormField(
                            controller: controller.userLastNameController,
                            hintText: "Enter Last Name",
                            obscureText: false,
                            labelText: "Last Name",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                        MyTextFormField(
                            controller: controller.userCnicController,
                            hintText: "Enter User CNIC",
                            obscureText: false,
                            labelText: "CNIC",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                        MyTextFormField(
                            controller: controller.userMobileNoController,
                            hintText: "Enter Mobile Number",
                            obscureText: false,
                            labelText: "Mobile Number",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                        MyTextFormField(
                            controller: controller.userAddressController,
                            hintText: "Enter User Address",
                            obscureText: false,
                            labelText: "Address",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                        MyTextFormField(
                            controller: controller.userPasswordController,
                            hintText: "Enter Password",
                            obscureText: true,
                            labelText: "Password",
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                        MyButton(
                          width: MediaQuery.of(context).size.width * 0.4,
                          horizontalPadding: 8,
                          verticalPadding: 8,
                          name: 'Update',
                          color: primaryColor,
                          maxLines: 1,
                          onPressed: () {
                            controller.updateSubAdminApi(
                                subadminid: controller.listOfSubAdmin!.id!,
                                subadminfirstname:
                                    controller.userFirstNameController.text,
                                subadminlastname:
                                    controller.userLastNameController.text,
                                subadminmobileno:
                                    controller.userMobileNoController.text,
                                subadminaddress:
                                    controller.userAddressController.text,
                                subadminpassword:
                                    controller.userPasswordController.text,
                                bearerToken: controller.token!,
                                file: controller.file

                            );


                          },
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
  // void pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     File file = File(result.files.single.path.toString());
  //   } else {
  //     // User canceled the picker
  //   }
  // }

}

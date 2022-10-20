import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../Login/Model/User.dart';
import '../Controller/add_admin_controller.dart';

class AddAdmin extends StatefulWidget {
  const AddAdmin({Key? key}) : super(key: key);

  @override
  State<AddAdmin> createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  final AddAdminController _addAdminController = Get.put(AddAdminController());
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
      _addAdminController. user =_addAdminController. argument[0];
  _addAdminController.  societyid =_addAdminController. argument[1];

    _addAdminController.token = _addAdminController.user!.bearerToken;

    return Scaffold(
        appBar: AppBar(
          title: Text('Add Admin'),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key: _formKey,
            child: GetBuilder<AddAdminController>(
              init: AddAdminController(),
              builder: (controller) {
                return Column(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          controller.file = await controller.getFile();

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
                                      border: Border.all(color: primaryColor),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              File(
                                                controller.file.path,
                                              ),
                                              scale: 1.0)),
                                    )
                                  : BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage('images/user.jpg'))),
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
                        validator: emptyStringValidator,
                        controller:
                            _addAdminController.subAdminFirstNameController,
                        hintText: "Enter First Name",
                        obscureText: false,
                        labelText: " First Name",
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        validator: emptyStringValidator,
                        controller:
                            _addAdminController.subAdminLastNameController,
                        hintText: "Enter Last Name",
                        obscureText: false,
                        labelText: "Last Name",
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        validator: emptyStringValidator,
                        controller: _addAdminController.subAdminCnicController,
                        hintText: "Enter subAdmin CNIC",
                        obscureText: false,
                        labelText: "CNIC",
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        validator: emptyStringValidator,
                        controller:
                            _addAdminController.subAdminAddressController,
                        hintText: "Enter subAdmin Address",
                        obscureText: false,
                        labelText: "Address",
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        validator: emptyStringValidator,
                        controller:
                            _addAdminController.subAdminMobileNoController,
                        hintText: "Enter Mobile No",
                        obscureText: false,
                        labelText: "Mobile Number",
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        validator: passwordValidator,
                        controller:
                            _addAdminController.subAdminPasswordController,
                        hintText: "Enter Password",
                        obscureText: false,
                        labelText: "Password",
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyButton(
                        width: MediaQuery.of(context).size.width * 0.4,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            if(controller.file == null){

                              Get.snackbar('Image', "Please Add Image");
                            }

                            _addAdminController.addAdminApi(
                            _addAdminController
                                .subAdminFirstNameController.text,
                            _addAdminController.subAdminLastNameController.text,
                            _addAdminController.subAdminCnicController.text,
                            _addAdminController.subAdminAddressController.text,
                            _addAdminController.subAdminMobileNoController.text,
                            _addAdminController.subAdminPasswordController.text,
                          _addAdminController.  user!.id,
                           _addAdminController. societyid!,
                           _addAdminController. token!,
                            controller.file
                          );
                            
                          }
                        },
                        horizontalPadding: 8,
                        verticalPadding: 8,
                        name: 'Save',
                        color: primaryColor,
                        maxLines: 1)
                  ],
                );
              },
            ),
          ),
        )));
  }
}

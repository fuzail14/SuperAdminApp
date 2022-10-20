import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../Login/View/login.dart';
import '../Controller/signup_ controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignupController signupController = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: GetBuilder<SignupController>(
              init: SignupController(),
              builder: (controller) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () async {
                            controller.file = await signupController.getFile();

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
                          controller: signupController.adminFirstNameController,
                          hintText: "Enter First Name",
                          obscureText: false,
                          labelText: "First Name",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          validator: emptyStringValidator,
                          controller: signupController.adminLastNameController,
                          hintText: "Enter Last Name",
                          obscureText: false,
                          labelText: "Last Name",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          validator: emptyStringValidator,
                          controller: signupController.adminCnicController,
                          hintText: "Enter CNIC",
                          obscureText: false,
                          labelText: "CNIC",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          validator: emptyStringValidator,
                          controller: signupController.adminAddressController,
                          hintText: "Enter Address",
                          obscureText: false,
                          labelText: "Address",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          validator: emptyStringValidator,
                          controller: signupController.adminMobileNoController,
                          hintText: "Enter  MobileNo",
                          obscureText: false,
                          labelText: "MobileNo",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyPasswordTextFormField(
                          validator: passwordValidator,
                          controller: signupController.adminPasswordController,
                          labelText: "Password",
                          togglePasswordView: controller.togglePasswordView,
                          hintText: "Enter Password",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor,
                          obscureText: controller.isHidden),
                      MyButton(
                          width: MediaQuery.of(context).size.width * 0.6,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (signupController.file == null) {
                                Get.snackbar('Image', 'Image required');
                              }

                              signupController.signUpApi(
                                  firstName: signupController
                                      .adminFirstNameController.text,
                                  lastName: signupController
                                      .adminLastNameController.text,
                                  cnic:
                                      signupController.adminCnicController.text,
                                  address: signupController
                                      .adminAddressController.text,
                                  mobileno: signupController
                                      .adminMobileNoController.text,
                                  password: signupController
                                      .adminPasswordController.text,
                                  file: signupController.file);
                            }
                          },
                          horizontalPadding: 8,
                          verticalPadding: 8,
                          name: "Sign Up",
                          color: primaryColor,
                          maxLines: 1),
                      Wrap(
                        children: [
                          const Text(
                            "Already  Have an Account ?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogIn()),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: primaryColor),
                              )),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      )),
    );
  }
}

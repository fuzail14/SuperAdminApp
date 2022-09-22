import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:hexcolor/hexcolor.dart';

import 'package:miasuperadmin/lib/Screens/Login/Controller/login_controller.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';

import '../../Sign Up/View/sign_up.dart';

class LogIn extends GetView<LoginController> {
  LogIn({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/logout.png")))),
                      MyTextFormField(
                        validator: emptyStringValidator,
                        controller: controller.userCnicController,
                        hintText: " Enter CNIC",
                        labelText: "CNIC",
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor,
                        obscureText: false,
                      ),
                      MyTextFormField(
                          validator: passwordValidator,
                          controller: controller.userPasswordController,
                          hintText: "Enter PASSWORD",
                          obscureText: true,
                          labelText: "PASSWORD",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyButton(
                        width: MediaQuery.of(context).size.width * 0.4,
                        horizontalPadding: 8,
                        verticalPadding: 8,
                        name: 'Login',
                        color: primaryColor,
                        maxLines: 1,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            controller.loginApi(
                                controller.userCnicController.text,
                                controller.userPasswordController.text);
                          }

                        },
                      ),
                      Wrap(
                        children: [
                          const Text("Don't have an Account ?"),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';

import '../../Login/Model/User.dart';
import '../Controller/society_controller.dart';

class AddSociety extends StatelessWidget {
  var user= Get.arguments;
  final SocietyController controller = Get.put(SocietyController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Add Society'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text('Add New Society',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Image.asset(
                    "images/addsociety.png",

                  ),
                  MyTextFormField(
                      controller: controller.societyNameController,
                      validator: emptyStringValidator,
                      hintText: "Enter Society Name",
                      obscureText: false,
                      labelText: "Society Name",
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor),
                  MyTextFormField(
                      controller: controller.societyAddressController,
                      validator: emptyStringValidator,
                      hintText: "Enter Society Address",
                      obscureText: false,
                      labelText: "Society Address",
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor),
                  MyButton(
                    width: MediaQuery.of(context).size.width * 0.4,
                    horizontalPadding: 10,
                    verticalPadding: 10,
                    name: "Save",
                    color: primaryColor,
                    maxLines: 1,
                    onPressed: () {
                      User user = this.user;

                      if (_formKey.currentState!.validate()) {
                        controller.addSocietyApi(
                            societyAddress: controller.societyAddressController.text,
                            societyName: controller.societyNameController.text,
                            token: user.bearerToken!,
                            userid: user.id!,
                           user:user

                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

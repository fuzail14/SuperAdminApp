import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/update_society_controller.dart';

class UpdateSociety extends StatefulWidget {
  const UpdateSociety({Key? key}) : super(key: key);

  @override
  State<UpdateSociety> createState() => _UpdateSocietyState();
}

class _UpdateSocietyState extends State<UpdateSociety> {

  final UpdateSocietyController updateSocietyController =
      Get.put(UpdateSocietyController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Society"),
          backgroundColor: primaryColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: GetBuilder<UpdateSocietyController>(
            init: UpdateSocietyController(),
            builder: (controller) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                
                      SizedBox(height: 10,),
                      Text('Update Society Details',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                   Image.asset('images/society.png'),
                      MyTextFormField(
                          controller: updateSocietyController.societyNameController,
                          validator: emptyStringValidator,
                          hintText: "Enter Society Name",
                          obscureText: false,
                          labelText: "Society Name",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          controller:
                              updateSocietyController.societyAddressController,
                          validator: emptyStringValidator,
                          hintText: "Enter Society Address",
                          obscureText: false,
                          labelText: "Society Address",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyButton(
                        width: MediaQuery.of(context).size.width * 0.4,
                        horizontalPadding: 8,
                        verticalPadding: 8,
                        name: "Update",
                        color: primaryColor,
                        maxLines: 1,
                        onPressed: () {
                
                          updateSocietyController.updateSocietyApi(
                              societyid: controller.society.societyid!,
                              token: controller.user.bearerToken!,
                              societyname: controller.societyNameController.text,
                              societyaddress :controller.societyAddressController.text ,
                
                          );
                
                
                
                
                
                
                        },
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ));
  }
}

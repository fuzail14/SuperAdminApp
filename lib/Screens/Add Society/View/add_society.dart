import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';

import '../../Login/Model/User.dart';
import '../Controller/society_controller.dart';

class AddSociety extends StatelessWidget {
  final SocietyController _societyController = Get.put(SocietyController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: primaryColor,
          backgroundColor: secondaryColor,
          title: Text('Add Society'),
        ),
        body: Form(
          key: _formKey,
          child:
          SingleChildScrollView(
            child:
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(


                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 73, 0, 0),
                    child: Text(
                        'Add New Society',
                        style:
                        GoogleFonts.montserrat(
                            color: primaryColor,
                            fontSize: MediaQuery.of(context).size.width*0.023, fontWeight: FontWeight.w600
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 73, 0, 0),
                    child: Image.asset(
                      "images/addsociety.png",
                      width: MediaQuery.of(context).size.width*0.22,

                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),
                    child: MyTextFormField(
                        fontWeight: FontWeight.w600,
                        labelTextColor:secondaryColor ,
                        hintTextColor: secondaryColor,
                        width:MediaQuery.of(context).size.width*0.29  ,                          validator: emptyStringValidator,
                        controller: _societyController.societyNameController,
                        hintText: "Enter Society Name",
                        obscureText: false,
                        labelText: "Society Name",

                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                  ),
                  Padding(     padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),
                    child: MyTextFormField(
                        fontWeight: FontWeight.w600,
                        labelTextColor:secondaryColor ,
                        hintTextColor: secondaryColor,
                        width:MediaQuery.of(context).size.width*0.29  ,
                        validator: emptyStringValidator,
                        controller: _societyController.societyAddressController,
                        hintText: "Enter Society Address",
                        obscureText: false,
                        labelText: "Society Address",

                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                  ),

                  Padding(
                    padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),

                    child: MyButton(
                    width:MediaQuery.of(context).size.width*0.29  ,
                      textColor: primaryColor,
                      name: "Save",
                      color: secondaryColor,
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                      onPressed: () {
                        User user = _societyController.user;

                        if (_formKey.currentState!.validate()) {
                          _societyController.addSocietyApi(

                            societyName:
                                _societyController.societyNameController.text,
                                societyAddress:
                                _societyController.societyAddressController.text,

                            token: user.bearerToken!,
                            id: user.id!,
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

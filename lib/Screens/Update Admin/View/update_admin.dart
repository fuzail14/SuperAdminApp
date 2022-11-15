import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miasuperadmin/Widgets/My%20Password%20TextForm%20Field/my_password_textform_field.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/update_admin_controller.dart';

class UpdateAdmin extends GetView {
  
  UpdateAdminController updateAdminController =
      Get.put(UpdateAdminController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateAdminController>(
        init: UpdateAdminController(),
        builder: (controller) {
          print(
              'update SubAdmin screen ${controller.listOfSubAdmin!.lastname}');

          return Scaffold(
              appBar: AppBar(
                foregroundColor: primaryColor,
                title: Text("Update Admin Details"),
                backgroundColor: secondaryColor,
              ),
              body:
              SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key:controller. formKey,
                      child:
                            SingleChildScrollView(
                              child:
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(


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
                                              width: MediaQuery.of(context).size.width*0.19,
                                              height: MediaQuery.of(context).size.height*0.19,
                                              decoration: controller.isFile
                                                  ? BoxDecoration(
                                                // border: Border.all(color: primaryColor),
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
                                                  border: Border.all(color: primaryColor),
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      scale: 1.0,
                                                      fit: BoxFit.cover,
                                                      image:
                                                      AssetImage("images/user.png"

                                                      ))),
                                            ),
                                            Positioned(
                                              left: MediaQuery.of(context).size.width*0.10,
                                              top: MediaQuery.of(context).size.height*0.13,
                                              child: Container(
                                                width: MediaQuery.of(context).size.width*0.06,
                                                height: MediaQuery.of(context).size.height*0.06,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: primaryColor),
                                                    color: primaryColor,
                                                    shape: BoxShape.circle),
                                                child: Icon(
                                                  Icons.image,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),

                                      child: MyTextFormField(
                                          fontWeight: FontWeight.w600,
                                          labelTextColor:secondaryColor ,
                                          hintTextColor: secondaryColor,
                                          width:MediaQuery.of(context).size.width*0.49  ,

                                          validator: emptyStringValidator,
                                          controller: controller.subAdminFirstNameController,
                                          hintText: "Enter First Name",
                                          obscureText: false,
                                          labelText: "First Name",

                                          onFocusedBorderColor: primaryColor,
                                          onEnabledBorderColor: primaryColor),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),                          child: MyTextFormField(

                                        fontWeight: FontWeight.w600,
                                        labelTextColor:secondaryColor ,
                                        hintTextColor: secondaryColor,
                                        width:MediaQuery.of(context).size.width*0.49  ,
                                        validator: emptyStringValidator,
                                        controller: controller.subAdminLastNameController,
                                        hintText: "Enter Last Name",
                                        obscureText: false,
                                        labelText: "Last Name",
                                        onFocusedBorderColor: primaryColor,
                                        onEnabledBorderColor: primaryColor),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),                          child: MyTextFormField(

                                        fontWeight: FontWeight.w600,
                                        labelTextColor:secondaryColor ,
                                        hintTextColor: secondaryColor,
                                        width:MediaQuery.of(context).size.width*0.49  ,
                                        validator: emptyStringValidator,
                                        controller: controller.subAdminCnicController,
                                        hintText: "Enter CNIC",
                                        obscureText: false,
                                        labelText: "CNIC",
                                        onFocusedBorderColor: primaryColor,
                                        onEnabledBorderColor: primaryColor),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),                          child: MyTextFormField(

                                        fontWeight: FontWeight.w600,
                                        labelTextColor:secondaryColor ,
                                        hintTextColor: secondaryColor,

                                        width:MediaQuery.of(context).size.width*0.49  ,
                                        validator: emptyStringValidator,
                                        controller: controller.subAdminAddressController,
                                        hintText: "Enter Address",
                                        obscureText: false,
                                        labelText: "Address",
                                        onFocusedBorderColor: primaryColor,
                                        onEnabledBorderColor: primaryColor),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),                          child: MyPasswordTextFormField(
                                        width:MediaQuery.of(context).size.width*0.49  ,
                                        validator: passwordValidator,

                                        controller: controller.subAdminPasswordController,
                                        labelText: "Password",
                                        fontWeight: FontWeight.w600,
                                        labelTextColor: secondaryColor,
                                        hintTextColor: secondaryColor,
                                        togglePasswordView: controller.togglePasswordView,
                                        hintText: "Enter Password",
                                        onFocusedBorderColor: primaryColor,
                                        onEnabledBorderColor: primaryColor,
                                        obscureText: controller.isHidden),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),                          child: MyTextFormField(

                                        fontWeight: FontWeight.w600,
                                        labelTextColor:secondaryColor ,
                                        hintTextColor: secondaryColor,

                                        width:MediaQuery.of(context).size.width*0.49  ,
                                        validator: emptyStringValidator,
                                        controller: controller.subAdminMobileNoController,
                                        hintText: "Enter  MobileNo",
                                        obscureText: false,
                                        labelText: "MobileNo",
                                        onFocusedBorderColor: primaryColor,
                                        onEnabledBorderColor: primaryColor),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width*0.02 , 0, 0),
                                      child: MyButton(
                                        width:MediaQuery.of(context).size.width*0.49  ,

          name: 'Update',
          color: secondaryColor,
          maxLines: 1,
          onPressed: () {
          controller.updateSubAdminApi(
          subadminid: controller.listOfSubAdmin!.id!,
          subadminfirstname:
          controller.subAdminFirstNameController.text,
          subadminlastname:
          controller.subAdminLastNameController.text,
          subadminmobileno:
          controller.subAdminMobileNoController.text,
          subadminaddress:
          controller.subAdminAddressController.text,
          subadminpassword:
          controller.subAdminPasswordController.text,
          bearerToken: controller.token!,
          file: controller.file

          );


          },
          )

                                    )

                                  ],
                                ),
                              ),
                            )

                      ),
                    ),
                  ));
        });
  }


}

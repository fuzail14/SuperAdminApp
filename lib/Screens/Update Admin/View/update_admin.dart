import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miasuperadmin/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/Constants/api_routes.dart';
import 'package:miasuperadmin/Widgets/My%20Password%20TextForm%20Field/my_password_textform_field.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../Login/View/login.dart';
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
              body: SingleChildScrollView(
                child: Center(
                  child: Form(
                      key: controller.formKey,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.white,
                                      backgroundImage: controller.file == null
                                          ? NetworkImage(imageBaseUrl +
                                              controller.listOfSubAdmin!.image
                                                  .toString()) as ImageProvider
                                          : FileImage(
                                              File(controller.file!.path),
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 100,
                                    top: 100,
                                    child: InkWell(
                                      onTap: () async {
                                        controller.file =
                                            await controller.getFile();
                                        print(controller.isFile);
                                        print(controller.file);
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColor),
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // GestureDetector(
                              //     onTap: () async {
                              //       controller.file = await controller.getFile();
                              //       print(controller.isFile);
                              //       print(controller.file);
                              //     },
                              //     child: Stack(
                              //       children: [
                              //         Container(
                              //           width: MediaQuery.of(context).size.width*0.19,
                              //           height: MediaQuery.of(context).size.height*0.19,
                              //           decoration: controller.isFile
                              //               ? BoxDecoration(
                              //             // border: Border.all(color: primaryColor),
                              //             shape: BoxShape.circle,
                              //             image: DecorationImage(
                              //                 fit: BoxFit.cover,
                              //                 image: FileImage(
                              //                     File(
                              //                       controller.file!.path,
                              //
                              //                     ),
                              //                     scale: 1.0)),
                              //           )
                              //               : BoxDecoration(
                              //               border: Border.all(color: primaryColor),
                              //               shape: BoxShape.circle,
                              //               image: DecorationImage(
                              //                   scale: 1.0,
                              //                   fit: BoxFit.cover,
                              //                   image:
                              //                   AssetImage("images/user.png"
                              //
                              //                   ))),
                              //         ),
                              //         Positioned(
                              //           left: MediaQuery.of(context).size.width*0.10,
                              //           top: MediaQuery.of(context).size.height*0.13,
                              //           child: Container(
                              //             width: MediaQuery.of(context).size.width*0.06,
                              //             height: MediaQuery.of(context).size.height*0.06,
                              //             decoration: BoxDecoration(
                              //                 border: Border.all(color: primaryColor),
                              //                 color: primaryColor,
                              //                 shape: BoxShape.circle),
                              //             child: Icon(
                              //               Icons.image,
                              //               size: 20,
                              //               color: Colors.white,
                              //             ),
                              //           ),
                              //         )
                              //       ],
                              //     )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminFirstNameController,
                                    hintText: "Enter First Name",
                                    obscureText: false,
                                    labelText: "First Name",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminLastNameController,
                                    hintText: "Enter Last Name",
                                    obscureText: false,
                                    labelText: "Last Name",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminAddressController,
                                    hintText: "Enter Address",
                                    obscureText: false,
                                    labelText: "Address",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width * 0.02,
                                    0,
                                    0),
                                child: MyTextFormField(
                                    fontWeight: FontWeight.w600,
                                    labelTextColor: secondaryColor,
                                    hintTextColor: secondaryColor,
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    validator: emptyStringValidator,
                                    controller:
                                        controller.subAdminMobileNoController,
                                    hintText: "Enter  MobileNo",
                                    obscureText: false,
                                    labelText: "MobileNo",
                                    onFocusedBorderColor: primaryColor,
                                    onEnabledBorderColor: primaryColor),
                              ),

                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      MediaQuery.of(context).size.width * 0.02,
                                      0,
                                      0),
                                  child: MyButton(
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    name: 'Update',
                                    color: secondaryColor,
                                    maxLines: 1,
                                    onPressed: () {
                                      controller.updateSubAdminApi(
                                          subadminid:
                                          controller.listOfSubAdmin!.id!,
                                          subadminfirstname: controller.subAdminFirstNameController.text,
                                          subadminlastname: controller.subAdminLastNameController.text,
                                          subadminmobileno: controller.subAdminMobileNoController.text,
                                          subadminaddress: controller.subAdminAddressController.text,
                                          bearerToken: controller.token!,
                                          file: controller.file);
                                    },
                                  )),
                              SizedBox(height: 10,),
                              Wrap(
                                children: [
                                  const Text(

                                    "Do you want to change Password ?",
                                    style:
                                    TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {

                                        showDialog(
                                            context: context,
                                            builder:
                                                (context) {
                                              return GetBuilder<UpdateAdminController>(
                                                init: UpdateAdminController(),
                                                builder: (cnt) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    backgroundColor:
                                                    Colors
                                                        .transparent,
                                                    child:
                                                    Container(
                                                      width: MediaQuery.of(context).size.width*0.430,
                                                        height: MediaQuery.of(context).size.height*0.500,
                                                        child:
                                                        Stack(
                                                          alignment:
                                                          Alignment.topCenter,
                                                          children: <Widget>[
                                                            Container(
                                                              width: MediaQuery.of(context).size.width * 2,
                                                              height:MediaQuery.of(context).size.height * 2 ,

                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              child: Form(
                                                                key: controller.passowrdformKey,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: <Widget>[
                                                                    SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                                                                    SvgPicture.asset(
                                                                      "images/reset_password_icon.svg",width:  MediaQuery.of(context).size.width*0.15,
                                                                    ),
                                                                    MyPasswordTextFormField(width:MediaQuery.of(context).size.width*0.35,
                                                                                controller: cnt.subAdminPasswordController,
                                                                                validator: emptyStringValidator,
                                                                                labelText: "Password",
                                                                                fontWeight: FontWeight.w600,
                                                                                labelTextColor: secondaryColor,
                                                                                hintTextColor: secondaryColor,
                                                                                togglePasswordView: controller.togglePasswordView,
                                                                                hintText: "Enter Password",
                                                                                onFocusedBorderColor: primaryColor,
                                                                                onEnabledBorderColor: primaryColor,
                                                                                obscureText: controller.isHidden),
                                                                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                                                    MyButton(
                                                                      width: MediaQuery.of(context).size.width *
                                                                          0.35,
                                                                      name: 'Reset Password',
                                                                      color: secondaryColor,
                                                                      maxLines: 1,
                                                                      onPressed: () {
    if (controller.passowrdformKey.currentState!.validate()) {
      cnt.resetPasswordApi(subadminid: controller.listOfSubAdmin!.id!,
          bearerToken: controller.token!,
          password: controller.subAdminPasswordController.text);
    }},
                                                                    ), SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                                    MyButton(
                                                                      width: MediaQuery.of(context).size.width *
                                                                          0.35,
                                                                      name: 'Cancel',textColor: Colors.black,
                                                                      color: HexColor('#E4E4E4'),
                                                                      maxLines: 1,
                                                                      onPressed: () {
                                                                        Get.back();

                                                                      },
                                                                    ),


                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            CircleAvatar(backgroundColor: primaryColor, maxRadius: 30.0, child:   Icon(Icons.password,color: Colors.white,),

                                                            ),
                                                          ],
                                                        )),
                                                  );
                                                }
                                              );
                                            });




                                        // showDialog(
                                        //     context: context,
                                        //     builder:
                                        //         (context) {
                                        //       return Dialog(
                                        //         shape: RoundedRectangleBorder(
                                        //           borderRadius: BorderRadius.circular(20),
                                        //         ),
                                        //         elevation: 0,
                                        //         child:
                                        //         Container(
                                        //           width: 636,
                                        //           height: 562,
                                        //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                                        //           child:
                                        //       Column(children: [
                                        //
                                        //         MyPasswordTextFormField(width: 531,
                                        //             validator: emptyStringValidator,
                                        //             controller: controller.subAdminPasswordController,
                                        //             labelText: "Password",
                                        //             fontWeight: FontWeight.w600,
                                        //             labelTextColor: secondaryColor,
                                        //             hintTextColor: secondaryColor,
                                        //             togglePasswordView: controller.togglePasswordView,
                                        //             hintText: "Enter Password",
                                        //             onFocusedBorderColor: primaryColor,
                                        //             onEnabledBorderColor: primaryColor,
                                        //             obscureText: controller.isHidden),
                                        //
                                        //
                                        //       ],)
                                        //         ),
                                        //       );
                                        //     });




                                      },
                                      child: Text(
                                        "Reset Password",
                                        style:    GoogleFonts.montserrat(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )),
                                ],
                              )

                            ],
                          ),
                        ),
                      )),
                ),
              ));
        });
  }
}

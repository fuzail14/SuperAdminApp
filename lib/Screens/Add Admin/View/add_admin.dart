import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/add_admin_controller.dart';



class AddAdmin extends GetView {
  final AddAdminController _addAdminController = Get.put(AddAdminController());
  
  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        appBar: AppBar(
          foregroundColor: primaryColor,
          title: Text('Add Admin',style:   GoogleFonts.montserrat(
              color: primaryColor,
             fontWeight: FontWeight.w600
          ),),
          backgroundColor: secondaryColor,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key:_addAdminController. formKey,
            child: GetBuilder<AddAdminController>(
              init: AddAdminController(),
              builder: (controller) {
                return
                  SingleChildScrollView(
                  child:
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(


                      children: [

                        Stack(
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 80.0,
                                backgroundColor: Colors.white,
                                backgroundImage: controller.file == null
                                    ? AssetImage("images/user.png")
                                as ImageProvider
                                    : FileImage(
                                  File(controller.file!.path),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 115,
                              top: 110,
                              child: InkWell(
                                onTap: ()  async{
                                  controller.file = await controller.getFile();
                                  print(controller.isFile);
                                  print(controller.file);
                                },
                                child: Container(width: 40,height: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: primaryColor),
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
                        //             shape: BoxShape.circle,
                        //             image: DecorationImage(
                        //                 fit: BoxFit.cover,
                        //                 image: FileImage(
                        //                     File(
                        //                       controller.file.path,
                        //                     ),
                        //                     scale: 1.0)),
                        //           ) : BoxDecoration(
                        //
                        //               shape: BoxShape.circle,
                        //               image: DecorationImage(
                        //                 scale: 1.0,
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
                              validator: emptyStringValidator,

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
                              onPressed: () {
                                if (_addAdminController.formKey.currentState!.validate()) {

                                  // if(controller.file == null){
                                  //
                                  //   Get.snackbar('Image', "Please Add Image");
                                  // }

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
                              fontWeight: FontWeight.w700,
                            textColor: primaryColor,
                              name: 'Save',
                              color: secondaryColor,
                              maxLines: 1),
                        )

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )));
  }
}

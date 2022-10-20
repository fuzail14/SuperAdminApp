import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import '../../Widgets/My TextForm Field/my_textform_field.dart';
class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventStartDateController = TextEditingController();
  TextEditingController eventEndDateController= TextEditingController();
  File? imageFile;

  final _formKey= GlobalKey<FormState>();
  bool flag=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add Event"),backgroundColor: primaryColor,),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  imageProfile(),

                  MyTextFormField(

                      controller: eventNameController,
                      hintText: "Event Name",
                      obscureText: false,
                      labelText: "Event Name",
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor),
                  MyTextFormField(

                      controller: eventDescriptionController,
                      hintText: "Event Description",
                      obscureText: false,
                      labelText: "Event Description",
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor),
                  MyTextFormField(
                    onTap: () {
                      setState(() async{
                        eventStartDateController.text=(await getDate(context)) ;
                      });

                    },
                      controller: eventStartDateController,
                      hintText: "Start Date",
                      obscureText: false,
                      labelText: "Start Date",
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor),
                  MyTextFormField(
                      onTap: (){

                        setState(() async{
                          eventEndDateController.text=(await getDate(context))  ;
                        });

                      },
                      controller: eventEndDateController,
                      hintText: "End Date",
                      obscureText: false,
                      labelText: "End Date",
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor),

                  MyButton(
                      width: MediaQuery.of(context).size.width * 0.4,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.snackbar("Events", "Event Add Successfully");
                          Navigator.pop(context);

                        }
                      },
                      horizontalPadding: 8,
                      verticalPadding: 8,
                      name: 'Save',
                      color: primaryColor,
                      maxLines: 1)
                ],
              ),
            ),
          ),
        ));
  }




  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: imageFile == null
              ? const AssetImage("images/logo.png")
              : Image.file(File(imageFile!.path)) as ImageProvider ,
          backgroundColor: Colors.white,
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: ClipOval(
            child: Material(
              color: Colors.grey[400],
              child: InkWell(
                splashColor: Colors.red,
                onTap: () {

                },
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[600],
                      )),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

}

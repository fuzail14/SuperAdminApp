import 'package:csc_picker/csc_picker.dart';
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
  GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocietyController>(
      init: SocietyController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            foregroundColor: primaryColor,
            backgroundColor: secondaryColor,
            title: Text('Add Society/Building'),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 73, 0, 0),
                      child: Text('Add New Society/Building',
                          style: GoogleFonts.montserrat(
                              color: primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.023,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 73, 0, 0),
                      child: Image.asset(
                        "images/addsociety.png",
                        width: MediaQuery.of(context).size.width * 0.22,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.29,
                      child: CSCPicker(
                        defaultCountry: CscCountry.Pakistan,
                        showStates: true,
                        showCities: true,
                        flagState: CountryFlag.ENABLE,
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade300,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),
                        stateSearchPlaceholder: "State",
                        citySearchPlaceholder: "City",
                        stateDropdownLabel: "*State",
                        cityDropdownLabel: "*City",
                        selectedItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        dropdownHeadingStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        dropdownItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        dropdownDialogRadius: 10.0,
                        searchBarRadius: 10.0,
                        onCountryChanged: (val) {
                          controller.country = val.toString();
                        },
                        onStateChanged: (value) {
                          controller.state = value.toString();
                        },
                        onCityChanged: (value) {
                          controller.city = value.toString();
                        },
                      ),
                    ),
                   
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.29,
                      child: DropdownButton<String>(
                        
                        value: controller.typeval,
                        
                        style: TextStyle(color: Colors.black),
                        items: controller.type
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "Please choose a type",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        onChanged: (value) {
                          controller.Selecttype(value);
                        },
                      ),
                    ),
                   
                   Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.width * 0.02, 0, 0),
                      child: MyTextFormField(
                          fontWeight: FontWeight.w600,
                          labelTextColor: secondaryColor,
                          hintTextColor: secondaryColor,
                          width: MediaQuery.of(context).size.width * 0.29,
                          validator: emptyStringValidator,
                          controller: _societyController.societyAreaController,
                          hintText: "Enter Area",
                          obscureText: false,
                          labelText: "Area",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.width * 0.02, 0, 0),
                      child: MyTextFormField(
                          fontWeight: FontWeight.w600,
                          labelTextColor: secondaryColor,
                          hintTextColor: secondaryColor,
                          width: MediaQuery.of(context).size.width * 0.29,
                          validator: emptyStringValidator,
                          controller: _societyController.societyNameController,
                          hintText: "Enter Name",
                          obscureText: false,
                          labelText: "Name",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.width * 0.02, 0, 0),
                      child: MyTextFormField(
                          fontWeight: FontWeight.w600,
                          labelTextColor: secondaryColor,
                          hintTextColor: secondaryColor,
                          width: MediaQuery.of(context).size.width * 0.29,
                          validator: emptyStringValidator,
                          controller:
                              _societyController.societyAddressController,
                          hintText: "Enter Address",
                          obscureText: false,
                          labelText: "Address",
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                    ),

                SizedBox(width: 400,
                  child: Column(

                      children: <Widget>[
                  ListTile(
                    title: const Text('Scenario # 1: Street => House'),
                    leading: Radio(
                      value: SocietyStructure.scenario1,
                      groupValue: controller.structure,
                      onChanged: (SocietyStructure? value) {

                        controller.selectedSocietyStructure(value);


                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Scenario # 2: Block => Street =>House'),
                    leading: Radio(
                      value: SocietyStructure.scenario2,
                      groupValue: controller.structure,
                      onChanged: (SocietyStructure? value) {
                        controller.selectedSocietyStructure(value);
                      }),
                  ),
                  ListTile(
                    title: const Text('Scenario # 3:Phase => Block => Street =>House'),
                    leading: Radio(
                      value: SocietyStructure.scenario3,
                      groupValue:controller.structure ,
                      onChanged: (SocietyStructure? value) {


                       controller.selectedSocietyStructure(value);
                      },
                    ),
                  ),

                      ],
                    ),
                ),
                Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.width * 0.02, 0, 0),
                      child: MyButton(
                        width: MediaQuery.of(context).size.width * 0.29,
                        textColor: primaryColor,
                        name: "Save",
                        color: secondaryColor,
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        onPressed: () {
                          User user = _societyController.user;

                          if (_formKey.currentState!.validate()) {
                            print(
                              controller.country,
                            );
                            print(
                              controller.state,
                            );
                            print(controller.city);



                            _societyController.addSocietyApi(
                              country: controller.country,
                              state: controller.state,
                              city: controller.city,
                              area:controller.societyAreaController.text,
                              type: controller.typeval,
                              structuretype: controller.structure.index,

                              societyName:
                                  _societyController.societyNameController.text,
                              societyAddress: _societyController
                                  .societyAddressController.text,
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
          )),
    );
  }
}

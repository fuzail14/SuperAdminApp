import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:miasuperadmin/lib/Screens/Update%20Society/Controller/update_society_controller.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../Login/Model/User.dart';

class UpdateSociety extends StatefulWidget {
  const UpdateSociety({Key? key}) : super(key: key);

  @override
  State<UpdateSociety> createState() => _UpdateSocietyState();
}

class _UpdateSocietyState extends State<UpdateSociety> {
  var data = Get.arguments;
  User? user;
  final UpdateSocietyController updateSocietyController =
      Get.put(UpdateSocietyController());

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    updateSocietyController.societyid.value = data[0];
    updateSocietyController.token.value = data[1];
    updateSocietyController.societyname.value = data[2];
    updateSocietyController.societyaddress.value = data[3];
    updateSocietyController.userid.value = data[4];
       user =data[5];
       print(user);

updateSocietyController.societyNameController.text= updateSocietyController.societyname.value;
updateSocietyController.societyAddressController.text=updateSocietyController.societyaddress.value;
       print(updateSocietyController.societyname.value);
       print(updateSocietyController.societyaddress.value);

    print('-----userid--------');
print(    updateSocietyController.userid.value);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Society"),
          backgroundColor: primaryColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
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
                    print(updateSocietyController.societyid.value.toString());
                    print(updateSocietyController.token.value.toString());
                    print(updateSocietyController.societyname.value.toString());
                    print(updateSocietyController.societyaddress.value.toString());
                    updateSocietyController.societyname.value = updateSocietyController.societyNameController.text;
                    updateSocietyController.societyaddress.value = updateSocietyController.societyAddressController.text;
                 updateSocietyController.user=user;
                    updateSocietyController.updateSocietyApi(
                        societyid: updateSocietyController.societyid.value,
                        token: updateSocietyController.token.value,
                        societyname: updateSocietyController.societyname.value,
                        societyaddress: updateSocietyController.societyaddress.value,
                        userid:   updateSocietyController.userid.value,

                    );






                  },
                )
              ],
            ),
          ),
        ));
  }
}

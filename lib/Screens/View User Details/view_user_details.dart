import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import '../Arrivals/arrivals.dart';
import '../Reports/reports.dart';
import '../View Residents/Model/Resident.dart';

class ViewUserDetails extends GetView {
  late Resident resident;

  var argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(argument);

    resident = argument[0];
    print("data ${resident}");

    return Scaffold(
        appBar: AppBar(
          title: Text("User Detail"),
          backgroundColor: primaryColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back_outlined)),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/user.jpg'),
              radius: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("ID",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("First Name",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Last Name",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("CNIC", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Mobile No",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Address",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Vechile No",
                      style: TextStyle(fontWeight: FontWeight.bold)),

                  (resident.residenttype == 'rental')
                      ? Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Type",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Owner Name",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Owner Address",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Owner Mobile NO",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )
                      : Container()

                  // Text("Image",style: TextStyle(fontWeight: FontWeight.bold)),
                  // Text("Details",style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(_gatekeepers[index]['id'].toString()),
                  Text(resident.firstname!.toUpperCase()),
                  Text(resident.lastname!.toUpperCase()),
                  Text(resident.cnic!.toUpperCase()),
                  Text(resident.mobileno!.toUpperCase()),
                  Text(resident.address!.toUpperCase()),
                  Text(
                    resident.vechileno!.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                  ),

                  (resident.residenttype == 'rental')
                      ? Column(
                          children: [
                            Text(resident.residenttype!.toUpperCase()),
                            Text(resident.ownername!.toUpperCase()),
                            Text(resident.owneraddress!.toUpperCase()),
                            Text(resident.ownermobileno!.toUpperCase())
                          ],
                        )
                      : Container(),
                  // Text("Image"),
                  // Text("Details")
                ],
              ),
            ]),
            // MyButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Reports()));

            // },

            //     horizontalPadding: 8, verticalPadding: 8, name: 'Reports', color: primaryColor, maxLines: 1),
            // MyButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=>Arrivals()));},
            //     horizontalPadding: 8, verticalPadding: 8, name: 'Arrivals', color: primaryColor, maxLines: 1),
          ],
        ));
  }
}

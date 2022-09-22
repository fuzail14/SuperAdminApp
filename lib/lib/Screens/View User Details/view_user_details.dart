import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miasuperadmin/lib/Constants/constants.dart';
import 'package:miasuperadmin/lib/Screens/Arrivals/arrivals.dart';
import 'package:miasuperadmin/lib/Screens/Reports/reports.dart';
import 'package:miasuperadmin/lib/Widgets/My%20Button/my_button.dart';
class ViewUserDetails extends StatefulWidget {
  const ViewUserDetails({Key? key}) : super(key: key);

  @override
  State<ViewUserDetails> createState() => _ViewUserDetailsState();
}

class _ViewUserDetailsState extends State<ViewUserDetails> {
  List<Map> _gatekeepers = [

    {

      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03015566446',
      'ownerfirstname': 'Waqar',
      'ownerlastname': 'Ali',
      'owneraddress': 'Comitte Chowk Near',
      'ownermobileno': '0321 5550979',
      'type': 'Rental',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'password':"123456",
      "vechileno":"Lhr-234",
      "img":"images/user.jpg"
    },



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("User Detail"), backgroundColor: primaryColor,
        leading:GestureDetector(onTap: (){

      Navigator.pop(context);
    },
      child: const Padding(padding: EdgeInsets.all(8),

          child: Icon(Icons.arrow_back_outlined)) ,),

    ),body:ListView.builder(
      itemCount: _gatekeepers.length,
      itemBuilder: (context, index) {
        return Column(children: [
      SizedBox(height: 10,),
CircleAvatar(backgroundImage: AssetImage(_gatekeepers[index]['img'].toString() ),radius: 60,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                   // Text("ID",style: TextStyle(fontWeight: FontWeight.bold),),
                   Text("First Name",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Last Name",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("CNIC",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Mobile No",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Address",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Vechile No",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Type",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Owner First Name",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Owner Last Name",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Owner Address",style: TextStyle(fontWeight: FontWeight.bold)),
                   Text("Owner Mobile NO",style: TextStyle(fontWeight: FontWeight.bold)),
                   // Text("Image",style: TextStyle(fontWeight: FontWeight.bold)),
                   // Text("Details",style: TextStyle(fontWeight: FontWeight.bold))


                ],


                )
                ,
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(_gatekeepers[index]['id'].toString()),
                    Text(_gatekeepers[index]['firstname'].toString()),
                    Text("Last Name"),
                    Text("CNIC"),
                    Text("Mobile No"),
                    Text("Address"),
                    Text("Vechile No",overflow: TextOverflow.ellipsis,),
                    Text("Password"),
                    Text("Owner"),
                   
                    Text("Owner First Name"),
                    Text("Owner Last Name"),
                    Text("Owner Address"),
                    Text("Owner Mobile NO"),
                    // Text("Image"),
                    // Text("Details")







                  ],),
              ]),
          MyButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Reports()));


          },

              horizontalPadding: 8, verticalPadding: 8, name: 'Reports', color: primaryColor, maxLines: 1),
          MyButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=>Arrivals()));},
              horizontalPadding: 8, verticalPadding: 8, name: 'Arrivals', color: primaryColor, maxLines: 1),


        ],);

      },
    )

    );
  }
}

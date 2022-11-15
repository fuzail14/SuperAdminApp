
import 'package:flutter/material.dart';


import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import 'arrivals_checkin_checkout_detals.dart';

class Arrivals extends StatefulWidget {
  const Arrivals({Key? key}) : super(key: key);

  @override
  State<Arrivals> createState() => _ArrivalsState();
}

class _ArrivalsState extends State<Arrivals> {



  List<Map> _gatekeepers = [
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "Date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "Date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "Date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "Date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "Date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "Date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },


  ];


  List<DataColumn> userDataColumn=[

    DataColumn(label: Text("Guest Name")),
    DataColumn(label: Text("CNIC")),
    DataColumn(label: Text("Vechile No",overflow: TextOverflow.ellipsis,)),
    DataColumn(label: Text("Mobile No",overflow: TextOverflow.ellipsis,)),
    DataColumn(label: Text("Image")),
    DataColumn(label: Text("Check in / Check out details")),
    // DataColumn(label: Text("Arrivals")),


  ];
  int index=0;

  List<DataRow> userDataRows () {
    return _gatekeepers.map((e) =>
        DataRow(cells: [

          DataCell(Text(e['name'].toString())),
          DataCell(Text(e['cnic'].toString())),
          DataCell(Text(e['vechileno'].toString()),),
          DataCell(Text(e['mobileno'].toString()),),
          DataCell(CircleAvatar(backgroundImage: AssetImage(e['image'].toString()),)),
          DataCell(MyButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ArrivalsCheckInCheckOut()));


          },

            name: "Check IN / Check OUT", color: primaryColor, maxLines: 1,)),



        ]),


    ).toList();
  }
  @override
  Widget build(BuildContext context) {
    return       Scaffold(
      appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("Users"),
        leading:GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back_outlined))),),

      body:
      SingleChildScrollView(  scrollDirection: Axis.vertical,

        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columns: userDataColumn,rows: userDataRows(),)),
      ),
    );
  }


  ApiData() async {
    List<Map>? myProducts;

    myProducts = List.generate(
        50,
            (index) =>
        {
          "id": index,
          "title": "Rob me tobacco, ye evil fish! $index",
          "description": "$index Resist impressively like an ordinary teleporter.",
          "date": "20-04-2021",
          "time": "4:00 pm",
          "vechile_no": "RWP-2034"
        }).toList();


    return myProducts;
  }
}
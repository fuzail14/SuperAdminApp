import 'package:flutter/material.dart';

import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import '../View User Details/view_user_details.dart';
class ArrivalsCheckInCheckOut extends StatefulWidget {
  const ArrivalsCheckInCheckOut({Key? key}) : super(key: key);

  @override
  State<ArrivalsCheckInCheckOut> createState() => _ArrivalsCheckInCheckOutState();
}

class _ArrivalsCheckInCheckOutState extends State<ArrivalsCheckInCheckOut> {

  List<Map> _gatekeepers = [
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },
    {

      'name': 'Noman Awan',
      'cnic': '37405-7677637-1',
      "vechileno":"Lhr-234",
      "mobileno":"03215550979",
      "date":"12-10-2022",
      "checkintime":"1:00",
      "checkouttime":"3:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Suleman',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"4:00",
      "checkouttime":"5:00",
      'image':'images/user2.jpg',

    },

    {

      'name': 'Haadi',
      'cnic': '37405-7677637-1',
      "vechileno":"Rwp-234",
      "mobileno":"03215550979",
      "date":"13-10-2022",
      "checkintime":"6:00",
      "checkouttime":"8:00",
      'image':'images/user2.jpg',

    },


  ];



  List<DataColumn> userDataColumn=[

    DataColumn(label: Text("Date")),
    DataColumn(label: Text("Check In Time")),
    DataColumn(label: Text("Check Out Time",overflow: TextOverflow.ellipsis,)),

    // DataColumn(label: Text("Arrivals")),


  ];
  List<DataRow> userDataRows () {
    return _gatekeepers.map((e) =>
        DataRow(cells: [

          DataCell(Text(e['date'].toString())),
          DataCell(Text(e['checkintime'].toString())),
          DataCell(Text(e['checkouttime'].toString()),),



        ]),


    ).toList();
  }
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("Guest Arrivals"),
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
}

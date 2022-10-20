
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import '../View User Details/view_user_details.dart';
class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List<Map> _gatekeepers = [
    {
      'id': 1,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'reporttitle':"Sit and you will be emerged earthly.",
      'reportdes':"Harmless courages lead to the attitude.",
  'reportdate':"22-11-2022",
  'progressdate':"23-11-2022",
  'completedate':"24-11-2022",

},
    {
      'id': 1,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'reporttitle':"Sit and you will be emerged earthly.",
      'reportdes':"Harmless courages lead to the attitude.",
      'reportdate':"22-11-2022",
      'progressdate':"23-11-2022",
      'completedate':"24-11-2022",

    },
    {
      'id': 2,
      'name': 'Suleman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'reporttitle':"Sit and you will be emerged earthly.",
      'reportdes':"Harmless courages lead to the attitude.",
    'reportdate':"22-11-2022",
    'progressdate':"23-11-2022",
    'completedate':"24-11-2022",



    },
    {
      'id': 3,
      'name': 'Fuazial',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'reporttitle':"Sit and you will be emerged earthly.",
      'reportdes':"Harmless courages lead to the attitude.",
    'reportdate':"22-11-2022",
    'progressdate':"23-11-2022",
    'completedate':"24-11-2022",


    },

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("Reports"),
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


  List<DataColumn> userDataColumn=[

    // DataColumn(label: Text("Name")),
    // DataColumn(label: Text("CNIC")),
    // DataColumn(label: Text("Address")),
    DataColumn(label: Text("Report Title")),
    DataColumn(label: Text("Report Des")),
    DataColumn(label: Text("Report Date")),
    DataColumn(label: Text("Progress Date")),
    DataColumn(label: Text("Complete Date")),
    // DataColumn(label: Text("Image")),




  ];
  int index=0;

  List<DataRow> userDataRows () {
    return _gatekeepers.map((e) =>
        DataRow(cells: [

          // DataCell(Text(e['name'].toString())),
          // DataCell(Text(e['cnic'].toString())),
          // DataCell(Text(e['address'].toString())),
          DataCell(Text(e['reporttitle'].toString()),),
          DataCell(Text(e['reportdes'].toString()),),
          DataCell(Text(e['reportdate'].toString()),),
          DataCell(Text(e['progressdate'].toString()),),
          DataCell(Text(e['completedate'].toString()),),
          // DataCell(CircleAvatar(backgroundImage: AssetImage(e['image'].toString()),)),

        ]),


    ).toList();
  }


}

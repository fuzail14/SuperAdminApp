
import 'package:flutter/material.dart';

import '../../Constants/constants.dart';

class ViewGateKeepers extends StatefulWidget {
  const ViewGateKeepers({Key? key}) : super(key: key);

  @override
  State<ViewGateKeepers> createState() => _ViewGateKeepersState();
}

class _ViewGateKeepersState extends State<ViewGateKeepers> {
  List<Map> _gatekeepers = [
    {
      'id': 1,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'password':"123456",
      "vechileno":"Lhr-234"
    },
    {
      'id': 2,
      'name': 'Suleman Awan',
      'cnic': '8485757575757',
      'address': 'Isl',
      'image':'images/user.jpg',
      'password':"Test#123",
      "vechileno":"Lhr-234"
    },
    {
      'id': 3,
      'name': 'Fuzxail',
      'cnic': 'kdkdkdk',
      'address': 'Karachi',
      'image':'images/user2.jpg',
      'password':"Test323",
      "vechileno":"Lhr-234"


    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },
    {
      'id': 4,
      'name': 'Flutter Basics',
      'cnic': '939393939',
      'address': 'Lahore',
      'image':'images/user.jpg',
      'password':"djjddj123",
      "vechileno":"Lhr-234"

    },



  ];



  List<DataColumn> userDataColumn=[
    const DataColumn(label: Text("ID")),
    const DataColumn(label: Text("Name")),
    const DataColumn(label: Text("CNIC")),
    const DataColumn(label: Text("Address")),
    const DataColumn(label: Text("Password")),

    const DataColumn(label: Text("Image")),


  ];

  List<DataRow> userDataRows () {
    return _gatekeepers.map((e) =>
        DataRow(cells: [
          DataCell(Text(e['id'].toString())),
          DataCell(Text(e['name'].toString())),
          DataCell(Text(e['cnic'].toString())),
          DataCell(Text(e['address'].toString())),
          DataCell(Text(e['password'].toString())),

          DataCell(CircleAvatar(
            backgroundImage: AssetImage(e['image'].toString()),)),


        ]),


    ).toList();
  }
  @override
  Widget build(BuildContext context) {



    return  Scaffold(appBar:AppBar(backgroundColor: primaryColor,
      title: const Text("Gate Keepers"),
   ),


  body: Container(width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(   scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(columnSpacing: 200,

            columns: userDataColumn,rows: userDataRows(),)),
    ),
  ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:miasuperadmin/lib/Screens/View%20User%20Details/view_user_details.dart';
import 'package:miasuperadmin/lib/Widgets/My%20Button/my_button.dart';

import '../../Constants/constants.dart';
import '../Arrivals/arrivals.dart';
import '../Reports/reports.dart';

class ViewUsers extends StatefulWidget {
  const ViewUsers({Key? key}) : super(key: key);

  @override
  State<ViewUsers> createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {

  List<Map> _gatekeepers = [

    {
  'id': 1,
  'firstname': 'Noman',
  'lastname': 'Awan',
  'cnic': '34848854594595',
  'mobileno': '03015566446',
  'ownerfirstname': 'Waqar',
  'ownerlastname': 'Ali',
  'owneraddress': 'Comitte Chowk Near by Frescow Sweet',
  'ownermobileno': '0321 5550979',
  'type': 'Owner',
  'address': 'NE 728',
  'image':'images/user2.jpg',
  'password':"123456",
  "vechileno":"Lhr-234"
},
    {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03015566446',
      'ownerfirstname': 'Waqar',
      'ownerlastname': 'Ali',
      'owneraddress': 'Comitte Chowk Near',
      'ownermobileno': '0321 5550979',
      'type': 'Owner',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'password':"123456",
      "vechileno":"Lhr-234",
      "img":"images/user.jpg"
    },
    {
      'id': 1,
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
    {
      'id': 1,
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
    {
      'id': 1,
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
    {
      'id': 1,
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
    {
      'id': 1,
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
    {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03015566446',
      'ownerfirstname': 'Waqar',
      'ownerlastname': 'Ali',
      'owneraddress': 'Comitte Chowk Near',
      'ownermobileno': '0321 5550979',
      'type': 'Owner',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'password':"123456",
      "vechileno":"Lhr-234",
      "img":"images/user.jpg"
    },
    {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03015566446',
      'ownerfirstname': 'Waqar',
      'ownerlastname': 'Ali',
      'owneraddress': 'Comitte Chowk Near',
      'ownermobileno': '0321 5550979',
      'type': 'Owner',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'password':"123456",
      "vechileno":"Lhr-234",
      "img":"images/user.jpg"
    },
    {
      'id': 1,
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
    {
      'id': 1,
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
    {
      'id': 1,
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
    {
      'id': 1,
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
    {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03015566446',
      'ownerfirstname': 'Waqar',
      'ownerlastname': 'Ali',
      'owneraddress': 'Comitte Chowk Near',
      'ownermobileno': '0321 5550979',
      'type': 'Owner',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'password':"123456",
      "vechileno":"Lhr-234",
      "img":"images/user.jpg"
    },
    {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03015566446',
      'ownerfirstname': 'Waqar',
      'ownerlastname': 'Ali',
      'owneraddress': 'Comitte Chowk Near',
      'ownermobileno': '0321 5550979',
      'type': 'Owner',
      'address': 'NE 728',
      'image':'images/user2.jpg',
      'password':"123456",
      "vechileno":"Lhr-234",
      "img":"images/user.jpg"
    },


];


List<DataColumn> userDataColumn=[
    // DataColumn(label: Text("ID")),
    DataColumn(label: Text("First Name")),
    DataColumn(label: Text("Last Name")),
    DataColumn(label: Text("CNIC")),
    DataColumn(label: Text("Mobile No")),
    DataColumn(label: Text("Address")),
    DataColumn(label: Text("Vechile No",overflow: TextOverflow.ellipsis,)),
     DataColumn(label: Text("Password")),
    DataColumn(label: Text("Type")),
    DataColumn(label: Text("Owner First Name")),
    DataColumn(label: Text("Owner Last Name")),
    DataColumn(label: Text("Owner Address")),
    DataColumn(label: Text("Owner Mobile NO")),
    DataColumn(label: Text("Image")),
    DataColumn(label: Text("Details")),
    // DataColumn(label: Text("Arrivals")),


  ];
int index=0;

  List<DataRow> userDataRows () {
    return _gatekeepers.map((e) =>
        DataRow(cells: [
          // DataCell(Text(e['id'].toString())),
          DataCell(Text(e['firstname'].toString())),
          DataCell(Text(e['lastname'].toString())),
          DataCell(Text(e['cnic'].toString())),
          DataCell(Text(e['mobileno'].toString())),
          DataCell(Text(e['address'].toString())),
          DataCell(Text(e['vechileno'].toString()),),
          DataCell(Text(e['password'].toString())),
          DataCell(Text(e['type'].toString())),
          DataCell(Text(e['ownerfirstname'].toString())),
          DataCell(Text(e['ownerlastname'].toString())),
          DataCell(Text(e['owneraddress'].toString())),
          DataCell(Text(e['ownermobileno'].toString())),

          DataCell(CircleAvatar(backgroundImage: AssetImage(e['image'].toString()),)),
          DataCell(MyButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUserDetails()));


          },

            horizontalPadding: 0,verticalPadding: 0,name: "Details", color: primaryColor, maxLines: 1,)),



        ]),


    ).toList();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:AppBar(
backgroundColor: primaryColor,
      title: Text("Users"),
      ),

   body:
   SingleChildScrollView(  scrollDirection: Axis.vertical,

      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 20,
            columns: userDataColumn,rows: userDataRows(),)),
    ),
    );
  }
}

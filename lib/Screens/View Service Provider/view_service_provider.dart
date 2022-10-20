import 'package:flutter/material.dart';
import 'package:miasuperadmin/Screens/View%20Service%20Provider/service_provider_attendance_history.dart';


import '../../Constants/constants.dart';
class ViewServiceProvider extends StatefulWidget {
  const ViewServiceProvider({Key? key}) : super(key: key);

  @override
  State<ViewServiceProvider> createState() => _ViewServiceProviderState();
}

class _ViewServiceProviderState extends State<ViewServiceProvider> {
  List<Map> _providers = [

  {
  'id': 1,
  'firstname': 'Noman',
  'lastname': 'Awan',
  'cnic': '34848854594595',
  'mobileno': '03014566446',
  'role': 'cook',
  'address': 'NE 728',
    'salary':"25000 pkr",
  'image':'images/user2.jpg',
    "from":"9:00 am",
    "to":"8:00 pm",
    "availibility":"Mon to Saturday",
    "experience":"2 years",
    "des":"ima professional cook"
},  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },  {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '03014566446',
      'role': 'cook',
      'address': 'NE 728',
      'salary':"25000 pkr",
      'image':'images/user2.jpg',
      "from":"9:00 am",
      "to":"8:00 pm",
      "availibility":"Mon to Saturday",
      "experience":"2 years",
      "des":"ima professional cook"
    },



  ];
  @override
  Widget build(BuildContext context) {


    return   Scaffold(
      appBar:AppBar(
        backgroundColor: primaryColor,
        title: Text("Service Providers"),
       ),

      body:
      SingleChildScrollView(  scrollDirection: Axis.vertical,

        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 32,
              columns: userDataColumn,rows: userDataRows(),)),
      ),
    );
  }

  List<DataColumn> userDataColumn=[
    // DataColumn(label: Text("ID")),
    DataColumn(label: Text("First Name")),
    DataColumn(label: Text("Last Name")),
    DataColumn(label: Text("CNIC")),
    DataColumn(label: Text("Mobile No")),
    DataColumn(label: Text("Address")),
    DataColumn(label: Text("Role")),
    DataColumn(label: Text("From")),
    DataColumn(label: Text("To")),
    DataColumn(label: Text("Availibility")),
    DataColumn(label: Text("Experience")),
    DataColumn(label: Text("Description")),
    DataColumn(label: Text("Salary")),
    DataColumn(label: Text("Image")),
    DataColumn(label: Text("Details")),




  ];
  int index=0;

  List<DataRow> userDataRows () {
    return _providers.map((e) =>
        DataRow(cells: [


          DataCell(Text(e['firstname'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['lastname'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['cnic'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['mobileno'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['address'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['role'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['from'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['to'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['availibility'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['experience'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['des'],style:TextStyle(fontSize: 14))),
          DataCell(Text(e['salary'],style:TextStyle(fontSize: 14))),
          DataCell(CircleAvatar(backgroundImage: AssetImage(e['image']),)),
          DataCell(
              ElevatedButton(onPressed: (){          Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceProviderAttendanceHistory()));},child: Text('Check in out history',style: TextStyle(fontSize: 14),),)




          )]),


    ).toList();
  }
}

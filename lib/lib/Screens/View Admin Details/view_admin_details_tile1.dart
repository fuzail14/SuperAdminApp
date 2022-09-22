import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import '../Chat/chat.dart';
import '../Update Admin/View/update_admin.dart';

class ViewAdminDetailsTile1 extends StatefulWidget {
  const ViewAdminDetailsTile1({Key? key}) : super(key: key);

  @override
  State<ViewAdminDetailsTile1> createState() => _ViewAdminDetailsTile1State();
}

class _ViewAdminDetailsTile1State extends State<ViewAdminDetailsTile1> {
  List<Map> _admin = [
    {
      'id': 1,
      'firstname': 'Noman',
      'lastname': 'Awan',
      'cnic': '34848854594595',
      'mobileno': '34848854594595',
      'address': 'NE 728',
      'image': 'images/user.jpg',
      'password': "123456",
    },
  ];

  List<DataColumn> userDataColumn = [
    const DataColumn(label: Text("First Name")),
    const DataColumn(label: Text("Last Name")),
    const DataColumn(label: Text("CNIC")),
    const DataColumn(label: Text("Mobile NO")),
    const DataColumn(label: Text("Address")),
    const DataColumn(label: Text("Password")),
    const DataColumn(label: Text("Image")),
    const DataColumn(label: Text("Delete")),
    const DataColumn(label: Text("Update")),
    const DataColumn(label: Text("Chats")),
  ];

  List<DataRow> userDataRows() {
    return _admin
        .map(
          (e) => DataRow(cells: [
            DataCell(Text(e['firstname'].toString())),
            DataCell(Text(e['lastname'].toString())),
            DataCell(Text(e['cnic'].toString())),
            DataCell(Text(e['mobileno'].toString())),
            DataCell(Text(e['address'].toString())),
            DataCell(Text(e['password'].toString())),
            DataCell(CircleAvatar(
              backgroundImage: AssetImage(e['image'].toString()),
            )),
            DataCell(GestureDetector(
                onTap: () {
                  _showDeleteDialog();
                },
                child: Icon(
                  Icons.delete,
                  color: primaryColor,
                ))),
            DataCell(MyButton(
              onPressed: () {
                Get.toNamed(updateAdmin);
              },
              name: 'Update',
              horizontalPadding: 8,
              verticalPadding: 8,
              color: primaryColor,
              maxLines: 1,
            )),
            DataCell(IconButton(
              icon: Icon(
                Icons.chat,
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chat()));
              },
            )),
          ]),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      trackVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: userDataColumn,
          rows: userDataRows(),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Update Admin Details'),
              content: Container(
                  width: MediaQuery.of(context).size.width,
                  child: UpdateAdmin()),
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  Future<void> _showDeleteDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete this Admin?'),
              actions: <Widget>[
                MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    horizontalPadding: 0,
                    verticalPadding: 0,
                    name: 'Delete',
                    color: primaryColor,
                    maxLines: 1),
                MyButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  name: 'Cancel',
                  color: Colors.white60,
                  maxLines: 1,
                  textColor: Colors.black,
                ),
              ],
            ));
  }
}

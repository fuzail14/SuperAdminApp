import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:miasuperadmin/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/Constants/constants.dart';

import '../Controller/view_resident_controller.dart';
import '../Model/Resident.dart';

class ViewUsers extends GetView {
  ViewResidentsController viewResidentsController =
      Get.put(ViewResidentsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewResidentsController>(
      init: ViewResidentsController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back_outlined))),
            title: AutoSizeText(
              'View Residents Detail',
              minFontSize: 10,
              stepGranularity: 10,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: FutureBuilder(
              future: controller.viewResidentsApi(
                  controller.subadminid, controller.bearerToken),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: MediaQuery.of(context).size.width * 0.05,
                      columns: [
                        DataColumn(label: Text('First Name')),
                        DataColumn(label: Text('LastName')),
                        DataColumn(label: Text('Cnic')),
                        DataColumn(label: Text('Address')),
                        DataColumn(label: Text('Mobileno')),
                        DataColumn(label: Text("Image")),
                        DataColumn(label: Text("Details")),
                      ],
                      rows: List.generate(snapshot.data.length, (index) {
                        final firstname = snapshot.data[index].firstname;
                        final lastname = snapshot.data[index].lastname;
                        final cnic = snapshot.data[index].cnic;
                        final address = snapshot.data[index].address;
                        final mobileno = snapshot.data[index].mobileno;

                        return DataRow(cells: [
                          DataCell(
                              Container(width: 75, child: Text(firstname))),
                          DataCell(Container(child: Text(lastname))),
                          DataCell(Container(child: Text(cnic))),
                          DataCell(Container(child: Text(address))),
                          DataCell(Container(child: Text(mobileno))),
                          DataCell(Container(
                              child: CircleAvatar(
                            backgroundImage: AssetImage('images/residents.png'),
                          ))),
                          DataCell(Container(
                              child: GestureDetector(
                                  onTap: () {
                                    print( snapshot.data[index]);
                                    Get.toNamed(viewUserDetails,
                                        arguments: [
                                          snapshot.data[index]
                                        ]);


                                  },
                                  child: Icon(Icons.info)))),
                        ]);
                      }),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }

}

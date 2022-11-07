import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../Constants/constants.dart';
import '../Controller/gate_keeper_controller.dart';
import '../Model/gate_keeper_model.dart';


class ViewGateKeepers extends GetView {
  ViewGateKeeperController viewResidentsController =
      Get.put(ViewGateKeeperController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewGateKeeperController>(
      init: ViewGateKeeperController(),
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
              'View GateKeepers Detail',
              minFontSize: 10,
              stepGranularity: 10,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: FutureBuilder(
              future: controller.viewgatekeepers(
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
                        DataColumn(label: Text("Gate No")),
                        DataColumn(label: Text("Image")),
                      ],
                      rows: List.generate(snapshot.data.length, (index) {
                        
                        
                        
                        
                        String firstname = snapshot.data[index].firstname;
                        String lastname = snapshot.data[index].lastname;
                        String cnic = snapshot.data[index].cnic;
                        String address = snapshot.data[index].address;
                        String mobileno = snapshot.data[index].mobileno;
                        String gateno = snapshot.data[index].gateno;
                        
                        

                        return DataRow(cells: [
                          DataCell(
                              Container(width: 75, child: Text(firstname))),
                          DataCell(Container(child: Text(lastname))),
                          DataCell(Container(child: Text(cnic))),
                          DataCell(Container(child: Text(address))),
                          DataCell(Container(child: Text(mobileno))),
                             DataCell(Container(child: Text(gateno))
                                  ),
                          DataCell(Container(
                              child: CircleAvatar(
                            backgroundImage: AssetImage('images/residents.png'),
                          ))),
                       
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

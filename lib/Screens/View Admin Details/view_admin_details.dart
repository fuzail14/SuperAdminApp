import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miasuperadmin/Constants/api_routes.dart';
import 'package:miasuperadmin/Screens/View%20Admin%20Details/view_admin_details_tile2.dart';

import '../../Bindings/Set Routes/set_routes.dart';
import '../../Constants/constants.dart';
import 'Controller/view_admin_detail_controller.dart';

class ViewAdminDetails extends GetView {
  ViewAdminDetailsController viewAdminDetailsController =
      Get.put(ViewAdminDetailsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAdminDetailsController>(
      init: ViewAdminDetailsController(),
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
            actions: [
              GestureDetector(
                onTap: () {
                  Get.offAndToNamed(addAdmin,
                      arguments: viewAdminDetailsController.arguments);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AutoSizeText(
                      "Add Admin",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      minFontSize: 10,
                      stepGranularity: 10,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add,
                      semanticLabel: "Add Admin",
                      size: 20,
                    )
                  ],
                ),
              )
            ],
            title: AutoSizeText(
              'View Admin Detail',
              minFontSize: 10,
              stepGranularity: 10,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body:
              // Column(children: [ViewAdminDetailsTile2()],)
              FutureBuilder(
                  future: controller.futureData,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(
                            "${viewAdminDetailsController.societyname} Society Sub Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              columnSpacing:
                                  MediaQuery.of(context).size.width * 0.05,
                              columns: [
                                DataColumn(label: Text('First Name')),
                                DataColumn(label: Text('LastName')),
                                DataColumn(label: Text('Cnic')),
                                DataColumn(label: Text('Address')),
                                DataColumn(label: Text('Mobileno')),
                                DataColumn(label: Text("Actions")),
                                DataColumn(label: Text("")),
                                DataColumn(label: Text("Image")),
                                DataColumn(label: Text("Details")),
                              ],
                              rows:
                                  List.generate(snapshot.data.length, (index) {
                                final firstname =
                                    snapshot.data[index].firstname;
                                final lastname = snapshot.data[index].lastname;
                                final cnic = snapshot.data[index].cnic;
                                final address = snapshot.data[index].address;
                                final mobileno = snapshot.data[index].mobileno;
                                
                                

                                return DataRow(cells: [
                                  DataCell(Container(
                                      width: 75, child: Text(firstname))),
                                  DataCell(Container(child: Text(lastname))),
                                  DataCell(Container(child: Text(cnic))),
                                  DataCell(Container(child: Text(address))),
                                  DataCell(Container(child: Text(mobileno))),
                                  DataCell(Container(
                                      child: GestureDetector(
                                          onTap: () {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.info,
                                              animType: AnimType.BOTTOMSLIDE,
                                              title: 'Are You Sure',
                                              desc:
                                                  'Are You Sure You Want To Delete This.............',
                                              btnCancelOnPress: () {},
                                              btnOkOnPress: () {
                                                controller.currentSubAdminId =
                                                    snapshot.data[index].id;
                                                controller.currentToken =
                                                    viewAdminDetailsController
                                                        .user!.bearerToken;

                                                controller.deleteSubAdminApi(
                                                    controller
                                                        .currentSubAdminId,
                                                    controller.currentToken!);
                                              },
                                            )..show();
                                          },
                                          child: Icon(Icons.delete)))),
                                  DataCell(Container(
                                      child: GestureDetector(
                                          onTap: () {
                                            print(
                                                'particular user data.....${snapshot.data[index].firstname}');
                                            Get.offAndToNamed(updateAdmin,
                                                arguments: [
                                                  snapshot.data[index],
                                                  viewAdminDetailsController
                                                      .user!.bearerToken,
                                                  controller.arguments
                                                ]);
                                          },
                                          child: Icon(Icons.edit)))),
                                  DataCell(Container(
                                      child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(imageBaseUrl + snapshot.data[index].image ),
                                  ))),
                                  DataCell(Container(
                                      child: GestureDetector(
                                          onTap: () {
                                            final firstname =
                                                snapshot.data[index].firstname;
                                            final lastname =
                                                snapshot.data[index].lastname;
                                            var subadminFullName =
                                                firstname + lastname;
                                            Get.toNamed(viewAdminDetailsTile2,
                                                arguments: [
                                                  snapshot.data[index].id,
                                                  viewAdminDetailsController
                                                      .user!.bearerToken,
                                                  subadminFullName
                                                ]);
                                          },
                                          child: Icon(Icons.info)))),
                                ]);
                              }),
                            ),
                          ),
                        ],
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

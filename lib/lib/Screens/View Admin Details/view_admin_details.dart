import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/lib/Screens/View%20Admin%20Details/Controller/view_admin_detail_controller.dart';
import 'package:miasuperadmin/lib/Screens/View%20Admin%20Details/Model/view_admin_details_model.dart';
import 'package:miasuperadmin/lib/Screens/View%20Admin%20Details/view_admin_details_tile1.dart';
import 'package:miasuperadmin/lib/Screens/View%20Admin%20Details/view_admin_details_tile2.dart';

import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import '../Login/Model/User.dart';

class ViewAdminDetails extends StatefulWidget {
  @override
  State<ViewAdminDetails> createState() => _ViewAdminDetailsState();
}

class _ViewAdminDetailsState extends State<ViewAdminDetails> {
  ViewAdminDetailsController viewAdminDetailsController =
      Get.put(ViewAdminDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewAdminDetailsController.user = viewAdminDetailsController.arguments[0];
    viewAdminDetailsController.societyid =
        viewAdminDetailsController.arguments[1];

    viewAdminDetailsController.futureData =
        viewAdminDetailsController.ViewAdminApi(
            viewAdminDetailsController.societyid,
            viewAdminDetailsController.user!.bearerToken);

    print('init data.....${viewAdminDetailsController.futureData}');
  }

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
          body: FutureBuilder(
              future: controller.futureData,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    //Get.toNamed(gateKepeerDetailScreen);
                                  },
                                  child: Container(
                                    height: 130,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: ListTile(
                                          // leading: CircleAvatar(
                                          //   radius: 30,
                                          //   backgroundImage: AssetImage(
                                          //     splashlogo,
                                          //   ),
                                          // ),
                                          title: Text(
                                              snapshot.data[index].firstname),

                                          subtitle: Text(
                                              snapshot.data[index].lastname),

                                          trailing: Wrap(children: [
                                            InkWell(
                                              onTap: () {
                                                AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.info,
                                                  animType:
                                                      AnimType.BOTTOMSLIDE,
                                                  title: 'Are You Sure',
                                                  desc:
                                                      'Are You Sure You Want To Delete This.............',
                                                  btnCancelOnPress: () {},
                                                  btnOkOnPress: () {
                                                    controller
                                                            .currentSubAdminId =
                                                        snapshot.data[index].id;
                                                    controller.currentToekn =
                                                        viewAdminDetailsController
                                                            .user!.bearerToken;

                                                    controller.deleteSocietyApi(
                                                        controller
                                                            .currentSubAdminId,
                                                        controller
                                                            .currentToekn!);
                                                  },
                                                  btnOkText: 'Delete',
                                                  btnOkColor: primaryColor,
                                                  btnCancelColor: primaryColor,
                                                )..show();
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: primaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
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
                                              child: Icon(
                                                Icons.edit,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ]),
                                        )),
                                  ));
                            })),
                  );
                } else if (snapshot.hasError) {
                  return Text('');
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}

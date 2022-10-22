


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/view_society_controller.dart';

class ViewSociety extends GetView {

  @override
  Widget build(BuildContext context) {
    print('build call');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            'View Societies',
            textAlign: TextAlign.center,
          ),
        ),
        body:
        GetBuilder<ViewSocietyController>(
          init: ViewSocietyController(),
          builder: (controller) {
            return FutureBuilder(
                future: controller.data,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            controller:controller.searchController,
                            onChanged: (value) =>controller.  debounce(
                              () async {
                             controller.query = value.toString();


                                controller.data =
                                controller.searchSocietyApi(
                                        controller.query,
                                       controller.user.bearerToken!);

                                if (controller.query == "") {
                                  controller.data =
                                      controller.viewAllSocietiesApi(
                                          controller.user.id!,
                                          controller.user.bearerToken!);
                                }


                              },
                            ),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'Search Society',
                                suffixIcon: Icon(Icons.search)),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      print('address ${ snapshot.data[index].societyaddress}');
                                  Get.toNamed(viewAdminDetails, arguments: [
                                   controller. user,
                                    snapshot.data[index].societyid,
                                    snapshot.data[index].societyname,
                                    
                                  ]);

                                    },
                                    child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: ListTile(
                                            leading: const CircleAvatar(
                                              backgroundImage:
                                                  AssetImage("images/user2.jpg"),
                                            ),
                                            title: Text(
                                              snapshot.data[index].societyname,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                              snapshot.data[index].societyaddress
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            trailing: Wrap(spacing: 20, children: [
                                              GestureDetector(
                                                  onTap: () {

                                                  controller.showDeleteDialog(context, societyid: snapshot.data[index].societyid,beartoken: controller.user.bearerToken);

                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: primaryColor,
                                                  )),
                                              MyButton(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  horizontalPadding: 0,
                                                  verticalPadding: 0,
                                                  name: "Update",
                                                  color: primaryColor,
                                                  maxLines: 1,
                                                  onPressed: () {


                                                    Get.offAndToNamed(updateSociety,arguments: [snapshot.data[index],controller.user     ]);

                                                  })
                                            ]))));
                              }),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print("djjd");
                    return Icon(Icons.error_outline);
                  } else {
                    print("else");
                    return CircularProgressIndicator();
                  }
                });
          }
        ));
  }
}

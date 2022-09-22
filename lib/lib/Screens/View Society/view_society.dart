import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/lib/Screens/Update%20Society/Controller/update_society_controller.dart';
import 'package:miasuperadmin/lib/Screens/View%20Society/Controller/view_society_controller.dart';
import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import '../View Admin Details/view_admin_details.dart';

class ViewSociety extends StatefulWidget {
  @override
  State<ViewSociety> createState() => _ViewSocietyState();
}

class _ViewSocietyState extends State<ViewSociety> {
  final ViewSocietyController _viewSocietyController =
      Get.put(ViewSocietyController());
  final UpdateSocietyController updateSocietyController =
      Get.put(UpdateSocietyController());
  TextEditingController searchController = TextEditingController();
   var user = Get.arguments;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewSocietyController.debouncer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    print("init call");
    super.initState();
    _viewSocietyController.user = _viewSocietyController.userdata;
    _viewSocietyController.userid.value = _viewSocietyController.user!.id!;
    _viewSocietyController.token.value =
        _viewSocietyController.user!.bearerToken!;

    _viewSocietyController.data = _viewSocietyController.viewAllSocietiesApi(
        _viewSocietyController.userid.value,
        _viewSocietyController.token.value);
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (_viewSocietyController.debouncer != null) {
      _viewSocietyController.debouncer!.cancel();
    }

    _viewSocietyController.debouncer = Timer(duration, callback);
  }

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
                future: _viewSocietyController.data,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) => debounce(
                              () async {
                                _viewSocietyController.query = value.toString();

                                print(_viewSocietyController.query);
                                _viewSocietyController.data =
                                    _viewSocietyController.searchSocietyApi(
                                        _viewSocietyController.query,
                                        _viewSocietyController
                                            .userdata.bearerToken!);

                                if (_viewSocietyController.query == "") {
                                  _viewSocietyController.data =
                                      _viewSocietyController.viewAllSocietiesApi(
                                          _viewSocietyController.userid.value,
                                          _viewSocietyController.token.value);
                                }

                                setState(() {});
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
                                  Get.to(ViewAdminDetails(), arguments: [
                                    user,
                                    snapshot.data[index].societyid
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
                                                    _viewSocietyController
                                                            .societyid.value =
                                                        snapshot
                                                            .data[index].societyid;
                                                    updateSocietyController.user = _viewSocietyController.userdata;
                                                  controller.showDeleteDialog(context);
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
                                                    print("-----------------");
                                                    print(snapshot
                                                        .data[index].societyaddress
                                                        .toString());
                                                    print(snapshot
                                                        .data[index].societyname
                                                        .toString());
                                                    print(snapshot
                                                        .data[index].societyid
                                                        .toString());
                                                    print(_viewSocietyController
                                                        .token);
                                                    print(_viewSocietyController
                                                        .userid);
                                                    print("-----------------");

                                                    Get.offAndToNamed(updateSociety,
                                                        arguments: [
                                                          snapshot.data[index]
                                                              .societyid,
                                                          _viewSocietyController
                                                              .token
                                                              .toString(),
                                                          snapshot.data[index]
                                                              .societyname
                                                              .toString(),
                                                          snapshot.data[index]
                                                              .societyaddress
                                                              .toString(),
                                                          _viewSocietyController
                                                              .userid.value,
                                                          _viewSocietyController
                                                              .userdata
                                                        ]);
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

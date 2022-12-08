import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: primaryColor,
              size: 33,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: secondaryColor,
          title: Text(
            'View Societies',
            style: GoogleFonts.montserrat(
                color: primaryColor, fontWeight: FontWeight.w600, fontSize: 36),
          ),
        ),
        body: GetBuilder<ViewSocietyController>(
            init: ViewSocietyController(),
            builder: (controller) {
              return FutureBuilder(
                  future: controller.data,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 104, top: 55, right: 192),
                            child: TextField(
                              controller: controller.searchController,
                              onChanged: (value) => controller.debounce(
                                () async {
                                  controller.query = value.toString();

                                  controller.data = controller.searchSocietyApi(
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
                                filled: true, //<-- SEE HERE
                                fillColor: HexColor("F7F8FA"),

                                //fillColor: ,

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(),
                                hintText: 'Search Society',

                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 104, top: 65),
                            child: Row(
                              children: [
                                Text(
                                  'View Societies',
                                  style: GoogleFonts.montserrat(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.450,
                                ),
                                DropdownButton<String>(
                                  value: controller.filterval,
                                  icon: Icon(Icons.arrow_downward,color: primaryColor,),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: primaryColor,
                                  ),
                                  onChanged: (value) {
                                    controller.SelectFilterType(
                                        value, controller.user.bearerToken,controller.user.id,);
                                  },
                                  items: controller.filter
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(children: [
                                        Icon(
                                          Icons.filter_alt,
                                          color: primaryColor,
                                        ),
                                        Text(value),
                                      ]),
                                    );
                                  }).toList(),
                                ),
                                // SizedBox(
                                //   width:
                                //       MediaQuery.of(context).size.width * 0.15,
                                //   child: DropdownButton<String>(
                                //     value: controller.filterval,
                                //     style: TextStyle(color: Colors.black),
                                //     items: controller.filter
                                //         .map<DropdownMenuItem<String>>(
                                //             (String value) {
                                //       return DropdownMenuItem<String>(
                                //         value: value,
                                //         child: Text(value),
                                //       );
                                //     }).toList(),
                                //     hint: Text(
                                //       "Please choose a type",
                                //       style: TextStyle(
                                //           color: Colors.black,
                                //           fontSize: 16,
                                //           fontWeight: FontWeight.w600),
                                //     ),
                                //     onChanged: (value) {
                                //       controller.SelectFilterType(
                                //         value,
                                //         controller.user.bearerToken,

                                //       );
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 104, right: 192, top: 49),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: HexColor('#F7F8FA'),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(viewAdminDetails,
                                              arguments: [
                                                controller.user,
                                                snapshot.data[index].id,
                                                snapshot.data[index].name,
                                              ]);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 30),
                                          padding: EdgeInsets.only(bottom: 30),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                //                    <--- top side
                                                color: HexColor('#9C9C9C'),

                                                style: BorderStyle.solid,
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ListTile(
                                              leading: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.038,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.058,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'images/societypic.png',
                                                        ),
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                Color.fromRGBO(
                                                                    254,
                                                                    153,
                                                                    0,
                                                                    0.2),
                                                                BlendMode.dst),
                                                        fit: BoxFit.fill)),
                                              ),
                                              title: Text(
                                                snapshot.data[index].name
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              subtitle: Text(
                                                snapshot.data[index].address
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              trailing:
                                                  Wrap(spacing: 20, children: [
                                                // GestureDetector(
                                                //     onTap: () {
                                                //       controller.showDeleteDialog(
                                                //           context,
                                                //           societyid: snapshot
                                                //               .data[
                                                //                   index]
                                                //               .societyid,
                                                //           beartoken:
                                                //               controller
                                                //                   .user
                                                //                   .bearerToken);
                                                //     },
                                                //     child: Icon(
                                                //       Icons.delete,
                                                //       color:
                                                //           primaryColor,
                                                //     )),

                                                MyButton(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.091,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.036,
                                                    name: "Update",
                                                    color: HexColor('#2BE09F'),
                                                    maxLines: 1,
                                                    onPressed: () {
                                                      Get.offAndToNamed(
                                                          updateSociety,
                                                          arguments: [
                                                            snapshot
                                                                .data[index],
                                                            controller.user
                                                          ]);
                                                    }),
                                              ])),
                                        ),
                                      );
                                    }),
                              ),
                            ),
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
            }));
  }
}

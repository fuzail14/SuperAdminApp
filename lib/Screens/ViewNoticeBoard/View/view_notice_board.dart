import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../Controller/view_notice_board_controller.dart';
class ViewNotioceBoard extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewNotioceBoardController>(
      init: ViewNotioceBoardController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: secondaryColor,
            foregroundColor: primaryColor,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back_outlined))),
            title: Text(
              'Notice Board',

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: FutureBuilder(
              future: controller.ViewNoticesApi(
                  controller.subadminid, controller.bearerToken),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
    if (snapshot.data != null && snapshot.data!.length!= 0) {
                  return
                    SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.07,
                                  MediaQuery.of(context).size.width * 0.05,
                                  0,
                                  0),
                              child: Text('NoticeBoard',
                                  style: GoogleFonts.montserrat(
                                      color: primaryColor,
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.023,
                                      fontWeight: FontWeight.w600)),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    dividerColor: Colors.transparent),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                        0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: HexColor('#F3F3F3')),
                                      width:
                                      MediaQuery.of(context).size.width,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.8,
                                      child: DataTable(
                                        dataRowColor:
                                        MaterialStateProperty.resolveWith(
                                                (Set states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return primaryColor;
                                              }
                                              return Colors
                                                  .red; // Use the default value.
                                            }),
                                        dividerThickness: 0,
                                        columnSpacing: MediaQuery.of(context).size.width * 0.05,
                                        columns: [
                                          DataColumn(
                                              label: Text(
                                                'NoticeTitle',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight: FontWeight.w400),
                                              )),
                                          DataColumn(
                                              label: Text(
                                                'NoticeDescription',
                                                style: GoogleFonts.montserrat(
                                                    fontStyle: FontStyle.normal,
                                                    color: HexColor('#262626'),
                                                    fontWeight: FontWeight.w400),
                                              )),
                                          DataColumn(
                                              label: Text(
                                                'StartDate',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight: FontWeight.w400),
                                              )),
                                          DataColumn(
                                              label: Text(
                                                'EndDate',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight: FontWeight.w400),
                                              )),
                                          DataColumn(
                                              label: Text(
                                                'StartTime',
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight: FontWeight.w400),
                                              )),


                                          DataColumn(
                                              label: Text(
                                                "EndTime",
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight: FontWeight.w400),
                                              )),
                                          DataColumn(
                                              label: Text(
                                                "Status",
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontWeight: FontWeight.w400),
                                              )),
                                        ],
                                        rows: List.generate(
                                            snapshot.data.length, (index) {
                                          String noticetitle =
                                          snapshot.data[index].noticetitle.toString();
                                          String noticedetail =
                                          snapshot.data[index].noticedetail.toString();
                                          String startdate =
                                          snapshot.data[index].startdate.toString();
                                          String enddate =
                                          snapshot.data[index].enddate.toString();
                                          String starttime =
                                          snapshot.data[index].starttime.toString();
                                          String endtime =
                                          snapshot.data[index].endtime.toString();
                                          //String status = snapshot.data[index].status.toString();

                                       return
                                          DataRow(
                                              color: MaterialStateProperty
                                                  .all(HexColor(
                                                  '#F3F3F3')),
                                              cells: [
                                                DataCell(Container(
                                                    width: 75,
                                                    child: Text(
                                                      noticetitle,
                                                      style: GoogleFonts.montserrat(
                                                          color: HexColor(
                                                              '#000000'),
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ))),
                                                DataCell(Container(
                                                    child: Text(
                                                      noticedetail,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                          color: HexColor(
                                                              '#000000'),
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ))),
                                                DataCell(Container(
                                                    child: Text(
                                                      startdate,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                          color: HexColor(
                                                              '#000000'),
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ))),
                                                DataCell(Container(
                                                    child: Text(
                                                      enddate,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                          color: HexColor(
                                                              '#000000'),
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ))),
                                                DataCell(Container(
                                                    child: Text(
                                                      starttime,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                          color: HexColor(
                                                              '#000000'),
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ))),

                                                DataCell(Container(
                                                    child: Text(
                                                      endtime,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                          color: HexColor(
                                                              '#000000'),
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ))),



                                                DataCell(Container(
                                                    child:
                                                    GestureDetector(
                                                        onTap: () {
                                                          print( snapshot.data[index]);
                                                          // Get.toNamed(viewUserDetails,
                                                          //     arguments: [
                                                          //       snapshot.data[index]
                                                          //     ]);


                                                        },
                                                        child: SvgPicture
                                                            .asset(
                                                          'images/detail_icon.svg',
                                                        )))),
                                              ])


                                          ;
                                        }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));}
    else{

      return  Center(
        child: Text("No Notices",
          style: GoogleFonts.montserrat(
              color: HexColor('#262626'),

              fontWeight: FontWeight.w500,fontSize: 30
          ),
        ),
      );

    }
                } else if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}

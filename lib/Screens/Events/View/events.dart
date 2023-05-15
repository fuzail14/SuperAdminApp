import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/constants.dart';
import '../Controller/view_events_controller.dart';

class ViewEvents extends GetView {
  ViewEventsController viewResidentsController =
      Get.put(ViewEventsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewEventsController>(
      init: ViewEventsController(),
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
              'Events',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: FutureBuilder(
              future: controller.viewEvents(
                  controller.subadminid, controller.bearerToken),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
    if (snapshot.data != null && snapshot.data!.length!= 0) {

    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.07,
                            MediaQuery.of(context).size.width * 0.05,
                            0,
                            0),
                        child: Text('Events',
                            style: GoogleFonts.montserrat(
                                color: primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.023,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Text(
                                            snapshot.data[index].title,
                                            style: GoogleFonts.montserrat(
                                                color: HexColor('#000000'),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 22, 0, 0),
                                          child: Text(
                                            snapshot.data[index].description,
                                            style: GoogleFonts.montserrat(
                                                color: HexColor('#000000'),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              1350, 20, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Center(
                                                child: Text(
                                              'Show',
                                              style: GoogleFonts.montserrat(
                                                  color: HexColor('#FFFFFF'),
                                                  fontWeight: FontWeight.w500),
                                            )),
                                            decoration: BoxDecoration(
                                                color: HexColor('#A52015'),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 45, 0, 0),
                                          child: SvgPicture.asset(
                                            'images/event_icon.svg',
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              50, 45, 0, 0),
                                          child: Text(
                                            'Start Date   ${snapshot.data[index].startdate}',
                                            style: GoogleFonts.montserrat(
                                                color: HexColor('#A52015'),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 75, 0, 0),
                                          child: SvgPicture.asset(
                                            'images/event_icon.svg',
                                            color: secondaryColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              50, 75, 0, 0),
                                          child: Text(
                                            'End Date    ${snapshot.data[index].enddate}',
                                            style: GoogleFonts.montserrat(
                                                color: HexColor('#A52015'),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: HexColor('#EDEDED'),
                                        borderRadius: BorderRadius.circular(8)),
                                    width: 1500,
                                    height: 100,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );}
    else{

      return  Center(
        child: Text("No Events",
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

// Padding(
// padding: EdgeInsets.fromLTRB(
// MediaQuery.of(context).size.width * 0.07,
// MediaQuery.of(context).size.width * 0.05,
// 0,
// 0),
// child: Text('Sub Admin',
// style: GoogleFonts.montserrat(
// color: primaryColor,
// fontSize:
// MediaQuery.of(context).size.width *
// 0.023,
// fontWeight: FontWeight.w600)),
// ),
//
// Padding(
// padding: EdgeInsets.fromLTRB(
// MediaQuery.of(context).size.width * 0.07,
// MediaQuery.of(context).size.width * 0.05,
// 0,
// 0),                        child: Container(
// child:Stack(children: [
// Padding(  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//
// child: Text('Basant Festival',
// style:
// GoogleFonts
//     .montserrat(
// color: HexColor(
// '#000000'),
// fontWeight:
// FontWeight
//     .w500),),
// ),
// Padding(
// padding: const EdgeInsets.fromLTRB(20, 22, 0, 0),
// child: Text('The Event is held between ',
// style:
// GoogleFonts
//     .montserrat(
// color: HexColor(
// '#000000'),
// fontWeight:
// FontWeight
//     .w400),),
// ),
// Padding(
// padding: const EdgeInsets.fromLTRB(1200, 20, 0, 0),
// child: Container(
// width: 100,height: 20,
// child: Center(child: Text('Show',
// style:
// GoogleFonts
//     .montserrat(
// color: HexColor(
// '#FFFFFF'),
// fontWeight:
// FontWeight
//     .w500),
//
//
// )),
//
//
// decoration: BoxDecoration(color: HexColor('#A52015'),
// borderRadius: BorderRadius.circular(10)
//
//
// ),),
// ), Padding(
// padding:  EdgeInsets.fromLTRB(20, 45, 0, 0),
// child:   SvgPicture.asset(
//
// 'images/event_icon.svg',
// color: secondaryColor,
// ),
//
// ),
// Padding(
// padding: const EdgeInsets.fromLTRB(50, 45, 0, 0),
// child: Text('Start Date',    style:
// GoogleFonts
//     .montserrat(
// color: HexColor(
// '#000000'),
// fontWeight:
// FontWeight
//     .w400),),
// )
// ,
// Padding(
// padding:  EdgeInsets.fromLTRB(20, 75, 0, 0),
// child:   SvgPicture.asset(
// 'images/event_icon.svg',
// color: secondaryColor,
// ),
//
// ),
// Padding(
// padding: const EdgeInsets.fromLTRB(50, 75, 0, 0),
// child: Text('End Date',    style:
// GoogleFonts
//     .montserrat(
// color: HexColor(
// '#000000'),
// fontWeight:
// FontWeight
//     .w400),),
// )
// ],) ,
// decoration: BoxDecoration(color: HexColor('#EDEDED')
// ,borderRadius: BorderRadius.circular(8)
//
// ),
//
// width: 1400,height: 100,),
// ),
//

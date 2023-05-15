import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miasuperadmin/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/Constants/api_routes.dart';
import 'package:miasuperadmin/Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Dialog Box/my_dialog_box.dart';
import '../Controller/view_resident_controller.dart';

class ViewUsers extends GetView {
  ViewResidentsController viewResidentsController =
      Get.put(ViewResidentsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewResidentsController>(
      init: ViewResidentsController(),
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
              'View Residents Detail',

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: FutureBuilder(
              future: controller.viewResidentsApi(
                  controller.subadminid, controller.bearerToken),
              builder: (context, AsyncSnapshot snapshot) {

                if (snapshot.hasData) {
    if (snapshot.data != null && snapshot.data!.length!= 0) {
                  return SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.07,
                            MediaQuery.of(context).size.width * 0.05,
                            0,
                            0),
                        child: Text('Residents',
                            style: GoogleFonts.montserrat(
                                color: primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.023,
                                fontWeight: FontWeight.w600)),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.05,
                                  MediaQuery.of(context).size.width * 0.05,
                                  MediaQuery.of(context).size.width * 0.05,
                                  0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor('#F3F3F3')),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: DataTable(
                                  dataRowColor:
                                      MaterialStateProperty.resolveWith(
                                          (Set states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return primaryColor;
                                    }
                                    return Colors.red; // Use the default value.
                                  }),
                                  dividerThickness: 0,
                                  columnSpacing:
                                      MediaQuery.of(context).size.width * 0.05,
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      'FirstName',
                                      style: GoogleFonts.montserrat(
                                          color: HexColor('#262626'),
                                          fontWeight: FontWeight.w400),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'LastName',
                                      style: GoogleFonts.montserrat(
                                          fontStyle: FontStyle.normal,
                                          color: HexColor('#262626'),
                                          fontWeight: FontWeight.w400),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Cnic',
                                      style: GoogleFonts.montserrat(
                                          color: HexColor('#262626'),
                                          fontWeight: FontWeight.w400),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Address',
                                      style: GoogleFonts.montserrat(
                                          color: HexColor('#262626'),
                                          fontWeight: FontWeight.w400),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Mobileno',
                                      style: GoogleFonts.montserrat(
                                          color: HexColor('#262626'),
                                          fontWeight: FontWeight.w400),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Image",
                                      style: GoogleFonts.montserrat(
                                          color: HexColor('#262626'),
                                          fontWeight: FontWeight.w400),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Details",
                                      style: GoogleFonts.montserrat(
                                          color: HexColor('#262626'),
                                          fontWeight: FontWeight.w400),
                                    )),
                                  ],
                                  rows: List.generate(snapshot.data.length,
                                      (index) {
                                        final firstname =
                                            snapshot.data[index].firstname;
                                        final lastname =
                                            snapshot.data[index].lastname;
                                        final cnic = snapshot.data[index].cnic;
                                        final address =
                                            snapshot.data[index].address;
                                        final mobileno =
                                            snapshot.data[index].mobileno;
                                        final vechileno =
                                            snapshot.data[index].vechileno;
                                        final propertytype =
                                            snapshot.data[index].propertytype;
                                        final residenttype =
                                            snapshot.data[index].residenttype;

                                    return DataRow(
                                            color:(index % 2 != 0)
                                                ?  MaterialStateProperty.all(
                                                HexColor('#F3F3F3')):MaterialStateProperty.all(
                                                HexColor('#FDFDFD')),
                                            cells: [
                                                DataCell(Container(
                                                    width: 75,
                                                    child: Text(
                                                      firstname,
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
                                                  lastname,
                                                  style: GoogleFonts.montserrat(
                                                      color:
                                                          HexColor('#000000'),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))),
                                                DataCell(Container(
                                                    child: Text(
                                                  cnic,
                                                  style: GoogleFonts.montserrat(
                                                      color:
                                                          HexColor('#000000'),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))),
                                                DataCell(Container(
                                                    child: Text(
                                                  address,
                                                  style: GoogleFonts.montserrat(
                                                      color:
                                                          HexColor('#000000'),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))),
                                                DataCell(Container(
                                                    child: Text(
                                                  mobileno,
                                                  style: GoogleFonts.montserrat(
                                                      color:
                                                          HexColor('#000000'),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))),
                                                DataCell(Container(
                                                    child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      imageBaseUrl +
                                                          snapshot.data[index]
                                                              .image),
                                                ))),
                                                DataCell(Container(
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          print(snapshot
                                                              .data[index]);
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  elevation: 0,
                                                                  child:
                                                                  Container(
                                                                    width: 636,
                                                                    height: 562,
                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                                                                    child:
                                                                    Stack(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              20,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child: Text(
                                                                              "Residental Details",
                                                                              style: GoogleFonts.montserrat(color: HexColor('#262626'), fontSize: 20, fontWeight: FontWeight.w700)),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              20,
                                                                              80,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          CircleAvatar(
                                                                            radius:
                                                                            30,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:  EdgeInsets.fromLTRB(450, 80, 0, 0),
                                                                          child: MyButton(
                                                                            elevation: 0,
                                                                            textColor: HexColor('#FFFFFF'),
                                                                            outlinedBorder: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            name: 'Reports',
                                                                            color: HexColor("#DC3545"),
                                                                            maxLines: 1,
                                                                            onPressed: (){},
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:  EdgeInsets.fromLTRB(450, 130, 0, 0),
                                                                          child: MyButton(
                                                                            textColor: HexColor('#262626'),
                                                                            outlinedBorder: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            name: 'Arrivals',
                                                                            color: HexColor("#F2F2F2"),
                                                                            elevation: 0,
                                                                            maxLines: 1,
                                                                            onPressed: (){},
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              100,
                                                                              80,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            firstname +" "+ lastname,
                                                                            style:
                                                                            GoogleFonts.montserrat(color: HexColor('#262626'), fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              100,
                                                                              100,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            cnic,
                                                                            style:
                                                                            GoogleFonts.montserrat(color: HexColor('#262626'), fontWeight: FontWeight.w600),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              20,
                                                                              180,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          SvgPicture.asset(
                                                                            'images/address_icon.svg',
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              180,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            "Address",
                                                                            style:
                                                                            GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              200,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            address,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              20,
                                                                              240,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          SvgPicture.asset(
                                                                            'images/address_icon.svg',
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              240,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            "Mobile NO",
                                                                            style:
                                                                            GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              260,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            mobileno,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              20,
                                                                              300,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          SvgPicture.asset(
                                                                            'images/address_icon.svg',
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              300,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            "Vechile nO",
                                                                            style:
                                                                            GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              320,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            vechileno,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              20,
                                                                              360,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          SvgPicture.asset(
                                                                            'images/address_icon.svg',
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              360,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            "Property Type",
                                                                            style:
                                                                            GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              380,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            propertytype,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              20,
                                                                              420,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          SvgPicture.asset(
                                                                            'images/address_icon.svg',
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              420,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            "Residential Type",
                                                                            style:
                                                                            GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),

                                                                        (residenttype=='Owner')?
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              50,
                                                                              440,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            residenttype,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ):
                                                                        Column(children: [
                                                                          Text(
                                                                            snapshot.data[index].ownername,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),

                                                                          Text(
                                                                            snapshot.data[index].owneraddress,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),

                                                                          Text(
                                                                            snapshot.data[index].ownermobileno,
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 16,
                                                                                color: HexColor('#1A1A1A'),
                                                                                fontWeight: FontWeight.w400),
                                                                          ),


                                                                        ],)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: SvgPicture.asset(
                                                          'images/detail_icon.svg',
                                                        )))),
                                              ]);

                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));}
    else {
    return
      Center(
        child: Text("No Residents",
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

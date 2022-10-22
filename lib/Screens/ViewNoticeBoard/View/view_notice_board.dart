import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../Constants/constants.dart';
import '../Controller/view_notice_board_controller.dart';
import '../Model/noticeboard.dart';


class ViewNotioceBoard extends GetView {
  ViewNotioceBoardController viewResidentsController =
      Get.put(ViewNotioceBoardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewNotioceBoardController>(
      init: ViewNotioceBoardController(),
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
              'Notice Board',
              minFontSize: 10,
              stepGranularity: 10,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: FutureBuilder(
              future: controller.viewEvents(
                  controller.subadminid, controller.bearerToken),
              builder: (context, AsyncSnapshot snapshot) {
                

                if (snapshot.hasData) {
                  
                  return SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: MediaQuery.of(context).size.width * 0.05,
                      columns: [
                        DataColumn(label: Text('Notice Title')),
                        DataColumn(label: Text('Notice Detail')),
                        DataColumn(label: Text('Start Date')),
                        DataColumn(label: Text('End Date')),
                        DataColumn(label: Text('Start Time')),
                        DataColumn(label: Text("End Time")),
                        
                       // DataColumn(label: Text("Status")),
                      ],
                      rows: List.generate(snapshot.data.length, (index) {
                        



                   
                        
                        String noticetitle = snapshot.data[index].noticetitle.toString();
                        String noticedetail = snapshot.data[index].noticedetail.toString();
                        String startdate = snapshot.data[index].startdate.toString();
                        String enddate = snapshot.data[index].enddate.toString();
                        String starttime = snapshot.data[index].starttime.toString();
                        String endtime = snapshot.data[index].endtime.toString();
                        //String status = snapshot.data[index].status.toString();
                        
                        

                        return DataRow(cells: [
                          DataCell(
                              Container(width: 75, child: Text(noticetitle))),
                          DataCell(Container(child: Text(noticedetail))),
                          DataCell(Container(child: Text(startdate))),
                          DataCell(Container(child: Text(enddate))),
                          DataCell(Container(child: Text(starttime))),

                          DataCell(Container(child: Text(endtime))),
                          
                       //DataCell(Container(child: Text(status))),
                       
                          
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

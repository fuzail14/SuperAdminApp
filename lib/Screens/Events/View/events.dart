
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/view_events_controller.dart';
import 'events_images.dart';



class ViewEvents extends GetView {

    ViewEventsController viewResidentsController =
      Get.put(ViewEventsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewEventsController>(
      init: ViewEventsController(),
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
              'Events',
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
                        DataColumn(label: Text('Title')),
                        DataColumn(label: Text('description')),
                        DataColumn(label: Text('Start Date')),
                        DataColumn(label: Text('End Date')),
                        // DataColumn(label: Text('Start Time')),
                        // DataColumn(label: Text("End Time")),

                        
                       // DataColumn(label: Text("Status")),
                      ],
                      rows: List.generate(snapshot.data.length, (index) {
                        



                   
                        
                        String title = snapshot.data[index].title.toString();
                        String description = snapshot.data[index].description.toString();
                        String startdate = snapshot.data[index].startdate.toString();
                        String enddate = snapshot.data[index].enddate.toString();
                        
                        //String status = snapshot.data[index].status.toString();
                        
                        

                        return DataRow(cells: [
                          DataCell(
                              Container(width: 75, child: Text(title))),
                          DataCell(Container(child: Text(description))),
                          DataCell(Container(child: Text(startdate))),
                          DataCell(Container(child: Text(enddate))),
                          
                          
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

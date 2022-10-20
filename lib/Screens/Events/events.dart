
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import '../../Constants/constants.dart';
import '../../Widgets/My Button/my_button.dart';
import 'events_images.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Events"),
      backgroundColor: primaryColor,
  ),
      body:  FutureBuilder(
          future:ApiData() ,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemCount: snapshot.data.length,

                  itemBuilder: (context,index){

                    return Padding(padding:const EdgeInsets.all(20),
                      child: Container(width: MediaQuery.of(context).size.width,

                        decoration: BoxDecoration(
                            border: Border.all(color: HexColor("#bc8d55")),
                            borderRadius:BorderRadius.circular(20)

                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Expanded(
                              child: Padding(padding: const EdgeInsets.all(8),
                                child: Container(width: MediaQuery.of(context).size.width*0.3,
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [

                                      const Text("Event Title",style: TextStyle(fontWeight: FontWeight.bold)),
                                      const Text(""" Basant Festival """, style: TextStyle()),
                                      const Text("Event Desciption",style: TextStyle(fontWeight: FontWeight.bold)),
                                      const Text("When grilling sliced butters, be sure they are room temperature.",style: TextStyle()),
                                      Text("Start Date",style: TextStyle(fontWeight: FontWeight.bold),),
                                      const Text("29-04-2022",style: TextStyle()),
                                      Text("End Date",style:TextStyle(fontWeight:FontWeight.bold),),
                                      const Text("30-04-2022",style: TextStyle()),
                                      MyButton(horizontalPadding: 8, verticalPadding: 8, name: 'View Images'
                                        , color: primaryColor, maxLines:1 ,onPressed: (){

                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EventImages()));
                                        },)

                                    ],),),
                              ),
                            ),




                          ],),),
                    );
                  });
            }

            else if (snapshot.data==null)
            {

              return const Text("No User");
            }

            else {
              return const CircularProgressIndicator();
            }
          }),




          );
        }


  }

  ApiData()async {

   List<Map>? myProducts;

         myProducts = List.generate(
         50,
                (index) => {
              "id": index,
              "name": "Event $index",
              "address": "$index Event Desciption"
            }).toList();


    return myProducts;

  
}

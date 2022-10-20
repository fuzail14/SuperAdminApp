import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miasuperadmin/Screens/Home%20Screen/Controller/home_controller.dart';
import '../../Bindings/Set Routes/set_routes.dart';
import '../../Constants/constants.dart';
import '../Login/Model/User.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title:  Text('Home'),
        ),
        body:

        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text(
                "Super Admin",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(addSociety, arguments: controller.user);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset('images/add-society.png'),
                                width:MediaQuery.of(context).size.width*0.15,
                                height:MediaQuery.of(context).size.height*0.30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),

                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Text(
                                  'Add Society',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {


                        Get.toNamed(viewSociety, arguments:controller. user);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                  child: Image.asset('images/view-society.png'),
                                width:MediaQuery.of(context).size.width*0.15,
                                height:MediaQuery.of(context).size.height*0.30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),


                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Text(
                                  'View Society',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(events);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(    child: Image.asset('images/view-society.png'),
                                width:MediaQuery.of(context).size.width*0.15,
                                height:MediaQuery.of(context).size.height*0.30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),


                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Text(
                                  'Events',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(login);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(    child: Image.asset('images/logout.png'),
                                width:MediaQuery.of(context).size.width*0.15,
                                height:MediaQuery.of(context).size.height*0.30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),


                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),



            ]);
          }
        ));


  }
}

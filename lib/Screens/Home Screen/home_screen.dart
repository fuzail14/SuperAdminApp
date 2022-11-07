import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miasuperadmin/Constants/colors.dart';
import 'package:miasuperadmin/Screens/Home%20Screen/Controller/home_controller.dart';
import 'package:miasuperadmin/Widgets/CardHomeScreen/card_home_screen.dart';
import '../../Bindings/Set Routes/set_routes.dart';
import '../../Constants/constants.dart';
import '../Login/Model/User.dart';

class HomeScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
          backgroundColor: secondaryColor,
          foregroundColor: primaryColor,
          title: Center(
              child: Text('Home',
                  style: GoogleFonts.montserrat(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 36))),
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Stack(children: [
                     Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.625,
                        top: MediaQuery.of(context).size.height * 0.127),
                    child: Image.asset(
                      ('images/home3.png'),
                      height: MediaQuery.of(context).size.height * 0.600,
                      width: MediaQuery.of(context).size.width * 0.300,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.104,
                        top: MediaQuery.of(context).size.height * 0.015),
                    child: Text(
                      "Super Admin",
                      style: GoogleFonts.montserrat(
                        color: primaryColor,
                        //fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: MediaQuery.of(context).size.width*0.040,
                        
                      ),
                    ),
                  ),
                  Row(
                    
                    children: [
                      CardHomeScreen(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.104,
                            top: MediaQuery.of(context).size.width * 0.070
                            ),
                        onTap: () {
                          Get.toNamed(addSociety, arguments: controller.user);
                        },
                        text: 'Add Society',
                        imgpath: 'images/home1.png',
                      ),
                      CardHomeScreen(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.020,
                            top: MediaQuery.of(context).size.width * 0.070),
                        onTap: () {
                          Get.toNamed(viewSociety, arguments: controller.user);
                        },
                        text: 'View Society',
                        imgpath: 'images/home2.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  CardHomeScreen(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.104,
                        top: MediaQuery.of(context).size.height * 0.530),
                    onTap: () {
                      Get.toNamed(login);
                    },
                    text: 'Logout',
                    imgpath: 'images/home4.png',
                  ),
               
                ]),
              );
            }));
  }
}

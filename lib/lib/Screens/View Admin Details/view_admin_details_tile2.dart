
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/lib/Constants/constants.dart';
import 'package:miasuperadmin/lib/Screens/Events/events.dart';
import 'package:miasuperadmin/lib/Screens/View%20Service%20Provider/view_service_provider.dart';
import '../Add Event/add_event.dart';
import '../View GateKeepers/view_gatekeepers.dart';
import '../View Users/view_users.dart';

class ViewAdminDetailsTile2 extends StatefulWidget {
  const ViewAdminDetailsTile2({Key? key}) : super(key: key);

  @override
  State<ViewAdminDetailsTile2> createState() => _ViewAdminDetailsTile2State();
}

class _ViewAdminDetailsTile2State extends State<ViewAdminDetailsTile2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(viewUsers);

            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80,
                child: Center(
                    child: Text(
                  "View Users",
                  maxLines: 2,
                  style: TextStyle(
                      color:primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor, width: 2),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(viewGateKeepers);

            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80,
                child: Center(
                    child: Text(
                  "View GateKeepers",
                  maxLines: 2,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor, width: 2),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(viewServiceProvider);

            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80,
                child: Center(
                    child: Text(
                      "Service Providers",
                      maxLines: 2,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor, width: 2),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(events);

            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80,
                child: Center(
                    child: Text(
                  "View Events",
                  maxLines: 2,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor, width: 2),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(addEvent);

            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80,
                child: Center(
                    child: Text(
                  "Add Event",
                  maxLines: 2,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor, width: 2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Future<void> _showMyDialog() async {
    return

      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Add Event'),
            content:Container(width: MediaQuery.of(context).size.width,
                child: const AddEvent()),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ));

  }
}

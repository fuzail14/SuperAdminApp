import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../Login/Model/User.dart';
import '../../Update Society/Controller/update_society_controller.dart';
import '../Model/Society.dart';

class ViewSocietyController extends GetxController {
  final UpdateSocietyController updateSocietyController =
      Get.put(UpdateSocietyController());
  TextEditingController searchController = TextEditingController();
  var userid = 0.obs;
  var token = "".obs;
  var societyid = 0.obs;
  var userdata = Get.arguments;
  User? user;

  String? query;
  Timer? debouncer;
  late Future data;
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  @override
  void onInit() async {
    super.onInit();
  }

  Future viewAllSocietiesApi(int userid, String token) async {
    print(userid.toString());
    print(token);
    // List <Society> societyli=[];
    var societyli = <Society>[].obs;

    final response = await Http.get(
      Uri.parse(Api.view_all_societies + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      for (var e in mydata) {
        final Society society = Society(
          societyid: e['id'],
          societyname: e['societyname'],
          societyaddress: e['societyaddress'],
        );

        societyli.add(society);
      }
      print(societyli.length);

      return societyli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future searchSocietyApi(String? query, String token) async {
    print('iam inside the search society');
    print(query);
    print(token);

    var societyli = <Society>[].obs;

    final response = await Http.get(
      Uri.parse(Api.search_society + "/" + query!),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      print(mydata);
      for (var e in mydata) {
        final Society society = Society(
          societyid: e['id'],
          societyname: e['societyname'],
          societyaddress: e['societyaddress'],
        );

        societyli.add(society);
      }
      print(societyli.length);

      return societyli;
// societyli.add(society);

    } else {
      return societyli;
    }
  }

  Future<void> showDeleteDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete this Admin?'),
              actions: <Widget>[
                MyButton(
                    onPressed: () {
                      updateSocietyController.deleteSocietyApi(
                          societyid.value, token.value);

                      data = viewAllSocietiesApi(userid.value, token.value);

                      Get.back();
                      update();
                    },
                    horizontalPadding: 0,
                    verticalPadding: 0,
                    name: 'Delete',
                    color: primaryColor,
                    maxLines: 1),
                MyButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  name: 'Cancel',
                  color: Colors.white60,
                  maxLines: 1,
                  textColor: Colors.black,
                ),
              ],
            ));
  }
}

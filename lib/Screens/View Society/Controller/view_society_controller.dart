import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../Bindings/Set Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../Login/Model/User.dart';
import '../Model/Society.dart';

class ViewSocietyController extends GetxController {
  late Future data;
  TextEditingController searchController = TextEditingController();
  var userdata = Get.arguments;
  late final User user;
  late final Society society;
  String? query;
  Timer? debouncer;
  String filterval = 'society';
  var societyli = <Society>[].obs;
  List<String> filter = ['society', 'building'];
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
      update();
    }

    debouncer = Timer(duration, callback);
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debouncer?.cancel();
  }

  @override
  void onInit() async {
    super.onInit();
    this.user = userdata;

    data = viewAllSocietiesApi(user.id!, user.bearerToken!);
  }

  Future viewAllSocietiesApi(int id, String token) async {
    

    final response = await Http.get(
      Uri.parse(Api.view_all_societies + "/" + id.toString()),
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
          id: e['id'],
          name: e['name'],
          address: e['address'],
          country: e['country'],
          state: e['state'],
          city: e['city'],
          type: e['type'],
        );

        societyli.add(society);
      }
      
      update();

      return societyli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future searchSocietyApi(String? query, String token) async {
    

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
          id: e['id'],
          name: e['name'],
          address: e['address'],
          country: e['country'],
          state: e['state'],
          city: e['city'],
          type: e['type'],
        );

        societyli.add(society);
        update();
      }
      print(societyli.length);

      return societyli;
// societyli.add(society);

    } else {
      return societyli;
    }
  }

  Future deleteSocietyApi(int societyid, String token) async {
    

    final response = await Http.get(
      Uri.parse(Api.delete_society + "/" + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      this.data = viewAllSocietiesApi(user.id!, user.bearerToken!);
      Get.back();
      update();
    } else {}
  }

  Future<void> showDeleteDialog(BuildContext context,
      {required societyid, required beartoken}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete this Admin?'),
              actions: <Widget>[
                MyButton(
                    onPressed: () {
                      deleteSocietyApi(societyid, beartoken);
                    },
                    name: 'Delete',
                    color: primaryColor,
                    maxLines: 1),
                MyButton(
                  onPressed: () {
                    Get.back();
                  },
                  name: 'Cancel',
                  color: Colors.white60,
                  maxLines: 1,
                  textColor: Colors.black,
                ),
              ],
            ));
  }

  SelectFilterType(val, token, id) async {
    filterval = val;

    this.data = FilterApi(val, token, id);

    update();
  }

  Future FilterApi(val, token, id) async {
    final response = await Http.get(
      Uri.parse(
          Api.filter_societybuilding + "/" + id.toString() + "/" + filterval),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());
    var mydata = data['data'];

    if (response.statusCode == 200) {
      societyli.clear();
      for (var e in mydata) {
        final Society society = Society(
          id: e['id'],
          name: e['name'],
          address: e['address'],
          country: e['country'],
          state: e['state'],
          city: e['city'],
          type: e['type'],
        );

        societyli.add(society);
      }
      
      update();

      return societyli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }
}

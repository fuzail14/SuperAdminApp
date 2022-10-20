import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:miasuperadmin/Screens/View%20GateKeepers/Model/gate_keeper_model.dart';

import '../../../Constants/api_routes.dart';
import 'package:http/http.dart' as Http;

import '../Model/event.dart';

class ViewEventsController extends GetxController {
  var argument = Get.arguments;
  var subadminid;
  var bearerToken;
  List<Event> li = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('on init');
    subadminid = argument[0];
    bearerToken = argument[1];
    viewEvents(subadminid, bearerToken);
  }

  viewEvents(int subadminiid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.viewallnotices + "/" + subadminiid.toString()),
      // "?page=" +
      // pagesize.toString()),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      
      li = await (data['data'] as List)
          .map(
            (e) => Event(
              id: e['id'],
              subadminid: e['subadminid'],
              noticetitle: e['noticetitle'],
              noticedetail: e['noticedetail'],
              startdate: e['startdate'],
              enddate: e['enddate'],
              starttime: e['starttime'],
              endtime: e['endtime'],
              status: e['status'],
            ),
          )
          .toList();

      return li;
    }
    return li;
  }
}

import 'package:get/get.dart';
import 'package:miasuperadmin/lib/Screens/Add%20Admin/View/add_admin.dart';
import 'package:miasuperadmin/lib/Screens/Add%20Event/add_event.dart';
import 'package:miasuperadmin/lib/Screens/Add%20Society/View/add_society.dart';
import 'package:miasuperadmin/lib/Screens/Arrivals/arrivals.dart';
import 'package:miasuperadmin/lib/Screens/Chat/chat.dart';
import 'package:miasuperadmin/lib/Screens/Events/events.dart';
import 'package:miasuperadmin/lib/Screens/Home%20Screen/home_screen.dart';
import 'package:miasuperadmin/lib/Screens/Login/View/login.dart';
import 'package:miasuperadmin/lib/Screens/Sign%20Up/View/sign_up.dart';
import 'package:miasuperadmin/lib/Screens/Update%20Admin/View/update_admin.dart';
import 'package:miasuperadmin/lib/Screens/Update%20Society/View/update_society.dart';

import 'package:miasuperadmin/lib/Screens/View%20GateKeepers/view_gatekeepers.dart';
import 'package:miasuperadmin/lib/Screens/View%20Service%20Provider/view_service_provider.dart';
import 'package:miasuperadmin/lib/Screens/View%20Society/view_society.dart';
import 'package:miasuperadmin/lib/Screens/View%20User%20Details/view_user_details.dart';
import 'package:miasuperadmin/lib/Screens/View%20Users/view_users.dart';
import '../../Screens/Reports/reports.dart';
import '../../Screens/View Admin Details/view_admin_details.dart';
import '../../Screens/View Admin Details/view_admin_details_tile2.dart';

class ScreenBindings extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() =>AddAdmin() );
    Get.lazyPut(() =>AddEvent() );
    Get.lazyPut(() =>AddSociety() );
    Get.lazyPut(() => Arrivals() );
    Get.lazyPut(() =>Chat() );
    Get.lazyPut(() =>Events());
    Get.lazyPut(() =>HomeScreen());
    Get.lazyPut(() =>LogIn());
    Get.lazyPut(() =>SignUp());
    Get.lazyPut(() =>Reports());
    Get.lazyPut(() =>UpdateAdmin());
    Get.lazyPut(() =>UpdateSociety());
    Get.lazyPut(() =>ViewAdminDetails());
    
    Get.lazyPut(() =>ViewAdminDetailsTile2());
    Get.lazyPut(() => ViewGateKeepers());
    Get.lazyPut(() => ViewServiceProvider());
    Get.lazyPut(() => ViewSociety());
    Get.lazyPut(() => ViewUserDetails());
    Get.lazyPut(() => ViewUsers());



  }


}
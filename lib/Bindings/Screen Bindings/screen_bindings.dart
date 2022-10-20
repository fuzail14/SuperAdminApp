import 'package:get/get.dart';
import 'package:miasuperadmin/Screens/Events/events.dart';
import 'package:miasuperadmin/Screens/ViewNoticeBoard/View/view_event.dart';

import '../../Screens/Add Admin/View/add_admin.dart';
import '../../Screens/Add Event/add_event.dart';
import '../../Screens/Add Society/View/add_society.dart';
import '../../Screens/Arrivals/arrivals.dart';
import '../../Screens/Chat/chat.dart';
import '../../Screens/Home Screen/home_screen.dart';
import '../../Screens/Login/View/login.dart';
import '../../Screens/Reports/reports.dart';
import '../../Screens/Sign Up/View/sign_up.dart';
import '../../Screens/Update Admin/View/update_admin.dart';
import '../../Screens/Update Society/View/update_society.dart';
import '../../Screens/View Admin Details/view_admin_details.dart';
import '../../Screens/View Admin Details/view_admin_details_tile2.dart';
import '../../Screens/View GateKeepers/View/gate_kpeer_screen.dart';

import '../../Screens/View Service Provider/view_service_provider.dart';
import '../../Screens/View Society/View/view_society.dart';
import '../../Screens/View User Details/view_user_details.dart';
import '../../Screens/View Residents/View/view_residents.dart';

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
    Get.lazyPut(() => ViewAdminDetails());
    Get.lazyPut(() => ViewEvents());
    
    



  }


}
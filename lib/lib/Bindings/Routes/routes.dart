import 'package:get/get.dart';
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import 'package:miasuperadmin/lib/Screens/Add%20Admin/View/add_admin.dart';
import 'package:miasuperadmin/lib/Screens/Add%20Event/add_event.dart';
import 'package:miasuperadmin/lib/Screens/Add%20Society/View/add_society.dart';
import 'package:miasuperadmin/lib/Screens/Arrivals/arrivals.dart';
import 'package:miasuperadmin/lib/Screens/Events/events.dart';
import 'package:miasuperadmin/lib/Screens/Home%20Screen/home_screen.dart';
import 'package:miasuperadmin/lib/Screens/Login/View/login.dart';
import 'package:miasuperadmin/lib/Screens/Reports/reports.dart';
import 'package:miasuperadmin/lib/Screens/Sign%20Up/View/sign_up.dart';
import 'package:miasuperadmin/lib/Screens/Update%20Admin/View/update_admin.dart';
import 'package:miasuperadmin/lib/Screens/Update%20Society/View/update_society.dart';

import 'package:miasuperadmin/lib/Screens/View%20GateKeepers/view_gatekeepers.dart';
import 'package:miasuperadmin/lib/Screens/View%20Service%20Provider/view_service_provider.dart';
import 'package:miasuperadmin/lib/Screens/View%20Society/view_society.dart';
import 'package:miasuperadmin/lib/Screens/View%20User%20Details/view_user_details.dart';

import '../../Screens/Chat/chat.dart';

import '../../Screens/View Admin Details/view_admin_details.dart';
import '../../Screens/View Admin Details/view_admin_details_tile2.dart';
import '../../Screens/View Users/view_users.dart';

class Pages {
  List<GetPage> getPages() {
    return [
      GetPage(name: addAdmin, page: () => AddAdmin()),
      GetPage(name: addEvent, page: () => AddEvent()),
      GetPage(name: addSociety, page: () => AddSociety()),
      GetPage(name: arrivals, page: () => Arrivals()),
      GetPage(name: chat, page: () => Chat()),
      GetPage(name: events, page: () => Events()),
      GetPage(name: homeScreen, page: () => HomeScreen()),
      GetPage(name: login, page: () => LogIn()),
      GetPage(name: reports, page: () => Reports()),
      GetPage(name: signUp, page: () => SignUp()),
      GetPage(name: updateAdmin, page: () => UpdateAdmin()),
      GetPage(name: updateSociety, page: () => UpdateSociety()),
      GetPage(name: viewAdminDetails, page: () => ViewAdminDetails()),
      
      GetPage(name: viewAdminDetailsTile2, page: () => ViewAdminDetailsTile2()),
      GetPage(name: viewGateKeepers, page: () => ViewGateKeepers()),
      GetPage(name: viewServiceProvider, page: () => ViewServiceProvider()),
      GetPage(name: viewSociety, page: () => ViewSociety()),
      GetPage(name: viewUsers, page: () => ViewUsers()),
      GetPage(name: viewUserDetails, page: () => ViewUserDetails()),
    ];
  }
}

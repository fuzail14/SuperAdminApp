import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:miasuperadmin/lib/Bindings/Screen%20Bindings/screen_bindings.dart';
import 'package:miasuperadmin/lib/Bindings/Set%20Routes/set_routes.dart';
import 'lib/Bindings/Routes/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Pages().getPages(),
      initialRoute: login,
      initialBinding: ScreenBindings(),
      debugShowCheckedModeBanner: false,

      //
      // home: EasySplashScreen(
      //     durationInSeconds: 5,
      //     loadingText: Text("Loading..."),
      //     logo:Image.asset("images/logo.png",scale: 2.0,),
      //     navigator: LogIn()),
    );
  }
}

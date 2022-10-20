import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'Bindings/Routes/routes.dart';
import 'Bindings/Screen Bindings/screen_bindings.dart';
import 'Bindings/Set Routes/set_routes.dart';


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

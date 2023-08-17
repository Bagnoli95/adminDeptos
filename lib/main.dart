import 'package:admin_dptos/ui/pages/loginpage/login_wall_page.dart';
// import 'package:admin_dptos/ui/routes/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // routerConfig: my_routes,
      title: 'AdminDptos',
      debugShowCheckedModeBanner: false,
      home: LoginPageWallPaper(),
    );
  }
}

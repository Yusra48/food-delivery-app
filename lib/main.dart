import 'package:flutter/material.dart';
import 'package:food_application/screens/Views/Categories/LocationPage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home:LocationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
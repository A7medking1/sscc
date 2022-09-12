import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test002/sc_media_app/core/data/api_client.dart';
import 'package:test002/sc_media_app/helper/binding.dart';
import 'package:test002/sc_media_app/helper/cach_helper.dart';
import 'package:test002/sc_media_app/helper/constant.dart';
import 'package:test002/sc_media_app/views/pages/auth_screen/login_screen.dart';
import 'package:test002/sc_media_app/views/pages/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   ApiClient.init();
   await CacheHelper.init();

  userToken = CacheHelper.getData(key: "userToken");

  print(userToken);

  Widget startScreen;

  if(userToken !=  ""){
    startScreen = HomeScreen();
  }else{
    startScreen = LoginScreen();
  }


  runApp( MyApp(startScreen: startScreen));
}

class MyApp extends StatelessWidget
{

  final Widget startScreen ;

  const MyApp({Key? key,required this.startScreen}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: ThemeData(
      ),
      home: startScreen,
    );
  }
}
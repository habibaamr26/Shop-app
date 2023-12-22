import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/dio.dart';
import 'package:shop_app/shared/sharedpref.dart';
import 'package:shop_app/shopAPP/constance.dart';
import 'package:shop_app/shopAPP/cubit&states/cubit_To_shop.dart';

import 'login/cubit.dart';
import 'shopAPP/home_layout.dart';
import 'package:shop_app/layout/onbording.dart';
import 'login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  diohelper.init();
  await cachHelper.initial();
  var onbordig = cachHelper.getdata(key: "onbording");
  token = cachHelper.getdata(key: "token");
  Widget widget;
  if (onbordig != null  ) {
   if(token != null) {
     widget = ShopLayout();
   } else {

     widget=login();
   }
  }
  else
    {
      widget=OnBording();
    }
  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
  var widget;
  MyApp( this.widget);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>shopBloc()..HomeGetDatat()..categoryGetData()..favoritGD()..userdata(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
         scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black,size: 25),
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:Brightness.dark
          )
        ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:  Colors.deepOrange,
      ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting
        ),
        fontFamily: 'Roboto',
       ),
        home: widget,
      ),
    );
  }
}

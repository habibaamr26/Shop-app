import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login/login_screen.dart';
import 'package:shop_app/shared/sharedpref.dart';
import 'package:shop_app/shopAPP/screens/category_screen.dart';
import 'package:shop_app/shopAPP/cubit&states/cubit_To_shop.dart';
import 'package:shop_app/shopAPP/screens/fivourit_screen.dart';
import 'package:shop_app/shopAPP/screens/home_screen.dart';
import 'package:shop_app/search/search_screen.dart';
import 'package:shop_app/shopAPP/screens/setting_screen.dart';
import 'package:shop_app/shopAPP/cubit&states/states.dart';
import '../layout/onbording.dart';


class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});



  @override
  Widget build(BuildContext context) {

    var cubit=shopBloc.get(context);

    return BlocConsumer<shopBloc,shopstates>(
      builder: (context,state)=>Scaffold(
        appBar: AppBar(
          title: const Text("salla"),
          actions: [
            IconButton(onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (_){return search();}));
            }, icon: const Icon(Icons.search)),
          ],
        ),
        body:cubit.screens[ cubit.bottomNavigationBar],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.bottomNavigationBar ,
          onTap: (value)
          {
            cubit.bottomNavigationBarchange(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
          ],

        ),
      ),
        listener:  (context,state){},
    );
  }
}


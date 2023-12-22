import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/dio.dart';
import 'package:shop_app/shopAPP/screens/setting_screen.dart';
import 'package:shop_app/shopAPP/models/shopModel.dart';
import 'package:shop_app/shopAPP/cubit&states/states.dart';
import '../models/category_model.dart';
import '../models/favoritgetmodel.dart';
import '../models/favourit_model.dart';
import '../models/ubdatemodel.dart';
import '../models/userdata.dart';
import '../screens/category_screen.dart';
import '../constance.dart';
import '../screens/fivourit_screen.dart';
import '../screens/home_screen.dart';

class shopBloc extends Cubit<shopstates> {
  shopBloc() : super(initial());

  static shopBloc get(context) => BlocProvider.of(context);
  List screens = [
    Home(),
    category(),
    Favorit(),
    SettingScreen(),
  ];

  int bottomNavigationBar = 0;

  void bottomNavigationBarchange(int value) {
    bottomNavigationBar = value;
    emit(bottomNavigationBarState());
  }

  HomeModel? data;


  Map<int, bool>? favourits = {};
  void HomeGetDatat() {
    emit(HomeStateloading());
    diohelper.getdata(path: 'home', token: token).then((value) {
      data = HomeModel.formjason(value.data);
      data?.data.products.forEach((element) {
        favourits?.addAll({element.id: element.inFavourites});
      });
      emit(HomeStatesuccess());
    }).catchError((error) {
      print(error);
      emit(HomeStatefailer());
    });
  }

  FavouriteModel? model;
  void changefavourit(
    int id,
  ) {
    favourits?[id] = !favourits![id]!;
    emit(favouritchange());
    diohelper.Postdata(
            path: 'favorites', data: {'product_id': id}, token: token)
        .then((value) {
      model = FavouriteModel.formjason(value.data);
      if (model!.status == false)
        favourits?[id] = !favourits![id]!;
      else
        favoritGD();
      emit(favouritStatesucess(model!));
    }).catchError((error) {
      print(error.toString());
      favourits?[id] = !favourits![id]!;
      emit(favoritStatefailer());
    });
  }

  categorymodel? categorymodelgetdata;

  void categoryGetData() {
    emit(lodingfavourit());
    diohelper
        .getdata(
      path: 'categories',
    )
        .then((value) {
      categorymodelgetdata = categorymodel.formjason(value.data);
      emit(categoryStatesuccess());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(categoryStatefailer());
    });
  }

  favoritGetData? getdataf;

  void favoritGD() {
    diohelper
        .getdata(
      path: 'favorites',
      token: token,
    )
        .then((value) {
      getdataf = favoritGetData.forjason(value.data);
      print("habiba${getdataf?.data.itemdata[1].product.name}");
      emit(favoritsucc());
    }).catchError((e) {
      print(e);
      emit(favouritfail());
    });
  }

  UserModel? userdatamodel;
  void userdata() {
    diohelper.getdata(path:'profile', token: token).then((value) {
      userdatamodel = UserModel.formjason(value.data);
      print("sssssssssssheper${userdatamodel?.status}");
      print("sssssssssssheper${userdatamodel?.data?.email}");
      emit(userdatasucc());
    }).catchError((e) {
      print("sssssssssssheper${e}");
      emit(userdatafail());
    });
  }
  UpdateUserModel? updateuserdatamodel;

  void ubdateuserdata({
    required String phone,
    required String name,
    required String email,
  }) {
    diohelper.putdata(path: 'update-profile', token: token,
        data:{"name": name,
      "phone": phone,
      "email": email,
      "password": "123456",
    } ).then((value) {
      updateuserdatamodel = UpdateUserModel.formjason(value.data);
      print(token);
      print("sssssssssss${updateuserdatamodel?.message}");
      print("sssssssssss${updateuserdatamodel?.data?.phone}");
      print("ssssssssss${updateuserdatamodel?.data?.email}");
      print("ssssssssss${updateuserdatamodel?.data?.name}");
      emit(userubdatedatasucc());
    }).catchError((e) {
      print("sssssssssssheper${e}");
      emit(userudatedatafail());
    });
  }




}

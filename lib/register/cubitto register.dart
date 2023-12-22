

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/dio.dart';
import 'package:shop_app/login/shopstates.dart';
import 'package:shop_app/register/regester_model.dart';

import '../login/model_class.dart';

class registerCubit extends Cubit<states>
{
  registerCubit():super(initialstate()) ;
  static registerCubit get(context)=>BlocProvider.of(context);

  late regestModel object;
  bool isshowen=true;

  void getisshowen()
  {
    isshowen= !isshowen;
    emit(securitylogin());
  }

  void registerdata(
      {
        required String name,
        required String phone,
        required String email,
        required String pass,
      }
      )
  {
    emit(loadingreg());
    diohelper.Postdata(path: "register", data: {
      "email":email,
      "password":pass,
      "name":name,
      "phone":phone,
    }
    ).then((value) {
      object=regestModel.formjason(value.data);
      print("xxxxxxxxxxxxxxx${object.status}");
      print("xxxxxxxxxxxxxxx${object.message}");
      emit(successreg(object));
    }).catchError((onError){
      print ("ffffffffffffffff${onError.toString()}");
      emit(failreg());
    });
  }

}
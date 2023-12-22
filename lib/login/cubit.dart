import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/dio.dart';
import 'package:shop_app/login/shopstates.dart';

import 'model_class.dart';

class shopCubit extends Cubit<states>
{
  shopCubit():super(initialstate()) ;
  static shopCubit get(context)=>BlocProvider.of(context);

 late loginModel object;
  bool isshowen=true;

  void getisshowen()
  {
    isshowen= !isshowen;
    emit(securitylogin());
  }

  void logindata(
  {
   required String email,
    required String pass,
}
      )
  {
    emit(loadinglogin());
    diohelper.Postdata(path: "login", data: {
      "email":email,
      "password":pass
    }
    ).then((value) {
     object=loginModel.formjason(value.data);
     emit(successlogin(object));
    }).catchError((onError){
      print (onError.toString());
      emit(faillogin());
    });
  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/dio.dart';
import 'package:shop_app/login/shopstates.dart';
import 'package:shop_app/search/search_model.dart';
import 'package:shop_app/search/search_state.dart';

import '../login/model_class.dart';
import '../shopAPP/constance.dart';

class searchCubit extends Cubit<searchstates>
{
  searchCubit():super(searchinitial()) ;
  static searchCubit get(context)=>BlocProvider.of(context);

  searchData? model;

  void postdata(
  {
    required String text,
})
{
  emit(searchloding());
  diohelper.Postdata(path: 'products/search',token: token, data: {
    "text":text,
  }).then((value) {
    model=searchData.forjason(value.data);
    print(model!.stats);
    print(model!.data.itemdata[1].name);
    emit(searchsucc());
  }).catchError((e){print(e);
    emit(searchfail());
  });
}


}
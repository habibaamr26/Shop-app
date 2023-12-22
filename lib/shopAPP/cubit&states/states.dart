


import '../../login/model_class.dart';
import '../models/favourit_model.dart';

import '../models/userdata.dart';

abstract class shopstates{}

class initial extends shopstates{}

class bottomNavigationBarState extends shopstates{}



class HomeStateloading extends shopstates{}


class HomeStatesuccess extends shopstates{}


class HomeStatefailer extends shopstates{}


class categoryStatesuccess extends shopstates{}


class categoryStatefailer extends shopstates{}




class favouritStatesucess extends shopstates{
  FavouriteModel model;
  favouritStatesucess(this.model);
}



class favoritStatefailer extends shopstates{}

class favouritchange extends shopstates {}






class favoritsucc extends shopstates{}

class favouritfail extends shopstates {}


class lodingfavourit extends shopstates{}




class userdatasucc extends shopstates{

}


class userdatafail extends shopstates {}




class userubdatedatasucc extends shopstates{
}

class userudatedatafail extends shopstates {}




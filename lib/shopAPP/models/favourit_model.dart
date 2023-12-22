

class FavouriteModel
{
  late bool status;
  late String massege;
  FavouriteModel.formjason(Map<String,dynamic> jason)
  {
    status=jason['status'];
    massege=jason['message'];
  }
}
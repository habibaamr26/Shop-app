class UpdateUserModel
{
  late bool status;
  late String message;
  UserData? data;

  UpdateUserModel.formjason(Map<String,dynamic>jason)
  {
    status=jason['status'];
    message=jason['message'];
    data=jason['data']!=null?UserData.formjason(jason['data']):null;
  }
}


class UserData
{
  late  int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData.formjason(Map<String,dynamic>jason)
  {
    id=jason['id'];
    name=jason['name'];
    email=jason['email'];
    phone=jason['phone'];
    image=jason['image'];
    points=jason['points'];
    credit=jason['credit'];
    token=jason['token'];
  }


}
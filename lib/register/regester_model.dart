

class regestModel
{
  late bool status;
  late String message;
  userData? data;

  regestModel.formjason(Map<String,dynamic>jason)
  {
    status=jason['status'];
    message=jason['message'];
    data=jason['data']!=null?userData.formjason(jason['data']):null;
  }
}


class userData
{
  late  int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

  userData.formjason(Map<String,dynamic>jason)
  {
    id=jason['id'];
    name=jason['name'];
    email=jason['email'];
    phone=jason['phone'];
    image=jason['image'];
    token=jason['token'];
  }


}
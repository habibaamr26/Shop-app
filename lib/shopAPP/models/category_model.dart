


class categorymodel
{
  late bool status;
  late datamodel data;
  categorymodel.formjason(Map<String,dynamic> jason)
  {
    status =jason['status'];
    data=datamodel.formjason(jason['data']);
  }
}

class datamodel
{
  late int currentPage;
 late List <insideDataModel> insidedata=[];

  datamodel.formjason(Map<String,dynamic> jason)
  {
    currentPage=jason['current_page'];
    jason['data'].forEach((element){
      insidedata.add(insideDataModel.formjason(element));
    });
  }
}



class insideDataModel{
  late int id;
  late String name;
  late String image;
  insideDataModel.formjason(Map<String,dynamic> jason)
  {

    id=jason['id'];
    name=jason['name'];
    image=jason['image'];
  }
}
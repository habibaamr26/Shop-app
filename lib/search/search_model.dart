

class searchData
{
  late bool stats;
  late favoritData data;
  searchData.forjason(Map<String,dynamic> jason)
  {
    stats=jason['status'];
    data=favoritData.formjason(jason['data']);
  }
}

class  favoritData
{
  late List <insideData> itemdata=[];
  favoritData.formjason(Map<String,dynamic> jason)
  {
    jason['data'].forEach((element){
      itemdata.add(insideData.formjason(element));
    });

  }
}


class  insideData

{
  late dynamic id;
  late dynamic price;
  late String image;
  late String name;

  insideData.formjason(Map<String, dynamic> jason) {
    id = jason['id'];
    price = jason['price'];
    image = jason['image'];
    name = jason['name'];

  }
}

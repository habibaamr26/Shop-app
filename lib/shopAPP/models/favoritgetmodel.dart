

class favoritGetData
{
  late bool stats;
 late favoritData data;
  favoritGetData.forjason(Map<String,dynamic> jason)
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
  late dynamic idfavorit;
  late productdata product;
  insideData.formjason(Map<String,dynamic> jason)
  {
    idfavorit=jason['id'];
    product= productdata.formjason(jason['product']);

  }
}

class productdata
{late dynamic id;
late dynamic price;
late dynamic oldPrice;
late dynamic discount;
late String image;
late String name;

productdata.formjason(Map<String, dynamic> jason) {
  id = jason['id'];
  price = jason['price'];
  oldPrice = jason['old_price'];
  discount = jason['discount'];
  image = jason['image'];
  name = jason['name'];

}
}



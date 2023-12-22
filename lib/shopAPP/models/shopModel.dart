class HomeModel {
  late bool status;
  late userDataModel data;
  HomeModel.formjason(Map<String, dynamic> jason) {
    status = jason['status'];
    data = userDataModel.jasonform(jason['data']);
  }
}

class userDataModel {
  //Map<String, dynamic>?
 late List<pannerModel> banners = [];
  late List<Product> products = [];

  userDataModel.jasonform(Map<String, dynamic> jason) {
    jason['banners'].forEach((element) {
      banners.add(pannerModel.formjason(element));
    });

    jason['products'].forEach((element) {
      products.add(Product.formjason(element));
    });
  }
}

//الصور اللي معروضه فوق ف ال project

class pannerModel {
  late int id;
  late String image;

  pannerModel.formjason(Map<String, dynamic>jason) {
    id = jason['id'];
    image = jason['image'];
  }
}


//product that show in main home image ,id ,name
class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool inFavourites;
  late bool inCart;
  Product.formjason(Map<String, dynamic> jason) {
    id = jason['id'];
    price = jason['price'];
    oldPrice = jason['old_price'];
    discount = jason['discount'];
    image = jason['image'];
    name = jason['name'];
    inFavourites = jason['in_favorites'];
    inCart = jason['in_cart'];
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shopAPP/models/shopModel.dart';
import 'package:shop_app/shopAPP/cubit&states/states.dart';

import '../../reusable/reusable.dart';
import '../cubit&states/cubit_To_shop.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopBloc, shopstates>(
        builder: (context, state) {
          var cubit = shopBloc.get(context);
          return ConditionalBuilder(
              condition: cubit.data != null,
              builder: (context) => homeBuilder(cubit.data, context),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        },
        listener: (context, state) {
          if(state is favouritStatesucess)
            {
              if(!state.model.status) fluttertost(message: state.model.massege, color: Colors.red);
            }
        });
  }

  Widget homeBuilder(HomeModel? model, context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: model!.data.banners
                      .map((e) =>
                          Image(height: 250, image: NetworkImage(e.image)))
                      .toList(),
                  options: CarouselOptions(
                    height: 250,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 10),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.ease,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0,
                  )),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "New Product",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[300],
                child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 1 / 1.75,
                    children: List.generate(
                        model.data.products.length,
                        (index) => buildGridView(
                            model.data.products[index], context))),
              ),
            ],
          ),
        ),
      );
}

Widget buildGridView(Product model, context) => Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(height: 200, image: NetworkImage(model.image)),
              if (model.discount != 0)
                Container(
                  padding:  const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.deepOrange,
                  child: const Text(
                    "DISCOUNT",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: const TextStyle(height: 1, fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    " ${model.price}",
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (model.discount != 0)
                    Text(
                      " ${model.oldPrice}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                      ),
                    ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        shopBloc.get(context).changefavourit(model.id);
                      },
                      icon: CircleAvatar(
                          backgroundColor:
                              shopBloc.get(context).favourits![model.id] ==
                                      true
                                  ? Colors.deepOrange
                                  : Colors.grey,
                          radius: 16,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 18,
                            color: Colors.white,
                          )))
                ],
              ),
            ],
          ),
        ],
      ),
    );

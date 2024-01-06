import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shopAPP/cubit&states/cubit_To_shop.dart';
import 'package:shop_app/shopAPP/cubit&states/states.dart';

import '../../reusable/reusable.dart';
import '../models/favoritgetmodel.dart';



class Favorit extends StatelessWidget {
  @override
  var addresscontroller = TextEditingController();
  Widget build(BuildContext context) {
    return BlocConsumer<shopBloc, shopstates>(
        builder: (context, state) {
          var cubit = shopBloc.get(context);
          return ConditionalBuilder(
              condition: state is! lodingfavourit,
              builder: (context) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) =>
                            favouriteBuilder(
                                cubit.getdataf!.data.itemdata[index].product,
                                context),
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                          height: 5,
                          width: double.infinity,
                          color: Colors.grey[100],
                        ),
                        itemCount: cubit.getdataf!.data.itemdata.length,
                      ),
                    ),


                  ],
                );
              },
              fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
              );
        },
        listener: (context, state) {});
  }
}


Widget favouriteBuilder(productdata model, context) {

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image(
        image: NetworkImage(model.image),
        height: 150,
        width: 150,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style: const TextStyle(height: 1, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text("${model.price}",
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 14,
                    )),
                const SizedBox(
                  width: 12,
                ),
                if (model.discount != 0)
                  Text(
                    "${model.oldPrice}",
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
                            shopBloc.get(context).favourits![model.id] == true
                                ? Colors.deepOrange
                                : Colors.grey,
                        radius: 16,
                        child: const Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: Colors.white,
                        )))
              ],
            )
          ],
        ),
      ),
    ],
  );
}

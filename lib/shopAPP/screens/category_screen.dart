import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shopAPP/cubit&states/cubit_To_shop.dart';

import '../cubit&states/states.dart';
import '../models/category_model.dart';

class category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopBloc, shopstates>(
      builder: (BuildContext context, state) => ConditionalBuilder(
          condition: shopBloc.get(context).categorymodelgetdata != null,
          builder: (context) =>
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:[
              //Text("Categories",style: TextStyle(fontSize: 25),),
              Expanded(child: buildWidget(shopBloc.get(context).categorymodelgetdata)),]),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator())),
      listener: (BuildContext context, Object? state) {},
    );
  }

  Widget buildWidget(categorymodel? model) => ListView.separated(
    physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            itemBuilder(model?.data.insidedata[index]),
        separatorBuilder: (BuildContext context, int index) => Container(
          height: 7,
          width: double.infinity,
          color: Colors.grey[100],
        ),
        itemCount: model!.data.insidedata.length,
      );

  Widget itemBuilder(insideDataModel? model) =>
      Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                image: NetworkImage(model!.image),
                height: 200,
                width: double.infinity,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                  width: 100,
                  //color: Colors.deepOrange.withOpacity(0.7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrange.withOpacity(0.7),
                  ),
                  child: Text(
                    model.name,
                    style: const TextStyle(color: Colors.white,
                    fontSize: 16),
                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          ),
        ],
      );
}

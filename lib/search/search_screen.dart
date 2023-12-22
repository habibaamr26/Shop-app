import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/search/search_cubit.dart';
import 'package:shop_app/search/search_state.dart';

import '../reusable/reusable.dart';
import '../shopAPP/models/favoritgetmodel.dart';

class search extends StatelessWidget {
  var ah = GlobalKey<FormState>();
  TextEditingController se = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => searchCubit(),
      child: BlocConsumer<searchCubit, searchstates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Form(
            key: ah,
            child: Column(
              children: [
                reusabletext(
                  prefixicon: Icons.search,
                  controller: se,
                  hintText: 'Enter text',
                  labelText: 'Search',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter text to search";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    searchCubit.get(context).postdata(text: value);
                  },
                  keyboardtype: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                if (state is searchloding)
                   const LinearProgressIndicator(),
                if (state is searchsucc)Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: NetworkImage(searchCubit
                                  .get(context)
                                  .model!
                                  .data
                                  .itemdata[index]
                                  .image),
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
                                    searchCubit
                                        .get(context)
                                        .model!
                                        .data
                                        .itemdata[index]
                                        .name,
                                    style: TextStyle(height: 1, fontSize: 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "${searchCubit.get(context).model!.data.itemdata[index].price}",
                                          style: const TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 14,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                        height: 5,
                        width: double.infinity,
                        color: Colors.grey[100],
                      ),
                      itemCount:
                          searchCubit.get(context).model!.data.itemdata.length,
                    ),
                  ),
              ],
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}

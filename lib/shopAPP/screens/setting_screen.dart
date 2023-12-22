import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/sharedpref.dart';
import 'package:shop_app/shared/dio.dart';
import '../../login/login_screen.dart';
import '../../reusable/reusable.dart';
import '../cubit&states/cubit_To_shop.dart';
import '../cubit&states/states.dart';

class SettingScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<shopBloc, shopstates>(
        listener: (context, state) {},
        builder: (context, state) {
          shopBloc.get(context).userdata!;
          email.text = shopBloc.get(context).userdatamodel!.data!.email;
          name.text = shopBloc.get(context).userdatamodel!.data!.name;
          phone.text = shopBloc.get(context).userdatamodel!.data!.phone;
          return ConditionalBuilder(
              condition: shopBloc.get(context).userdatamodel != null,
              builder: (context) => SingleChildScrollView(
                child: Column(
                      children: [
                        reusabletext(
                            controller: name,
                            hintText: '',
                            labelText: 'NAME',
                            validator: (String? value) {},
                            keyboardtype: TextInputType.text,
                            prefixicon: Icons.person),
                        reusabletext(
                            controller: email,
                            hintText: '',
                            labelText: 'Eamil',
                            validator: (String? value) {},
                            keyboardtype: TextInputType.text,
                            prefixicon: Icons.person),
                        reusabletext(
                            controller: phone,
                            hintText: '',
                            labelText: 'PHONE',
                            validator: (String? value) {},
                            keyboardtype: TextInputType.text,
                            prefixicon: Icons.person),
                       /* Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                shopBloc.get(context).ubdateuserdata(
                                    phone: phone.text,
                                    name: name.text,
                                    email: email.text,

                                );

                              },
                              child: const Text(
                                "Update",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),*/
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                cachHelper.removedata(key: "token").then((value) {
                                  print(value);
                                  if (value) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (_) {
                                      return login();
                                    }));
                                  }
                                });
                              },
                              child: const Text(
                                "sign-out",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
              fallback: (BuildContext context) =>
                  const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}

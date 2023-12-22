


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/onbording.dart';

import 'package:shop_app/reusable/reusable.dart';
import 'package:shop_app/login/shopstates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shop_app/shared/sharedpref.dart';
import 'package:shop_app/shopAPP/constance.dart';
import 'package:shop_app/shopAPP/screens/home_screen.dart';
import '../shopAPP/home_layout.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cubitto register.dart';


class register extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => registerCubit(),
        child: BlocConsumer<registerCubit, states>(
          listener: (context, state) {
            if (state is successreg) {
              if (state.x.status) {
                cachHelper
                    .setdata(key: "token", value: state.x.data!.token)    //data come from data base and save in sared
                    .then((value) {
                  token=state.x.data!.token;
                  fluttertost(message: state.x.message, color: Colors.green);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                    return ShopLayout();
                  }));
                });
              } else {
                print(state.x.message);
                fluttertost(message: state.x.message, color: Colors.red);
              }
            }
          },
          builder: (context, state) => Form(
            key: formkey,

            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              Colors.deepOrange,
                            ])),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Register now to browse our hot offers",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  reusabletext(
                    prefixicon: Icons.person,
                    controller: namecontroller,
                    hintText: 'Enter Your name',
                    labelText: 'NAME',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Enter your name please";
                      }
                      return null;
                    },
                    keyboardtype: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reusabletext(
                    prefixicon: Icons.email_outlined,
                    controller: emailcontroller,
                    hintText: 'Enter Your Email',
                    labelText: 'EMAIL',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Enter your email please";
                      }
                      return null;
                    },
                    keyboardtype: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reusabletext(
                    prefixicon: Icons.phone,
                    controller: phonecontroller,
                    hintText: 'Enter Your Phone number',
                    labelText: 'PHONE',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Enter your phone number please";
                      }
                      return null;
                    },
                    keyboardtype: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reusabletext(
                    prefixicon: Icons.lock_outline,
                    suffixxicon: registerCubit.get(context).isshowen
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onpressedsuffix: () {
                      registerCubit.get(context).getisshowen();
                    },
                    onFieldSubmitted: (value) {
                      if (formkey.currentState!.validate()) {
                        registerCubit.get(context).registerdata(
                          phone:phonecontroller.text ,
                          name:namecontroller.text ,
                          email: emailcontroller.text,
                          pass: passwordcontroller.text,
                        );
                      }
                    },
                    controller: passwordcontroller,
                    hintText: 'Enter Your Password',
                    labelText: 'PASSWORD',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Enter your password please";
                      }
                      return null;
                    },
                    keyboardtype: TextInputType.visiblePassword,
                    obscureText: registerCubit.get(context).isshowen,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ConditionalBuilder(
                      condition: state is! loadingreg,
                      builder: (context) => buttonreusable(
                          hinttext: 'Register',
                          onpreesed: () {
                            if (formkey.currentState!.validate()) {
                              registerCubit.get(context).registerdata(
                                phone:phonecontroller.text ,
                                name:namecontroller.text ,
                                email: emailcontroller.text,
                                pass: passwordcontroller.text,
                              );

                            }
                          }),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator())),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

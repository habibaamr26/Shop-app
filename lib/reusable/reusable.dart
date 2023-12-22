import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget reusabletext({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  IconData? prefixicon,
  IconData? suffixxicon,
  Function()? onpressedsuffix,
  required String? Function(String?) validator,
  void Function(String)? onFieldSubmitted,
  required TextInputType keyboardtype,
  bool obscureText=false,
}) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixicon != null
              ? Icon(
                  prefixicon,
                  color: Colors.deepOrange,
                )
              : null,
          suffixIcon: suffixxicon != null
              ? IconButton(
                  onPressed: onpressedsuffix,
                  icon: Icon(
                    suffixxicon,
                    color: Colors.deepOrange,
                  ))
              : null,
        ),
        keyboardType: keyboardtype,
        controller: controller,
        obscureText:obscureText ,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );






Widget buttonreusable({
  required String hinttext,
  double height = 40,
  double width = 200,
  double radius = 20,
  Color color1 = Colors.blueAccent,
  Color color2 = Colors.cyanAccent,
  Function()? onpreesed,
}) =>
    Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: const LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
                  Colors.white,
                  Colors.deepOrange,
                ])),
        child: TextButton(
            onPressed: onpreesed,
            child: Text(
              hinttext,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            )));






Future<bool?> fluttertost({required String message,
required Color color,
}
    )=> Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0);



//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:plantsshop/models/LognModel.dart';


//import 'dart:html';

import 'package:plantsshop/screens/splash.dart';

Widget defaultTextButton({
  required  function,
  required dynamic text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );



Widget defaultButton({
  double width =300,
      //double.infinity,
  Color background = Colors.green,
  bool isUpperCase = true,
  required BuildContext context,
  double radius = 3.0,
  required Widget screen,
    function,
  required dynamic text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: (){
          print(('###########'));

        //  print(LognModel['message']);
          print(('##############'));

          navto(context,screen);

        },
       // function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );


void navto(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   onSubmit,
  double width =300,

  // Function onChange,
  //Function onTap,
  bool isPassword = false,
  required  validate,
  required dynamic label,
}) =>
    SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        keyboardType: type,

        style: TextStyle(

          color: Colors.black,),

        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,


        ),
      ),
    );






















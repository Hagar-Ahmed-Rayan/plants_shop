

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/carditems.dart';
import 'package:plantsshop/screens/changeemailscreen.dart';
import 'package:plantsshop/screens/login.dart';
import 'package:plantsshop/screens/splash.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
    listener: (context, state) {},
    builder: (context, state) {
  //    ShopLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text );
      var userdata=ShopLoginCubit.get(context).lm;

      ShopLoginCubit s=ShopLoginCubit();
     print (s.y);
      print (s.s);

      print (constmodel);
print (constmodel['data']['user']['firstName']);

//print (userdata['data']['user']['firstName']);

    return SafeArea(
      child: Scaffold(
       appBar:null,
       body:
       Column(

         children: [
           Stack(
             alignment: AlignmentDirectional.center,


             children: [


               Container(
                 height: 250,
                 width: MediaQuery.of(context).size.width,

                 child: FittedBox(
                   child: Image(image: NetworkImage(



                      //   'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                     constmodel['data']['user']['imageUrl']
                   )
                   ),
                   fit: BoxFit.fill,

                 ),
               ),

               Column(

                 children: [
               Padding(
                 padding: const EdgeInsetsDirectional.only(
                  // bottom: 3.0,
                  // end: 3.0,
                   top: 20
                 ),
                 child: CircleAvatar(
                   radius: 50.0,

                   backgroundImage: NetworkImage(
                     //  'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                       constmodel['data']['user']['imageUrl']
                   )
                 ),
                 ),
                   Text(constmodel['data']['user']['firstName']+' '+constmodel['data']['user']['lastName']),
                   ]
               )

             ],
           ),
           SizedBox(
             height: 10,

           ),

           Container(
             width: 300,
             height: 50.0,
             child: MaterialButton(
               onPressed: (){
navto(context, splashscreen());
print('firstlyy');

print(constmodel);
print('finallly');


               },
               // function,
               child: Text(
                 'change Name',
                 style: TextStyle(
                   color: Colors.black,
                 ),
               ),
             ),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(
                 3,
               ),
               color: Colors.green,
             ),
           ),
           SizedBox(
             height: 10,

           ),
           Container(
             width: 300,
             height: 50.0,
             child: MaterialButton(
               onPressed: (){
              /*   navto(context, changeemail());
                 print('firstlyy');

                 print(constmodel);
                 print('finallly');*/


               },
               // function,
               child: Text(
                 'change Email',
                 style: TextStyle(
                   color: Colors.black,
                 ),
               ),
             ),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(
                 3,

               ),
               color: Colors.green,
             ),
           ),
           SizedBox(
             height: 10,

           ),
           Container(
             width: 300,
             height: 50.0,
             child: MaterialButton(
               onPressed: (){
navto(context, carditems());

               },
               // function,
               child: Text(
                 'cart items',
                 style: TextStyle(
                   color: Colors.black,
                 ),
               ),
             ),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(
                 3,

               ),
               color: Colors.green,
             ),
           ),
           SizedBox(
             height: 10,

           ),
           Container(
             width: 300,
             height: 50.0,
             child: MaterialButton(
               onPressed: (){


               },
               // function,
               child: Text(
                 'create posts',
                 style: TextStyle(
                   color: Colors.black,
                 ),
               ),
             ),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(
                 3,

               ),
               color: Colors.green,
             ),
           ),





         ],
       ),


      ),
    );
    }

    );
  }
}
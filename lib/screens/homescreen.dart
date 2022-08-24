

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/models/productsmodel.dart';
import 'package:plantsshop/screens/searchforproducts.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';
List<dynamic>addtocarditems=[];
Map<String,bool>incart={};
bool exsit=false;
class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchtext = TextEditingController();

        ShopLoginCubit.get(context).showproductsinfo(token: TOKEN);

    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopproductsInitialState) {
            print("1111111111111111111111111111111111111111111111111");
          }
          else if (state is ShopproductsLoadingState) {
           print("222222222222222222222222222222222222222222");
          }
          else if (state is ShoppprodctsSuccessState) {
            print("333333333333333333333333333333333333333");
          }
          else if (state is ShopproductsErrorState) {
            print("44444444444444444444444444");
          }
          else{
            print("555555555555555");


          }


        },

        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                appBar: null,
                body: ShopLoginCubit.get(context).products==null?Center(
                  child: CircularProgressIndicator(),
                ):Padding(
                  padding: const EdgeInsets.all(10.0),

                  child: Column(
                      children: [
                        Image.asset('images/lavie.png',
                          //   height: 50,
                        ),

                        Image(image: AssetImage('images/branding.png')),
                        /* TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Type in your text",
              fillColor: Colors.white70),
        ),*/
                        SizedBox(

                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 260,
                                child: TextFormField(
                                  controller: searchtext,
onTap:(){
navto(context, productssearch());
},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      print("test");
                                    }
                                  },

                                  onFieldSubmitted: (value) {
                                   print(value);
                                    ShopLoginCubit.get(context)
                                        .searchproducts(
                                      token: TOKEN,
                                      text: searchtext.text,
                                    );

                                   /* for(int i=0;i<ShopLoginCubit.get(context).searcheditems.length;i++) {
                                      print(ShopLoginCubit
                                          .get(context)
                                          .searcheditems[i]);
                                      print(TOKEN);
                                      print(
                                          "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkak");
                                    }*/
                                    /*len = ShopLoginCubit
                                        .get(context)
                                        .len;*/
                                  },
                                  decoration: InputDecoration(

                                    prefixIcon: Icon(Icons.search,
                                      color: Colors.grey,

                                    ),
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    //  focusedBorder: ,
                                    //  focusColor: Colors.blue,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            15),
                                        borderSide: BorderSide.none),
                                    hintText: 'Search',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(

                              width: 5,
                            ),

                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green,


                              ),
                              child:
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.shopping_basket_rounded, size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            )

                          ],
                        ),

                        SizedBox(

                          height: 5,
                        ),

                        itemproducts(ShopLoginCubit.get(context).products),


                        /*  Container(
                            color: Colors.red,
                            width: 100,
                            child: MaterialButton(
                                onPressed: () {
                                  print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

                                  print(   ShopLoginCubit.get(context).products);
                                }

                            )
                        )*/

                        /*          Column(


                          children: [
                            Container(
                              color: Colors.red,
                              child: MaterialButton(
                                  onPressed: () {
                                    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

                                 print(   ShopLoginCubit
                                        .get(context)
                                        .products);
                                  }

                              )
                            )



                              //     itemproducts(ShopLoginCubit.get(context).products),

                          /*  Container(
                              width: 150,
                              //height: 30,
                              child: MaterialButton(
                                onPressed: (){
                                  ShopLoginCubit.get(context).showproductsinfo(
                                      token: TOKEN
                                  );


                                  print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                //  print(ShopLoginCubit.get(context).products);
                                  print(ShopLoginCubit.get(context).products['data'][0]['imageUrl']);

                                  print(ShopLoginCubit.get(context).len);

                                  print("ccccccccccccccccccccccccc");


                                  //            if(ShopLoginCubit.get(context).sucessmess=='Success')


                                },
                                // function,
                                child: Text(
                                  'xxxxxxxxxxxx',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  3,
                                ),
                                color: Colors.green,
                              ),
                            ),*/






                            /* Expanded(
            child: GridView.count(crossAxisCount: 2,
              children: List.generate(len, (index) => gridindexx(),

              ),

            ),
          )*/


                          ],

                        ),*/


                        //  mainAxisAlignment: MainAxisAlignment.start,


                      ]
                  ),
                )



            ),
          );
        }

    );
  }
}


  Widget itemproducts( dynamic model) =>

      Expanded(
        /*   Container(
color: Colors.red,


                width: 150,
                //height: 30,
                child: MaterialButton(
                    onPressed: () {
                      print("+++=++++*************************************++++++++++");
                      print(model);
                      print(model['data'][1]['name']);

                    }
                )









            ),*/


        child: Container(
          width: double.infinity,
          child: GridView.count(crossAxisCount: 2,
            children: List.generate(10, (index) =>
                gridindex(model['data'][index]),

            ),

          ),
        ),
      );











  Widget gridindex(dynamic item) =>

      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 20,
          child: Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(
                3,
              ),
              color: Colors.grey[100],
            ),


            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

 /*Container(
   color: Colors.red,
   child: MaterialButton(
onPressed: ()
                  {
                    print("هااااااااHHHHHHHHHHHHHHHااااااااااااااااجر");
                    print(baseurl+item['imageUrl']);
                  },
            ),
 ),*/

                 Expanded(
                    child: Row(
                      children: [
                        Image(image: NetworkImage(
                       //     'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                        baseurl+item['imageUrl'],
                        ),
                        ),
                        SizedBox(width: 50,),
                        Text('1'),

                      ],
                    ),
                  ),
                  SizedBox(height: 5,),

                  Text(item['name'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:FontWeight.bold ,
                    ),

                  ),
                  SizedBox(height: 5,),

                  Row(
children: [
                  Text(item['price'].toString() ),
                  Text(' EGP'),
                  ]
 ),
                  SizedBox(height: 5,),

                  Container(
                    width: 200,
                    height: 40.0,
                    child: MaterialButton(
                      onPressed: () {
                         exsit=false;
                       // incart.addAll({item['productId']:true});
                       print( item['productId']);

                      /*  if(!addtocarditems.contains(item)) {
                          print(('###########'));
                          addtocarditems.add(item);

                        }*/

                       for(int i=0;i<addtocarditems.length;i++) {
if(item['productId']==addtocarditems[i]['productId']){
exsit=true;
break;
}
}
                           if(!exsit) {
                             addtocarditems.add(item);

                             print(('###########'));
                           }
                      },
                      // function,
                      child: Text(
                        'Add To Card',
                        style: TextStyle(
                          color: Colors.white,
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
          ),
        ),
      );



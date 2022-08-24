import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/models/LognModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/models/Modelgoogle.dart';
import 'package:plantsshop/models/plantsmodel.dart';
import 'package:plantsshop/models/productsmodel.dart';
import 'package:plantsshop/models/seedsmodel.dart';
import 'package:plantsshop/screens/splash.dart';
import 'package:plantsshop/shared/cache.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/dio.dart';
import 'package:plantsshop/shared/endpoints.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
//late String sucessmess;
  int y=9;
  String s="hh";
    var loginModel;
   var  lm;
   var edituser;
  late Modelgoogle googlemodel;
  int? len;
   List<dynamic> searcheditems =[];

int  numofsearchresult=0;//number

  void userLogin({
    required dynamic email,
    required dynamic password,
  })
  {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },

    ).then((value)
    {

   //  sucessmess=value.data['type'];
      print(value.data['type']);
      print(value.data['data']);
      loginModel=value.data;
      constmodel=value.data;
lm=LognModel.fromJson(value.data);
print (lm.type);
      print (lm.message);
s='gogo';
      print("loginnnnnnnnnnnnn doneeeeeeeeeeeeeee");
      print(loginModel);

     // showplantsinfo(token:value.data['data']['accessToken']);
      print(value.data['data']['accessToken']);
     CacheHelper.saveData(key: 'token', value: value.data['data']['accessToken'].toString());

     // loginModel = LognModel.fromJson(value.data);
    //  showproductsinfo(token: value.data['data']['accessToken']);

      emit(ShopLoginSuccessState(loginModel));

    }).catchError((error)
    {

      print("zffffffffffffftlogin");
      print(error);
      emit(ShopLoginErrorState(error));
    });
  }




  void postgoogle({
    required dynamic id,
    required dynamic email,
    required dynamic firstname,
    required dynamic lastname,
    required dynamic picture,
  })
  {
    emit(postgoogleLoadingState());

    DioHelper.postData(
      url: GOOGLE,
      data:
      {
      "id": id,
      "email": email,
      "firstName": firstname,
      "lastName": lastname,
      "picture": picture,

      },
    ).then((value)
    {

      print(value.data['type']);
      print("t22222222222222222222222222222222222222");

      googlemodel = Modelgoogle.fromJson(value.data);
      emit(googleSuccessState(googlemodel));
    }).catchError((error)
    {

      print("22222222222222222222222222222222222222222222222zffffffffffffft");
      print(error);
      emit(googleErrorState(error));
    });
  }

void getuserinfo(){
    print(loginModel);
emit(getuserdata());

}





//////////////////////getplants////////////////////////////////////////////////////

 // late plantesmodel  plantes ;
    var  plantes ;

  late     seedsmodel seeds;

 //  late String  plantes ;


  void showplantsinfo({

    required dynamic token,
  })
  {
    emit(ShopplantsLoadingState());

    DioHelper.getData(
      token: token,

      url: GETplants,

    ).then((value)
    {

      print("pppppppppppppppppppppppppppppppppppppppppppppppppppp");
     // sucessmess=value.data['type'];
      print(value.data);

      print(value.data['message']);

      print("tmammmmmmmmmmmmmmmmmmm");

      print(value.data['data'][0]['name']);
      print(value.data['data'][1]['sunLight']);
      plantes = value.data;

   //  plantes = plantesmodel.fromJson(value.data);
      print("assssssssssssssssssssssssssssssssssss");

      print(plantes);
      print("ppppppppppppppppppppppppppppppp999999999999999999999ppppppppppppppppppppp");

     //  emit(ShopplantsSuccessState(plantes));

    }).catchError((error)
    {

      print("zffffffffffffffffffffffffffffffffffffffffffftplants");
      print(error);








    //  emit(ShopplantsErrorState(error()));
    });
  }


//////////////////////getproducts////////////////////////////////////////////////////

  //List<dynamic>  products = [];
var products ;
//  late String  plantes ;


  void showproductsinfo({

    required dynamic? token,
  })
  {
    emit(ShopproductsLoadingState());

    DioHelper.getData(
      token: token,

      url: GETproducts,

    ).then((value)
    {

        //  len = value.data['data'].length;


          // sucessmess=value.data['type'];
          print(value.data);

          print(value.data['message']);

          print("tmammmmmmmmmmmmmmmmmmm");

          print(value.data['data'][0]['name']);
          print(value.data['data'][1]['price']);

          //products = productsmodel.fromJson(value.data);
          //print(products.toString());
          print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
          products = value.data;
          print(products);


          emit(ShoppprodctsSuccessState(products));
          print(
             "ppppppppppppppppppppppppppppppp222222222222222ppppppppppppppppppppp");

    }).catchError((error)

    {

      print("zffffffffffffffffffffffffffffffffffffffffffftproducts");
      print(error);


      emit(ShopproductsErrorState());
    });
  }



//////////////////////search////////////////////////////////////////////////////

  late productsmodel  search ;

//  late String  plantes ;


  void searchproducts({

    required dynamic token,
    required dynamic text
  })
  {
    emit(ShopsearchLoadingState());
    DioHelper.getData(
      token: token,


      url: GETproducts,
      query: {
      }

    ).then((value)
    {
      searcheditems=[];

      // sucessmess=value.data['type'];
   //   print(value.data);

      print(value.data['message']);
      print("gameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed111111111");
     int num =value.data['data'].length;
     for(int i=0;i<num;i++) {


       if (text == value.data['data'][i]['name']||value.data['data'][i]['name'].contains(text))  { //||it sub string of it
       //  numofsearchresult=numofsearchresult+1;
         searcheditems.add(value.data['data'][i]);
       // print (searcheditems[i]['name']);
         print (searcheditems.length);

         print(value.data['data'][i]);
         print("gameeeeeeeeeeeeeeeeed222222222222222");
       }
     }



   //   search = productsmodel.fromJson(value.data);
     // print(search.toString());

     emit(ShoppsearchSuccessState(searcheditems));

    }).catchError((error)
    {

      print("zffffffffffffffffffffffffffffffffffffffffffftsearch");
      print(error);








      emit(ShopsearchErrorState(error()));
    });
  }



  void showquiz(){

    emit(openquiz());

  }
  void removefromcart(){

    emit(removecartitem ());

  }


 void changrconstmodel (){
    emit(changrconstmodelstate());
 }


/***********************update*/


///////////////////////////

  void userupdate({
 dynamic firstname,
    //dynamic? lastname ,
    dynamic email,
    required dynamic token,
  })
  {
    emit(ShopupdateLoadingState());

    DioHelper.patchdata(
      url: UPDATE,
       token: token,
      data:
      {
        'firstName':firstname,
      'email': email,
        //'firstname':firstname
      },

    ).then((value)
    {

      //  sucessmess=value.data['type'];
      print(value.data);
      edituser=value.data;
      print("update doneeeeeeeeeeeeeee");




      emit(ShopupdateSuccessState(edituser));

    }).catchError((error)
    {

      print("zffffffffffffftupdate");
      print(error);
      emit(ShopupdateErrorState(error));
    });
  }















/* void searchproducts({

    required dynamic token,
    required dynamic text
  })
  {
    emit(ShopsearchLoadingState());
    DioHelper.getData(
      token: token,


      url: GETproducts,
      query: {
      }

    ).then((value)
    {

      // sucessmess=value.data['type'];
   //   print(value.data);

      print(value.data['message']);
      print("gameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed");

      if (text ==value.data['data'][0]['name']) {
        print(value.data['data'][1]['price']);
        print("gameeeeeeeeeeeeeeeeed");

      }



      print(value.data['data'][0]['name']);
      print(value.data['data'][1]['name']);


      search = productsmodel.fromJson(value.data);
      print(search.toString());

      emit(ShoppsearchSuccessState(products));

    }).catchError((error)
    {

      print("zffffffffffffffffffffffffffffffffffffffffffftsearch");
      print(error);








      emit(ShopsearchErrorState(error()));
    });
  }*/







}



































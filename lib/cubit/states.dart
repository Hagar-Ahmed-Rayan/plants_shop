
import 'package:plantsshop/models/LognModel.dart';
import 'package:plantsshop/models/Modelgoogle.dart';
import 'package:plantsshop/models/plantsmodel.dart';
import 'package:plantsshop/models/productsmodel.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates
{
  var loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates {}

class postgoogleLoadingState extends ShopLoginStates {}
class googleSuccessState extends ShopLoginStates {
late final Modelgoogle  googlemodel  ;

googleSuccessState(this.googlemodel);
}

class googleErrorState extends ShopLoginStates {

  final dynamic error;

  googleErrorState(this.error);

}
///////////////////plants//////////////////////////////////////////////////


//abstract class ShopplantsStates {}

class ShopInitialState extends ShopLoginStates {}

class ShopplantsLoadingState extends ShopLoginStates {}

class ShopplantsSuccessState extends ShopLoginStates
{
  var   plantsModel;

  ShopplantsSuccessState(this.plantsModel);
}

class ShopplantsErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopplantsErrorState(this.error);
}
//////////////////////////////prodcts









class ShopproductsInitialState extends ShopLoginStates {}

class ShopproductsLoadingState extends ShopLoginStates {}

class ShoppprodctsSuccessState extends ShopLoginStates
{
  var  productmodel;

  ShoppprodctsSuccessState(this.productmodel);

}

class ShopproductsErrorState extends ShopLoginStates
{
 //  var error;

  ShopproductsErrorState();
}
//////////////////////////////search









class ShopsearchInitialState extends ShopLoginStates {}

class ShopsearchLoadingState extends ShopLoginStates {}

class ShoppsearchSuccessState extends ShopLoginStates
{
  List<dynamic> searcheditems;


  ShoppsearchSuccessState(this.searcheditems);

}

class ShopsearchErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopsearchErrorState(this.error);
}
class openquiz extends ShopLoginStates{


}


class removecartitem extends ShopLoginStates{


}
class getuserdata extends ShopLoginStates{


}

class changrconstmodelstate extends ShopLoginStates {

}





//////////////////update













class ShopupdateInitialState extends ShopLoginStates {}

class ShopupdateLoadingState extends ShopLoginStates {}

class ShopupdateSuccessState extends ShopLoginStates
{
  var searcheditems;


  ShopupdateSuccessState(this.searcheditems);

}

class ShopupdateErrorState extends ShopLoginStates
{
  final dynamic error;

  ShopupdateErrorState(this.error);
}
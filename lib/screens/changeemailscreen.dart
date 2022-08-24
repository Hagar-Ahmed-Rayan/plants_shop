
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/profile.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/endpoints.dart';

class changeemail extends StatelessWidget {
  const changeemail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formkeyy = GlobalKey<FormState>();

    var editControlleremail = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(

        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              //backgroundColor: Colors.green,
              appBar: (null),
              body: Form(
                key: formkeyy,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultFormField(
                        controller: editControlleremail,
                        type: TextInputType.emailAddress,
                        label: 'email',
                        validate: (dynamic? value) {
                          if (value!.isEmpty)
                            return 'email is empty';

                        },
                      ),

                      SizedBox(
                        height: 50.0,
                      ),



                      Container(
                        width: 300,
                        height: 50.0,
                        child: MaterialButton(
                          onPressed: (){

                            if(formkeyy.currentState!.validate()) {
                              print(('###########66666666666666666666'));
                              constmodel['data']['user']['email']=editControlleremail.text;

                              ShopLoginCubit.get(context).userupdate(
                                email: editControlleremail.text,
                                firstname:constmodel['data']['user']['firstName'] ,
                                token: TOKEN,
                              );
                              ShopLoginCubit.get(context).changrconstmodel();
                              navto(context, profile());

                            }







                          },
                          // function,
                          child: Text(
                            'update email',
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
        },
      ),


    );
  }
}
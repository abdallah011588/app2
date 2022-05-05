
import 'package:app2/layout/shop_app/shop_layout.dart';
import 'package:app2/modules/shop_app/login/cubit/cubit.dart';
import 'package:app2/modules/shop_app/login/cubit/states.dart';
import 'package:app2/modules/shop_app/register/cubit/cubit.dart';
import 'package:app2/modules/shop_app/register/cubit/states.dart';
import 'package:app2/shared/components/components.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class  shopRegisterScreen extends StatelessWidget {

  var formkey=GlobalKey<FormState>();
  //bool ispassword=true;
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  var namecontroller=TextEditingController();
  @override
  Widget build(BuildContext context)
  {

   return BlocProvider(
      create: (context) => shopRegisterCubit(),
      child: BlocConsumer<shopRegisterCubit,shopRegisterState>(
        listener: (context, state)
        {

          if(state is shopRegisterSuccessState)
          {
            if(state.loginmodel.status)
            {
              CacheHelper.saveData(key: 'token', value: state.loginmodel.data!.token).then((value) {
                token=state.loginmodel.data!.token;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => shopLayout(),),
                        (route) => false);
                CacheHelper.saveData(key: 'isLogin', value: true);
              });

            } else
            {
              Fluttertoast.showToast(
                msg: state.loginmodel.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,

              );
            }
          }
        },

        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body:
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Register',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black,),),

                        SizedBox(height: 20.0,),

                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey,),
                        ),

                        SizedBox(height: 20.0,),

                        defaultFormField(
                          onsubmit: (value){},
                          ontap: (){},
                          validatointext: 'Name can not be empty',
                          showpasswordicon: (){},
                          onchanged: (value){},
                          controller: namecontroller,
                          type: TextInputType.name,
                          labeltext: 'Name',
                          prefix: Icons.person,
                        ),

                        SizedBox(height: 20.0,),


                        defaultFormField(
                          onsubmit: (value){},
                          ontap: (){},
                          validatointext: 'Phone can not be empty',
                          showpasswordicon: (){},
                          onchanged: (value){},
                          controller:phonecontroller ,
                          type: TextInputType.phone,
                          labeltext: 'Phone',
                          prefix: Icons.phone,
                        ),

                        SizedBox(height: 20.0,),

                        defaultFormField(
                          onsubmit: (value){},
                          ontap: (){},
                          validatointext: 'Email address can not be empty',
                          showpasswordicon: (){},
                          onchanged: (value){},
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          labeltext: 'Email',
                          prefix: Icons.email_outlined,
                        ),

                        SizedBox(height: 20.0,),

                        defaultFormField(
                          onsubmit: (value){

                          },
                          ontap: (){},
                          validatointext: 'Password can not be empty',
                          showpasswordicon: ()
                          {
                            shopRegisterCubit.get(context).showpassword();
                          },
                          onchanged: (value){},
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          labeltext: 'Password',
                          prefix: Icons.lock_outline,
                          ispassword: shopRegisterCubit.get(context).ispassword,
                          suffix: shopRegisterCubit.get(context).suffixIcon,
                        ),

                        SizedBox(height: 20.0,),

                        /// **************** Login Button start ****************
                        state is! shopRegisterLoadingState?
                        defaultButton(
                          function: (){
                            if(formkey.currentState!.validate())
                            {
                                 shopRegisterCubit.get(context).urlRegister(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                name: namecontroller.text,
                                phone: phonecontroller.text,
                              );
                            }
                          },
                          text: 'Login',
                          radius: 10.0,
                          isUpperCase: true,
                        ): Center(child: CircularProgressIndicator()),

                        /// **************** Login Button End ****************

                    /*
                        SizedBox(height: 20.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'nt have an account '),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => shopRegisterScreen(),));
                              },
                              child: Text('Register'),
                            ),
                          ],
                        ),*/

                      ],
                    ),
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

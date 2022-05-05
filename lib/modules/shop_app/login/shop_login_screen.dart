
import 'package:app2/layout/shop_app/shop_layout.dart';
import 'package:app2/modules/shop_app/login/cubit/cubit.dart';
import 'package:app2/modules/shop_app/login/cubit/states.dart';
import 'package:app2/modules/shop_app/register/register_screen.dart';
import 'package:app2/shared/components/components.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class  shopLoginScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  bool ispassword=true;
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (context) => shopLoginCubit(),
      child: BlocConsumer<shopLoginCubit,shopLoginState>(
        listener: (context, state)
        {
          if(state is shopLoginSuccessState)
          {
            if(state.loginmodel.status)
              {
                /*
                print(state.loginmodel.message);
                print(state.loginmodel.data?.token);

                 */
                /*Fluttertoast.showToast(
                    msg: state.loginmodel.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

                 */

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
                    key: formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black,),),

                        SizedBox(height: 20.0,),

                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey,),
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

                            if(formKey.currentState!.validate())
                            {
                                  shopLoginCubit.get(context).urlLogin(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text
                              );
                            }
                          },
                          ontap: (){},
                          validatointext: 'Password can not be empty',
                          showpasswordicon: ()
                          {
                            shopLoginCubit.get(context).showpassword();
                          },
                          onchanged: (value){},
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          labeltext: 'Password',
                          prefix: Icons.lock_outline,
                          ispassword: shopLoginCubit.get(context).ispassword,
                          suffix: shopLoginCubit.get(context).suffixIcon,
                        ),

                        SizedBox(height: 20.0,),

                        /// **************** Login Button start ****************
                        state is! shopLoginLoadingState?
                            defaultButton(
                              function: (){
                                if(formKey.currentState!.validate())
                                {
                                     shopLoginCubit.get(context).urlLogin(
                                     email: emailcontroller.text,
                                     password: passwordcontroller.text
                                 );
                                }
                              },
                              text: 'Login',
                              radius: 10.0,
                              isUpperCase: true,
                            ): Center(child: CircularProgressIndicator()),

                        /// **************** Login Button End ****************

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
                        ),

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

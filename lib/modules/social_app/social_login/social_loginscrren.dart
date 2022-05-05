import 'package:app2/layout/social_app/social_layout.dart';
import 'package:app2/modules/social_app/social_login/cubit/cubit.dart';
import 'package:app2/modules/social_app/social_login/cubit/states.dart';
import 'package:app2/modules/social_app/social_register/social_register_screen.dart';
import 'package:app2/shared/components/components.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class socialLoginScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  bool ispassword=true;
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => socialLoginCubit(),
      child: BlocConsumer<socialLoginCubit,socialLoginState>(
        listener: (context,state)
        {
          if(state is socialLoginErrorState)
            {
              Fluttertoast.showToast(
                msg: state.error,
                fontSize: 12.0,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                timeInSecForIosWeb: 5,
                gravity: ToastGravity.BOTTOM,
                toastLength: Toast.LENGTH_LONG
              );
            }
          if(state is socialLoginSuccessState)
          {
            CacheHelper.saveData(key: 'uId', value: state.uId ).then((value) {
              uId=state.uId;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => socialLayout(),),
                  (route) => false
              );
              CacheHelper.saveData(key: 'isLoginInSocialApp', value: true);
            }).catchError((onError)
            {
              print(onError.toString());
            });
            /*
            CacheHelper.saveData
              (
                key: 'uId',
                value: state.uId,
              ).then((value){

              Navigator.pushAndRemoveUntil
                (
                context,
                MaterialPageRoute(builder: (context) => socialLayout(),),
                (route) => true,
              );}).catchError((onError) {
              print(onError.toString());
            });*/
          }
        },
        builder:(context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
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
                          'Login now to communicate to your friends',
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
                          labeltext: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(height: 20.0,),
                        defaultFormField(
                          onsubmit: (value){
                            if(formKey.currentState!.validate())
                            {
                                socialLoginCubit.get(context).urlLogin(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);
                            }
                          },
                          ontap: (){},
                          validatointext: 'Password can not be empty',
                          showpasswordicon:()
                          {
                            socialLoginCubit.get(context).showpassword();
                          },
                          onchanged: (value){},
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          labeltext: 'Password',
                          prefix: Icons.lock_outline,
                          ispassword: socialLoginCubit.get(context).ispassword,
                          suffix: socialLoginCubit.get(context).suffixIcon,
                        ),
                        SizedBox(height: 20.0,),
                        /// **************** Login Button start ****************

                        state is! socialLoginLoadingState?
                        defaultButton(
                          function: (){
                            if(formKey.currentState!.validate())
                            {
                               socialLoginCubit.get(context).urlLogin(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);
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
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>socialRegisterScreen(),));
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
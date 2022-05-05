
import 'package:app2/layout/social_app/social_layout.dart';
import 'package:app2/modules/social_app/social_register/cubit/cubit.dart';
import 'package:app2/modules/social_app/social_register/cubit/states.dart';
import 'package:app2/shared/components/components.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class  socialRegisterScreen extends StatelessWidget {

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
      create: (context) => socialRegisterCubit(),
      child: BlocConsumer<socialRegisterCubit,socialRegisterState>(
        listener: (context, state)
        {
          if(state is socialCreateUserSuccessState)
          {
            CacheHelper.saveData(key: 'uId', value: state.uId ).then((value) {
              uId=state.uId;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => socialLayout(),),
                  (route) => false
              );
              CacheHelper.saveData(key: 'isLoginInSocialApp', value: true);
            }).catchError((onError) {
              print(onError.toString());
            });
            /*
            Navigator.pushAndRemoveUntil
              (
                context,
                MaterialPageRoute(builder: (context) => socialLayout(),),
                (route) => true,
              );*/
          }
        },

        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
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
                          'Register now to communicate to your friends',
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
                          labeltext: 'User Name',
                          prefix: Icons.person,
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
                          onsubmit: (value){},
                          ontap: (){},
                          validatointext: 'Password can not be empty',
                          showpasswordicon: ()
                          {
                            socialRegisterCubit.get(context).showpassword();
                          },
                          onchanged: (value){},
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          labeltext: 'Password',
                          prefix: Icons.lock_outline,
                          ispassword: socialRegisterCubit.get(context).ispassword,
                          suffix: socialRegisterCubit.get(context).suffixIcon,
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

                        /// **************** Login Button start ****************
                        state is! socialRegisterLoadingState?
                        defaultButton(
                          function: (){
                            if(formkey.currentState!.validate())
                            {
                               socialRegisterCubit.get(context).urlRegister(
                                 email: emailcontroller.text,
                                 password: passwordcontroller.text,
                                 name: namecontroller.text,
                                 phone: phonecontroller.text,
                              );
                            }
                          },
                          text: 'Register',
                          radius: 10.0,
                          isUpperCase: false,
                        ): Center(child: CircularProgressIndicator()),
                        /// **************** Login Button End ****************

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

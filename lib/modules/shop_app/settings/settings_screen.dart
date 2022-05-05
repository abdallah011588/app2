import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/states.dart';
import 'package:app2/modules/shop_app/login/shop_login_screen.dart';
import 'package:app2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {

   var emailcontroller=TextEditingController();
   var namecontroller=TextEditingController();
   var phonecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit,shopStates>(
      listener: (context, state) => {},
      builder: (context, state){
        //var model=shopCubit.get(context)!.usermodel;
/*
        emailcontroller.text=model.data!.email!;
        namecontroller.text=model.data!.name!;
        phonecontroller.text=model.data!.phone!;

 */

        return/* shopCubit.get(context)?.usermodel !=null ?*/Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                validatointext: 'Email can not be empty',
                showpasswordicon: (){},
                onchanged: (value){},
                controller: emailcontroller,
                type: TextInputType.emailAddress,
                labeltext: 'Email',
                prefix: Icons.email,
              ),

              SizedBox(height: 20.0,),
              defaultFormField(
                onsubmit: (value){},
                ontap: (){},
                validatointext: 'Phone can not be empty',
                showpasswordicon: (){},
                onchanged: (value){},
                controller: phonecontroller,
                type: TextInputType.phone,
                labeltext: 'Phone',
                prefix: Icons.phone,
              ),

              SizedBox(height: 20.0,),

              defaultButton(
                  function: (){
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) => shopLoginScreen(),),
                            (route) => false);
                  },
                  text: 'Log Out',
              ),
            ],
          ),
        )/*:Center(child: CircularProgressIndicator())  */;
      },
    );


  }
}

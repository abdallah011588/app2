import 'package:app2/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller= TextEditingController();

  var passwordcontroller= TextEditingController();

  var  formkey=GlobalKey<FormState>();

  bool pass=true;

  String? validate(String value)
  {

      if(value.isEmpty)
      {
        return 'hhhhhhhhhhhhhhhhhh';
      }
      else
        {
      return null;
    }
  }
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.login),
        title: Text('Login',),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 30.0,),
/*
                  TextFormField(
                    validator: ( value)
                    {
                      if(value!.isEmpty)
                        {
                          return 'Email can not be empty';
                        }
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email,),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value)
                    {
                      //value is the return value from the textformfield
                    //  print(value);

                    },
                    onChanged: (value)
                    {
                      //value is the return value from changing of the value of the textformfield
                    // print(value);
                    },

                  ),
*/

                defaultFormField(
                  showpasswordicon: (){},
                    controller: emailcontroller,
                    type: TextInputType.emailAddress,
                    labeltext: 'Email address',
                    prefix: Icons.email,
                    validatointext: 'Email can not be empty',
                //  function: (){},
                  onchanged: (){},
                  onsubmit: (){},
                  ontap: (){},
                ),



                  SizedBox(height: 15.0,),

                  /// //////////////////////////////////
/*
                  defaultTextformField(
                       function: (){},
                      labeltext: 'Email Address',
                      prefixicon:Icon( Icons.email,),
                      changelock: (){
                         setState(()
                         {
                           pass= !pass;
                         }); },
                      controller: emailcontroller,
                      ispassword: pass,
                      inputtype: TextInputType.emailAddress,
                    suffixicon: Icon(Icons.remove_red_eye),

                  ),
*/
                  /// /////////////////////////////
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///

                  defaultFormField(
                    ontap: (){},
                      onsubmit: (){},
                      validatointext: 'Password can not be empty',
                      onchanged: (){},
                      controller: passwordcontroller,
                      type: TextInputType.visiblePassword ,
                      labeltext: 'Password',
                      ispassword: pass,
                       prefix:Icons.lock ,
                      suffix:pass? Icon(Icons.visibility): Icon(Icons.visibility_off),
                    showpasswordicon: (){
                      setState(() {
                        pass=!pass;
                      });
                    },
                  ),

                 /* TextFormField(
                    validator: (value) {
                      if( value!.isEmpty)
                        {
                          return 'Password can not be empty';
                        }
                      return null;
                    },
                    controller: passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.lock,) ,
                      suffixIcon: Icon(Icons.remove_red_eye,),

                    ),
                  ),*/

                  SizedBox(height: 15.0,),

                defaultButton(
                  text: 'Login',
                  background: Colors.blue,
                  function: ()
                  {
                    if(formkey.currentState!.validate())
                      {
                        print('mmm');
                      }
                  },
                  isUpperCase: false,
                   // width: width,
                    radius: 10.0,


                ),

                //defaultButton(function: (){}, text: 'dddddd',isUpperCase: false,background: Colors.teal,radius: 15.0),


                /*  Container(
                    width: double.infinity,
                    decoration: BoxDecoration
                      (
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                    child: MaterialButton
                      (
                      height: 50.0,
                      onPressed: ()
                      {
                        //print('hhhhhh');

                      },
                      child: Text('Login',style:TextStyle(color: Colors.white,fontSize: 20.0,)),
                    ),
                  ),*/

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\' have an account '),
                      TextButton(onPressed: (){

                       // print(passwordcontroller.text);
                      },
                          child: Text('Register Now')),
                    ],
                  ),


                //  CircleAvatar( child: Icon(Icons.menu),),


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

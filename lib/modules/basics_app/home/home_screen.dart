
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(Icons.account_circle_rounded),
        title: Text('rrrr',),
      ),
      body:
        Center(
          child: Column(
            children: [

              Text('Login',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),),

              TextFormField(),
              TextFormField(),

              MaterialButton(onPressed: (){},child: Text('fff'),),

              Row(
                children: [
                  Text('ffffffffff',),
                  TextButton(onPressed: (){}, child: Text('Register Now')),
                ],
              ),
            ],

          ),
        ),

    );
  }

}
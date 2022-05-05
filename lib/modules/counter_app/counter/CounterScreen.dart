

import 'package:app2/modules/counter_app/counter/cubit/cubit.dart';
import 'package:app2/modules/counter_app/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(

      create: (context) => countercubit(),
      child: BlocConsumer<countercubit,counterstates>(
        listener:(context, state) => (){} ,
        builder:(context, state) =>   Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),

          body: Center(
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children:[

                Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: MaterialButton(
                      onPressed: ()
                      {
                        countercubit.grt(context).minus();
                      },
                      child: Text('Minus',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),)),

                SizedBox(width: 10.0,),
                Text('${countercubit.grt(context).counter}',style:TextStyle(fontSize: 40.0)),
                SizedBox(width: 10.0,),
                Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: MaterialButton(
                      onPressed: ()
                      {
                        countercubit.grt(context).plus();
                      },
                      child: Text('Plus',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),)),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

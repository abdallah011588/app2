import 'package:app2/shared/components/components.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/cubit/cubit.dart';
import 'package:app2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Donetasks extends StatelessWidget {
  //const Donetasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstates>(
      listener: (context, state) => (){},
       builder:(context, state) {
         return appcubit.get(context).donetasks.length>0? ListView.separated(
        itemBuilder: (context, index) =>itembuild(appcubit.get(context).donetasks[index],context) ,
       separatorBuilder:(context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(start: 20.0),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[400],
        ),
      ) ,
      itemCount:appcubit.get(context).donetasks.length ,
  ):Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Icon(Icons.assignment_late_outlined,size: 150.0,color: Colors.grey,),
               SizedBox(height: 15.0,),
               Text('No tasks ,add tasks',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             ],
           ),
         );
       },
    );
  }
}

import 'package:app2/layout/news_app/cubit.dart';
import 'package:app2/layout/news_app/states.dart';
import 'package:app2/shared/components/components.dart';
//import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 /*
 BlocProvider(
      //create: (context) => newsCubit()..getBusiness(),
      child:
  */
    return  BlocConsumer<newsCubit,newStates>(
        listener: (context, state) => (){},
        builder: (context, state)
        {

          var list=newsCubit().get(context).business;

          return  newsbuilder(list,context);



          /*ConditionalBuilder(
              condition: state is! newsLoadingState,
              builder:(context) =>  ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return newBuilder(list[index]);
                },
                separatorBuilder:(context,index)=> Separator(),
                itemCount: list.length,
              ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );*/

        },
     // ),
    );
  }
}

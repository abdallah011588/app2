import 'package:app2/layout/news_app/cubit.dart';
import 'package:app2/layout/news_app/states.dart';
import 'package:app2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /*
    BlocProvider(
      create: (context) => newsCubit()..getScience(),
      child:
     */
    return  BlocConsumer<newsCubit,newStates>(
        listener: (context, state) => (){
        },
        builder: (context, state) {

          var list=newsCubit().get(context).science;

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
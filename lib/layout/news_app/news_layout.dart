import 'package:app2/layout/news_app/cubit.dart';
import 'package:app2/layout/news_app/states.dart';
import 'package:app2/shared/cubit/cubit.dart';
import 'package:app2/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  //const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<newsCubit,newStates>(
      listener: (context, state) => (){},

      builder:(context, state) {

        var cubit=newsCubit().get(context);

        return  Scaffold(

          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => searchScreen(),)
                  );
                },
              ),

              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  appcubit.get(context).changeappMode();
              },),

            ],
          ),


          body:cubit.Screens[cubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items:cubit.bottomNavItems,
            onTap: (index) {
              cubit.changeScreen(index: index);
            },
          ),

        /*  floatingActionButton: FloatingActionButton(
            // v2/everything?
            // q=tesla&from=2022-01-13&sortBy=publishedAt&apiKey=API_KEY
            //65f7f556ec76449fa7dc7c0069f040ca
            onPressed: (){
              dioHelper.getData(
                  url: 'v2/top-headlines',
                  query:{
                    'country':'eg',
                    'category':'business',
                    'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
                  }
              ).then((value) {
                print(value.data.toString());
              }).catchError((error){
                print('${error.toString()} happened in getting data');
              });
              },

            child: Icon(Icons.add),

          ),*/
        );
      },
    );
  }
}

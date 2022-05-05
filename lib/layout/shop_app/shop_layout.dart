
import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/states.dart';
import 'package:app2/modules/news_app/search/search_screen.dart';
import 'package:app2/modules/shop_app/login/shop_login_screen.dart';
import 'package:app2/modules/shop_app/search/shopsearch.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shopLayout  extends StatelessWidget {
  const shopLayout ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<shopCubit,shopStates>(
      listener: (context, state){},
      builder:(context, state) {
        var shopcubit=shopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => shopSearch(),));
                  },
                  icon: Icon(Icons.search),
              ),
            ],
          ),
          body:shopcubit.screens[shopcubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Product'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: shopcubit.currentIndex,
            onTap: (value){
              shopcubit.changeBottomNavIndex(value);
            },
          ),
        );
      },
    );

    /*
     TextButton(
              child: Text('SIGN OUT'),
              onPressed: (){
                CacheHelper.removeData(key: 'isLogin').then((value) {
                  if(value)
                  {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => shopLoginScreen(),),
                            (route) => false);
                  }
                });

              },
            )
     */
  }
}

import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/states.dart';
import 'package:app2/models/shop_app/favorites_model.dart';
import 'package:app2/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shop_app/cubit/cubit.dart';
class favoritesScreen extends StatelessWidget {
  const favoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit,shopStates>(
      listener: (context, state) => (){},
          builder:(context, state) {
        return state is! shopLoadingGetFavoritesState ? ListView.separated( //
            itemBuilder: (context, index) =>favoritesitembuilder(shopCubit.get(context).favoritesmodel?.data.data[index].product,context),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(width: double.infinity,height: 1,color: Colors.grey,),
            ),
            itemCount: 2,//shopCubit.get(context).favoritesmodel?.data.data.length,
          ):Center(child: CircularProgressIndicator());
      }

    );
  }
}



Widget favoritesitembuilder(dynamic favorite,context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 120.0,
      height: 120.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('https://assets-global.website-files.com/6005fac27a49a9cd477afb63/60576840e7d265198541a372_bavassano_homepage_gp.jpg'),
                width: 120.0,
                height: 120.0,
              ),
              if(favorite.discount !=0) Container(
                color: Colors.green,
                padding: EdgeInsets.all( 3.0,),
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${favorite.product.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.0,height: 1.3),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${favorite.price!}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0,color: defaultColor,),
                    ),
                    SizedBox(width: 5.0,),
                    if(favorite.discount !=0) Text(
                      '${favorite.oldPrice!}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10.0,color: Colors.grey,decoration: TextDecoration.lineThrough),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                         shopCubit.get(context).changeFavorites(favorite.id!);
                        //print(product.id);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: shopCubit.get(context).favorites[favorite.id]! ? Colors.blue:Colors.grey[400],
                        child: Icon(
                          Icons.favorite_border,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
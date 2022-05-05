
import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/states.dart';
import 'package:app2/models/shop_app/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class categoriesScreen extends StatelessWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit,shopStates>(
      listener: (context, state) => (){},
      builder:(context, state) {
        return ListView.separated(
          //physics: BouncingScrollPhysics(),
          itemBuilder:(context, index) => categoryItemBuilder(shopCubit.get(context).categorymodel.data!.data![index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Container(width: double.infinity,height: 1,color: Colors.grey,),
          ),
          itemCount: shopCubit.get(context).categorymodel.data!.data!.length,
        );
      },
    );
  }
}

//'https://assets-global.website-files.com/6005fac27a49a9cd477afb63/60576840e7d265198541a372_bavassano_homepage_gp.jpg'),

Widget categoryItemBuilder(dataModel model)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(children: [
    Image(
      image: NetworkImage( model.image!),
     width: 80.0,
      height: 80.0,
      fit:BoxFit.cover,
    ),
    SizedBox(width: 20.0,),
    Text(model.name!,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
    Spacer(),
    Icon(Icons.arrow_forward_ios),
  ],),
);

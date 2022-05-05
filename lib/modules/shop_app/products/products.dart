import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/states.dart';
import 'package:app2/models/shop_app/categories_model.dart';
import 'package:app2/models/shop_app/home_model.dart';
import 'package:app2/shared/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class productsScreen extends StatelessWidget {
  const productsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {

    return  BlocConsumer<shopCubit,shopStates>(

        listener: (context, state) {},
        builder:(context,state){
          var shopcubit = shopCubit.get(context);
          return  shopcubit.homemodel==null && shopcubit.categorymodel !=null?
          Center(child: CircularProgressIndicator()):productsItemBuilder( shopcubit.homemodel,shopcubit.categorymodel,context);

        });
  }
}



 Widget productsItemBuilder(homeModel model,categoriesModel categoriesmodel,context)=>SingleChildScrollView(
   physics: BouncingScrollPhysics(),
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
              items: model.data?.banners?.map( (e) =>Image(
              image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            )).toList(),
               options: CarouselOptions(
                 height: 250.0,
                 initialPage: 0,
                 enableInfiniteScroll: true,
                 reverse: false,
                 autoPlay: true,
                 autoPlayInterval: Duration(seconds: 3,),
                 autoPlayAnimationDuration: Duration(seconds: 1,),
                 autoPlayCurve: Curves.fastOutSlowIn,
                 scrollDirection: Axis.horizontal,
                 viewportFraction: 1.0,
               ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 100.0,
                child: ListView.separated(
                    itemBuilder: (context, index) => categoryItem(categoriesmodel.data!.data![index]),
                    separatorBuilder:(context,index)=> SizedBox(width: 10.0,),
                    itemCount: categoriesmodel.data!.data!.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    //shrinkWrap: true,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'New Products',
                style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0,),
        Container(
          color: Colors.white,
          child: GridView.count(
            physics:NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1/1.75,

            crossAxisCount: 2,
            children: List.generate(
                model.data!.products!.length,
                (index) =>gridViewItem(model.data!.products![index],context),
            ),
          ),
        ),
      ],
    ),
 );


Widget gridViewItem(productsModel product,context)
{
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(product.image),
              width: double.infinity,
              height: 200.0,
            ),
            if(product.discount !=0) Container(
              color: Colors.green,
              padding: EdgeInsets.all( 3.0,),
              child: Text(
                'DISCOUNT',
                 style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${product.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14.0,height: 1.3),
              ),
               Row(
                children: [
                  Text(
                    '${product.price.round()}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.0,color: defaultColor,),
                  ),
                  SizedBox(width: 5.0,),
                  if(product.discount !=0) Text(
                    '${product.oldPrice.round()}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10.0,color: Colors.grey,decoration: TextDecoration.lineThrough),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      shopCubit.get(context).changeFavorites(product.id);
                      print(product.id);
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: shopCubit.get(context).favorites[product.id]! ? Colors.blue:Colors.grey[400],
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
  );
}


Widget categoryItem(dataModel data)=> Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(
      image: NetworkImage('${data.image}'),
      height: 100.0,width: 100.0,
      fit: BoxFit.cover,
    ),
    Container(
        color: Colors.black.withOpacity(0.7),
        width: 100.0,
        child: Text('${data.name}',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        )
    ),
  ],
);


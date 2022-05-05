
import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/layout/shop_app/cubit/states.dart';
import 'package:app2/modules/shop_app/favorites/favorites.dart';
import 'package:app2/modules/shop_app/search/cubit/cubit.dart';
import 'package:app2/modules/shop_app/search/cubit/states.dart';
import 'package:app2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class shopSearch extends StatelessWidget {

  var  searchcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context, state) => {},
        builder:(context, state) {
          return Scaffold(
            appBar: AppBar(),
            body:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormField(
                    onsubmit: (value){
                      SearchCubit.get(context).search(value.toString());
                      print(value.toString());
                    },
                    ontap: (){},
                    validatointext: 'Can\'t be empty',
                    showpasswordicon: (){},
                    onchanged: (value){},
                    controller: searchcontroller,
                    type: TextInputType.text,
                    labeltext: 'Search',
                    prefix: Icons.search,
                  ),
                  SizedBox(height: 10.0,),
                  if (state is SearchLoadingState)
                  LinearProgressIndicator(),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>listProductItemBuilder(SearchCubit.get(context).model.data.data[index],context,isOldPrice: false),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsetsDirectional.only(start: 20.0),
                          child: Container(width: double.infinity,height: 1,color: Colors.grey,),
                        ),
                        itemCount: SearchCubit.get(context).model.data.data.length,
                      ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

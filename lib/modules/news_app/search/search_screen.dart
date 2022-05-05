import 'package:app2/layout/news_app/cubit.dart';
import 'package:app2/layout/news_app/states.dart';
import 'package:app2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class searchScreen extends StatelessWidget {
  //const searchScreen({Key? key}) : super(key: key);


  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<newsCubit,newStates>(
      listener: (context, state) => (){},
      builder: (context, state) {
        var searchList= newsCubit().get(context).search;
        return Scaffold(

          appBar: AppBar(),
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  onchanged: (value){
                    newsCubit().get(context).getSearch(value);
                  },
                  onsubmit: (){},
                  ontap: (){},
                  validatointext: 'Can not be empty',
                  showpasswordicon: (){},
                  controller: searchController,
                  type: TextInputType.text,
                  labeltext: 'Search',
                  prefix: Icons.search,
                ),
              ),

              Expanded(
                  child: newsbuilder(
                      searchList,
                      context,
                    isSearch: true,
                  ),
              ),
            ],
          ),
        );
      },
    );
  }
}

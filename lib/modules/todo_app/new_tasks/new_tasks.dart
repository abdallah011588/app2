import 'package:app2/shared/components/components.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/cubit/cubit.dart';
import 'package:app2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Newtasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   return BlocConsumer<appcubit,appstates>(
     listener: (context, state) => (){},
     builder: (context, state) {

       return tasksbuilder(task: appcubit.get(context).newtasks);
     },
   );

  }
}


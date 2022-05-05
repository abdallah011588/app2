import 'package:app2/modules/counter_app/counter/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class countercubit extends Cubit<counterstates>{

  countercubit() : super(counterinitialstate());


  int counter=0;

  static countercubit grt(context)
  {
    return BlocProvider.of(context);
  }
  void minus()
  {
    counter--;
    emit(counterminusstate());
  }

  void plus()
  {

    counter++;
    emit(counterminusstate());

  }
}
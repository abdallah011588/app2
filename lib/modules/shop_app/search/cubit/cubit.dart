import 'package:app2/models/shop_app/search_model.dart';
import 'package:app2/modules/shop_app/search/cubit/states.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:app2/shared/network/end_point.dart';
import 'package:app2/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context)=>BlocProvider.of(context);

  late searchModel model;
  void search(String text)
  {
    emit(SearchLoadingState());
    dioHelper.posData(
        url: SEARCH,
        token:token,
        data:
        {
          'text':text,
        }).then((value)
    {
      model=searchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SearchErrorState());
    });
  }


}

import 'package:app2/models/shop_app/login_model.dart';
import 'package:app2/modules/shop_app/register/cubit/states.dart';
import 'package:app2/shared/network/end_point.dart';
import 'package:app2/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shopRegisterCubit extends Cubit<shopRegisterState>{

  shopRegisterCubit():super(shopRegisterInitialState());

  static shopRegisterCubit get(context)=>BlocProvider.of(context);

  Icon  suffixIcon=Icon(Icons.remove_red_eye_outlined);
  bool ispassword=true;

   shopLoginModel ? loginmodel;
  void showpassword()
  {
    ispassword=!ispassword;

    ispassword?suffixIcon= Icon(Icons.remove_red_eye_outlined):suffixIcon=Icon(Icons.visibility_off_outlined);
      emit(showRegisterpasswordState());

  }
  void urlRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  })
  {
    emit(shopRegisterLoadingState());
    dioHelper.posData(
        url: REGISTER,
        data: {
          'name':'$name',
          'email':'$email',
          'phone':'$phone',
          'password':'$password',

        },).then((value) {

      loginmodel = shopLoginModel.fromJson(value.data);
      print(loginmodel?.data?.phone);
      emit(shopRegisterSuccessState(loginmodel!));

      // print(loginmodel?.data.phone);
      // print(loginmodel?.data.token);
      //  print(value.data);

    }).catchError((error){
      print(error.toString());

      emit(shopRegisterErrorState(error.toString()));
    });
  }


}
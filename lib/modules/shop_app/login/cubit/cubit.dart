
import 'package:app2/models/shop_app/login_model.dart';
import 'package:app2/modules/shop_app/login/cubit/states.dart';
import 'package:app2/shared/network/end_point.dart';
import 'package:app2/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shopLoginCubit extends Cubit<shopLoginState>{

  shopLoginCubit():super(shopLoginInitialState());

  static shopLoginCubit get(context)=>BlocProvider.of(context);

  Icon  suffixIcon=Icon(Icons.remove_red_eye_outlined);
  bool ispassword=true;

  late shopLoginModel  loginmodel;
  void showpassword()
  {
    ispassword=!ispassword;

    ispassword?suffixIcon= Icon(Icons.remove_red_eye_outlined):suffixIcon=Icon(Icons.visibility_off_outlined);
      emit(showpasswordState());

  }
  void urlLogin({
    required String email,
    required String password,
  })
  {
    emit(shopLoginLoadingState());
    dioHelper.posData(
        url: LOGIN,
        data: {
          'email':'$email',
          'password':'$password',
        },).then((value) {

      loginmodel = shopLoginModel.fromJson(value.data);
      emit(shopLoginSuccessState(loginmodel));

      // print(loginmodel?.data.phone);
      // print(loginmodel?.data.token);
      //  print(value.data);

    }).catchError((error){
      emit(shopLoginErrorState(error.toString()));
    });
  }


}

import 'package:app2/modules/social_app/social_login/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class socialLoginCubit extends Cubit<socialLoginState>{

  socialLoginCubit():super(socialLoginInitialState());
  static socialLoginCubit get(context)=>BlocProvider.of(context);

  Icon suffixIcon=Icon(Icons.remove_red_eye_outlined);
  bool ispassword=true;

  void showpassword()
  {
    ispassword=!ispassword;
    ispassword?suffixIcon= Icon(Icons.remove_red_eye_outlined):suffixIcon=Icon(Icons.visibility_off_outlined);
    emit(showpasswordState());
  }


// late socialLoginModel  loginmodel;
  void urlLogin({
    required String email,
    required String password,
  })
  {
    emit(socialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
      print(value.user!.uid);
      print(value.user!.email);
      emit(socialLoginSuccessState(value.user!.uid));
    }).catchError((onError){
      emit(socialLoginErrorState(onError.toString()));
    });
   /* dioHelper.posData(
        url: LOGIN,
        data: {
          'email':'$email',
          'password':'$password',
        },).then((value) {
      loginmodel = socialLoginModel.fromJson(value.data);
      emit(socialLoginSuccessState(loginmodel));
      // print(loginmodel?.data.phone);
      // print(loginmodel?.data.token);
      //  print(value.data);
    }).catchError((error){
      emit(socialLoginErrorState(error.toString()));
    });*/
  }

}
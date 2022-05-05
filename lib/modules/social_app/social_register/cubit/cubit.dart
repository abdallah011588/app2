
import 'package:app2/models/social_app/social_user_model.dart';
import 'package:app2/modules/social_app/social_register/cubit/states.dart';
import 'package:app2/shared/network/end_point.dart';
import 'package:app2/shared/network/remote/dio_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class socialRegisterCubit extends Cubit<socialRegisterState>
{
  socialRegisterCubit():super(socialRegisterInitialState());
  static socialRegisterCubit get(context)=>BlocProvider.of(context);

  Icon  suffixIcon=Icon(Icons.remove_red_eye_outlined);
  bool ispassword=true;

  void showpassword()
  {
    ispassword=!ispassword;
    ispassword?suffixIcon= Icon(Icons.remove_red_eye_outlined):suffixIcon=Icon(Icons.visibility_off_outlined);
    emit(showRegisterpasswordState());
  }



  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
    //required String image,

  }) {
    socialUserModel model=socialUserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        bio: 'write your bio ...',
        cover: 'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1647347030~exp=1647347630~hmac=25ba8726740b9e357adf91054b1673e062ffaee9f1e17c864807bf6edf9beca7&w=740',
        image: 'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1647347030~exp=1647347630~hmac=25ba8726740b9e357adf91054b1673e062ffaee9f1e17c864807bf6edf9beca7&w=740',
        IsEmailVerified: false,
    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value)
    {
      emit(socialCreateUserSuccessState(uId));
    }).catchError((error){
      emit(socialCreateUserErrorState(error.toString()));
    });
  }



  void urlRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(socialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)
    {
      //print(value.user!.uid);
      //print(value.user!.email);
      userCreate(name: name, email: email, phone: phone, uId: value.user!.uid);
     // emit(socialRegisterSuccessState());
    }).catchError((onError){
      emit(socialRegisterErrorState(onError.toString()));
    });



    /* dioHelper.posData(
        url: REGISTER,
        data: {
          'name':'$name',
          'email':'$email',
          'phone':'$phone',
          'password':'$password',

        },).then((value) {

      loginmodel = socialLoginModel.fromJson(value.data);
      print(loginmodel?.data?.phone);
      emit(socialRegisterSuccessState(loginmodel!));

      // print(loginmodel?.data.phone);
      // print(loginmodel?.data.token);
      //  print(value.data);

    }).catchError((error){
      print(error.toString());

      emit(socialRegisterErrorState(error.toString()));
    });*/
  }

}
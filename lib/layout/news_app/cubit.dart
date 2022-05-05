
import 'package:app2/layout/news_app/states.dart';

import 'package:app2/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/business/business_screen.dart';
import '../../modules/news_app/science/science_screen.dart';
import '../../modules/news_app/sports/sports_screen.dart';

class newsCubit extends Cubit<newStates>{
  newsCubit():super(newsInitialState());

  newsCubit get(context)=>BlocProvider.of(context);


  List<Widget> Screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  int currentIndex=0;

  List<BottomNavigationBarItem> bottomNavItems= [
            BottomNavigationBarItem(icon: Icon(Icons.business),label:'Business'),
            BottomNavigationBarItem(icon: Icon(Icons.sports),label:'Sports'),
            BottomNavigationBarItem(icon: Icon(Icons.science),label:'Science'),
  ];

//http://newsapi.org/v2/top-headlines?country=eg&apiKey=65f7f556ec76449fa7dc7c0069f040ca
                                                     // 65f7f556ec76449fa7dc7c0069f040ca


  void changeScreen({required int index})
  {
    currentIndex=index;
    emit(bottomNavState());

    //if(index==1) getSports();
    //if(index==2) getScience();
  }

/// ************ business ****************
  List<dynamic> business=[];

  void getBusiness()
  {
    emit(newsLoadingState());
      dioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country': 'eg',
            'category': 'business',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
          }
      ).then((value) {
        business=value.data['articles'];
       // print(business[0]['title']);
        emit(newsGetBusinessSuccessState());
      }).catchError((error){
        emit(newsGetBusinessErrorState(error.toString()));
        print('${error.toString()} happened in getting data');
      });


  }


  /// ************ sports ****************
  List<dynamic> sports=[];

  void getSports()
  {

    emit(newsLoadingState());

    //if(sports.length==0){
      dioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country': 'eg',
            'category': 'sports',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',

          }
      ).then((value) {
        sports=value.data['articles'];
       // print(sports[0]['title']);
        emit(newsGetSportsSuccessState());
      }).catchError((error){
        emit(newsGetSportsErrorState(error.toString()));
        print('${error.toString()} happened in getting data');
      });
   // }
    //else {
    //  emit(newsGetSportsSuccessState());

  //  }


  }

  /// ************ science ****************
  List<dynamic> science=[];

  void getScience()
  {
    emit(newsLoadingState());
    //if(science.length==0){
      dioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country': 'eg',
            'category': 'science',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',

          }
      ).then((value) {
        science=value.data['articles'];
     //   print(science[0]['title']);
        emit(newsGetScienceSuccessState());
      }).catchError((error){
        emit(newsGetScienceErrorState(error.toString()));
        print('${error.toString()} happened in getting data');
      });
   // }
   // else {
   //   emit(newsGetScienceSuccessState());

   // }

  }

  /// ************ search ****************
  List<dynamic> search=[];

  void getSearch(String value)
  {
    emit(newsLoadingState());
   // search=[];
    dioHelper.getData(
      url: 'v2/everything',
      query: {
      'q':'$value',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      search=value.data['articles'];
      emit(newsGetsearchSuccessState());
    }).catchError((Error){
      emit(newsGetsearchErrorState(Error.toString()));
    });
  }
}
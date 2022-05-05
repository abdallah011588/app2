import 'package:app2/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';



/// ************* Dark Theme ********************

ThemeData darktheme=ThemeData(

  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,

  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor:  HexColor('333739'),
    elevation: 0.0,

    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    ),

    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),

    iconTheme: IconThemeData(
      color: Colors.white,
    ),

  ),
  /*floatingActionButtonTheme:  FloatingActionButtonThemeData(

              backgroundColor: Colors.deepOrange,
            ),*/

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey[400],
    selectedItemColor: Colors.orange[400],
    elevation: 20.0,
  ),

  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        color: Colors.white
    ),
    subtitle1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15.0,
        color: Colors.black,
      height: 1.3,
    ),

  ),
);

ThemeData lighttheme=ThemeData(

  scaffoldBackgroundColor: Colors.white,
  primarySwatch: defaultColor,

  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey[800],
    selectedItemColor: Colors.orange[400],
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        color: Colors.black
    ),
    subtitle1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15.0,
        color: Colors.black,
      height: 1.3,
    ),
  ),

);
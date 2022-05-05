


import 'package:app2/modules/shop_app/login/shop_login_screen.dart';
import 'package:app2/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'isLogin').then((value) {
    if(value)
    {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => shopLoginScreen(),),
              (route) => false);
    }
  });
}


void printFullText(String text)
{
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));
}



String token='';

String uId='';

















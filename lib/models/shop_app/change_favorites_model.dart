import 'package:flutter/material.dart';
class  changeFavoritesModel
{
  late bool  status;
  late String  message;
  changeFavoritesModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
  }
}
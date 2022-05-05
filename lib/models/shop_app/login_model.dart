
import 'dart:convert';

class shopLoginModel{

   late bool status;
   late String message;
     userData?  data;

  shopLoginModel.fromJson(Map <String,dynamic> json)
  {

    status=json['status'];
    message=json['message'];

    data= (json['data'] !=null ? userData?.fromJson(json['data']) : null)!;
  }
}

class userData
{
late   int id;
late   String name,email,phone,image,token;
late int points,credit;

  /*
  userData({
    this.id,
    this.name,
    this.email,
    this.image,
    this.token,
    this.credit,
    this.phone,
    this.points,
});

   */

  /// ******** Named Constructor *********

  userData.fromJson(Map<String,dynamic> json)
  {

    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    token=json['token'];
    credit=json['credit'];
    points=json['points'];

  }


}
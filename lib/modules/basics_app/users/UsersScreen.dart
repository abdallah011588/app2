import 'package:app2/models/user/user_model.dart';
import 'package:flutter/material.dart';


class UsersScreen extends StatelessWidget {
 // const UsersScreen({Key? key}) : super(key: key);

  List<UserModel> users=
  [
    UserModel(id: 1, name: 'Ali Ibrahim', phone: '+01158861697'),
    UserModel(id: 2, name: 'Abdallah Ibrahim', phone: '+01158861697'),
    UserModel(id: 3, name: 'Abdallah Ali', phone: '+01158861697'),
    UserModel(id: 4, name: 'Noor Ibrahim', phone: '+01158861697'),
    UserModel(id: 5, name: 'Saleh Ibrahim', phone: '+01158861697'),
    UserModel(id: 6, name: 'Abdo Ibrahim', phone: '+01158861697'),
    UserModel(id: 7, name: 'Abdallah Ibrahim', phone: '+01158861697'),
    UserModel(id: 8, name: 'Abdallah Ibrahim', phone: '+01158861697'),
    UserModel(id: 9, name: 'Abdallah Ibrahim', phone: '+01158861697'),
    UserModel(id: 10, name: 'Abdallah Ibrahim', phone: '+01158861697'),

  ];

  @override
  Widget build(BuildContext context)
  {
   return Scaffold(

     appBar: AppBar(
       title:Text('Users'),
     ),

     body: ListView.separated
       (
         itemBuilder: (context, index) => builditem(users[index]),
         separatorBuilder:(context ,index)=>Padding(
           padding: const EdgeInsetsDirectional.only(start: 20.0),
           child: Container(color: Colors.grey[400],width: double.infinity,height: 1.0,),
         ),
         itemCount: users.length,
     ),

);
  }
/////////////////////////////////////////////////////////////////////////////////////////////////

  Widget builditem (UserModel users)=>Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30.0,
          child: Text('${users.id}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          backgroundColor: Colors.blue,
        ),

        SizedBox(width: 10.0,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${users.name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 5.0,),
            Text('${users.phone}',style: TextStyle(fontSize: 15.0,color: Colors.grey),),
          ],
        ),
      ],

    ),
  );
}

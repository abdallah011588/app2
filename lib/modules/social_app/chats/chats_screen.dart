
import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:app2/models/social_app/social_user_model.dart';
import 'package:app2/modules/social_app/show_chat/show_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class socialChatsScreeen extends StatelessWidget {
  const socialChatsScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialCubit,socialStates>(
        listener: (context, state) {},
        builder:(context, state) {
          return socialCubit.get(context).users.length>0? ListView.separated(
              itemBuilder: (context, index) => chatItem(socialCubit.get(context).users[index],context),
              separatorBuilder:(context, index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.white,
              ),
              itemCount: socialCubit.get(context).users.length,
              physics: BouncingScrollPhysics(),
          ):Center(child: CircularProgressIndicator());
        });
  }
}

Widget chatItem(socialUserModel user,context)
{
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius:25.0,
            backgroundImage:NetworkImage('${user.image}'),
          ),
          SizedBox(width:15.0),
          Text('${user.name}'),
        ],
      ),
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => socialShowChatScreeen(usermodel: user),));
    },
  );
}








//https://img.freepik.com/free
// -photo/wonderful-girl-with-wavy-hair-modern-plaid-light-clothes-h
// olding-pink-flowers-looking-into-camera-isolated-background_197531-28770.jpg?t=st=1647267
// 054~exp=1647267654~hmac=96dd027b81329f2d6a078a45bb6b1890399269dca827c323375e0e0279475a9a&w=740
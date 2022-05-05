

import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:app2/models/social_app/message_model.dart';
import 'package:app2/models/social_app/social_user_model.dart';
import 'package:app2/modules/social_app/edit_image_message/edit_image_message_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class socialShowChatScreeen extends StatelessWidget {
  //const socialShowChatScreeen({Key? key}) : super(key: key);


  var messagecontroller=TextEditingController();

  socialUserModel usermodel;
  socialShowChatScreeen({
    required this.usermodel,
    });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context)
      {
        socialCubit.get(context).getMessages(receiverId: usermodel.uId);
        return BlocConsumer<socialCubit,socialStates>(

            listener: (context, state) {},
            builder:(context, state)
            {
              return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius:25.0,
                        backgroundImage:NetworkImage('${usermodel.image}'),
                      ),
                      SizedBox(width:15.0),
                      Text('${usermodel.name}'),
                    ],
                  ),
                ) ,
                body:socialCubit.get(context).messages.length> 0 ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(

                          physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index)
                            {
                              var message=socialCubit.get(context).messages[index];

                              if(socialCubit.get(context).user_model.uId==message.senderId)
                                return senderMessageItem(message);
                              else
                                return receiverMessageItem(message);
                            },
                            separatorBuilder: (context, index)=>SizedBox(height: 5.0,),
                            itemCount:socialCubit.get(context).messages.length,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadiusDirectional.circular(15.0),
                              ),
                              child:Padding(
                                padding: const EdgeInsetsDirectional.only(start: 8.0),
                                child: TextFormField(
                                  controller: messagecontroller,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: (){
                                        socialCubit.get(context).getMessageImage();
                                        // if(socialCubit.get(context).MessageImage==null)
                                        //   {
                                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => socialEditImageScreeen(image: socialCubit.get(context).MessageImage!,)));
                                        //  }
                                      },
                                      child: Icon(Icons.add_a_photo_outlined,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Type your message...',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            height: 50.0,
                            child: MaterialButton(
                              child: Icon(Icons.send_outlined,color: Colors.white,),
                              onPressed: (){
                                    if(socialCubit.get(context).MessageImage==null)
                                    {
                                      if(messagecontroller.text !='')
                                        socialCubit.get(context).sendMessage(
                                        receiverId: usermodel.uId,
                                        dateTime: DateTime.now().toString(),
                                        text: messagecontroller.text,
                                        messageImage: '',
                                      );
                                    }
                                    else
                                    {
                                      socialCubit.get(context).uploadMessageImage(
                                        receiverId: usermodel.uId,
                                        text: '',
                                        dateTime: DateTime.now().toString(),
                                      );
                                      socialCubit.get(context).removeMessageImage();
                                    }


                                  /// ///////////
                                // socialCubit.get(context).sendMessage(
                                //     receiverId: usermodel.uId,
                                //     dateTime: DateTime.now().toString(),
                                //     text: messagecontroller.text,
                                //   messageImage: '',
                                // );
                                messagecontroller.text='';
                              },
                            ),
                        )
                        ],
                      ),
                    ],
                  ),
                ) :
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      Image(image: NetworkImage('https://img.freepik.com/free-vector/cartoon-tiny-people-having-international-communication-online-flat-illustration_74855-16818.jpg?t=st=1648543394~exp=1648543994~hmac=a9ce6e4e938fed3d40bb7602c2c522f7cce678f3030759c4804dfd269cf1cd9d&w=740')),
                     SizedBox(height: 10.0,),
                      Text('Chat with friends'),
                       Spacer(),
                      // Expanded(
                      //   child: ListView.separated(
                      //
                      //     physics: BouncingScrollPhysics(),
                      //     itemBuilder: (context, index)
                      //     {
                      //       var message=socialCubit.get(context).messages[index];
                      //
                      //       if(socialCubit.get(context).user_model.uId==message.senderId)
                      //         return senderMessageItem(message);
                      //       else
                      //         return receiverMessageItem(message);
                      //     },
                      //     separatorBuilder: (context, index)=>SizedBox(height: 5.0,),
                      //     itemCount:socialCubit.get(context).messages.length,
                      //   ),
                      // ),
                      //Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadiusDirectional.circular(15.0),
                              ),
                              child:Padding(
                                padding: const EdgeInsetsDirectional.only(start: 8.0),
                                child: TextFormField(
                                  controller: messagecontroller,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: (){
                                        socialCubit.get(context).getMessageImage();
                                      },
                                      child: Icon(Icons.add_a_photo_outlined,
                                      color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Type your message...',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            height: 50.0,
                            child: MaterialButton(
                              child: Icon(Icons.send_outlined,color: Colors.white,),
                              onPressed: (){
                                if(messagecontroller.text !='') {
                                  if (socialCubit.get(context).MessageImage == null)
                                  {
                                    socialCubit.get(context).sendMessage(
                                      receiverId: usermodel.uId,
                                      dateTime: DateTime.now().toString(),
                                      text: messagecontroller.text,
                                      messageImage: '',
                                    );
                                  }
                                  else
                                  {
                                    socialCubit.get(context).uploadMessageImage(
                                      receiverId: usermodel.uId,
                                      text: '',
                                      dateTime: DateTime.now().toString(),
                                    );
                                  }
                                }

                                messagecontroller.text='';

                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

              );
            });
      }
    );
  }
}

Widget senderMessageItem(messageModel message)
{
  return  Align(
    alignment: AlignmentDirectional.centerEnd,
    child:message.messageImage==''||message.messageImage==null? Container(
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadiusDirectional.only(
            topStart:Radius.circular(10.0) ,
            bottomStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        child: Text('${message.text}')):
    Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadiusDirectional.only(
            topStart:Radius.circular(10.0) ,
            bottomStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        child:Image(image: NetworkImage('${message.messageImage}')
        ),
    ),





  );
}


Widget receiverMessageItem(messageModel message)
{
  return  Align(
    alignment: AlignmentDirectional.centerStart,
    child:message.messageImage==''||message.messageImage==null? Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            topStart:Radius.circular(10.0) ,
            bottomEnd: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        child: Text('${message.text}')):Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            topStart:Radius.circular(10.0) ,
            bottomEnd: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        child: Image(image: NetworkImage('${message.messageImage}')),),
  );
}






// https://img.freepik.com/free-photo/wonderful-girl-with-wavy-hair-modern-plaid-light-clothes-h olding-pink-flowers-looking-into-camera-isolated-background_197531-28770.jpg?t=st=1647267 054~exp=1647267654~hmac=96dd027b81329f2d6a078a45bb6b1890399269dca827c323375e0e0279475a9a&w=740
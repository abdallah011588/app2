import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:app2/modules/social_app/new_post/new_post_screen.dart';
import 'package:app2/modules/social_app/social_login/social_loginscrren.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class socialLayout extends StatelessWidget {
  const socialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialCubit,socialStates>(
      listener: (context, state) {
        if(state is socialNewsPostState)
          {
            Navigator.push(context, MaterialPageRoute(builder:(context) => socialNewPostScreeen(),));
          }

      },
      builder : (context, state){
          //var model=socialCubit.get(context).model;

        var cubit=socialCubit.get(context);
          return Scaffold(
            appBar:AppBar(
              title:cubit.titles[cubit.currentIndex],
              actions: [
                IconButton(onPressed: (){}, icon:Icon( Icons.notifications_none_outlined)),
                IconButton(onPressed: (){}, icon:Icon( Icons.search)),
              ],
            ),

            body:cubit.screens[cubit.currentIndex] ,
            /*Column(
              children: [
                 /* if(!FirebaseAuth.instance.currentUser!.emailVerified) Container(
                 width: double.infinity,
                 height: 50.0,
                 color: Colors.amber.withOpacity(0.6),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                   child: Row(
                     children: [
                       Icon(Icons.info_outline),
                       SizedBox(width: 15.0,),
                       Expanded(child: Text('Please verify your email')),
                       SizedBox(width: 10.0,),
                       TextButton(onPressed: () {

                         FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value) {
                           Fluttertoast.showToast(
                               msg: 'Check your mail',
                               toastLength: Toast.LENGTH_LONG,
                             timeInSecForIosWeb: 5,
                             gravity: ToastGravity.BOTTOM,
                             backgroundColor: Colors.green,
                             textColor: Colors.white,
                           );
                         }).catchError((onError){
                           print(onError.toString());
                         });
                       },
                       child: Text('Verify')),

                     ],),
                 ),
               ),
                Spacer(),*/

                TextButton(onPressed: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>socialLoginScreen()));
                }, child: Text('log out')),
              ],
            )*/
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.chat_rounded),label: 'Chats'),
                BottomNavigationBarItem(icon: Icon(Icons.note_add_outlined),label: 'Add Post'),
                BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp),label: 'Users'),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
              ],
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },
              currentIndex:cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
    );
  }
}





























//socialCubit.get(context).model !=null
/*

Container(
                  width: double.infinity,
                  height: 50.0,
                  color: Colors.amber.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                     // mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(width: 15.0,),
                        Expanded(child: Text('Please verify your email')),
                      SizedBox(width: 10.0,),
                      TextButton(onPressed: () {}, child: Text('Verify')),

                    ],),
                  ),
                )

 */
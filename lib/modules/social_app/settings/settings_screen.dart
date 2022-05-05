
import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:app2/modules/social_app/edit_profile/edit_profile_screen.dart';
import 'package:app2/modules/social_app/social_login/social_loginscrren.dart';
import 'package:app2/shared/components/components.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class socialSettingsScreeen extends StatelessWidget {
  const socialSettingsScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialCubit,socialStates>(
      listener: (context, state) {},
      builder:(context,state)
      {
       // if(state is socialGetUserSuccessState)
         var usermodel=socialCubit.get(context).user_model;
        return   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 180.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 150.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(4.0), topRight: Radius.circular(4.0)),
                          image: DecorationImage(
                            image: NetworkImage('${usermodel.cover}'),
                            //'https://img.freepik.com/free-photo/concept-internat
                            // ional-womens-day-with-attractive-girl_185193-76368.jpg?w=740'),
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 63.0,
                      backgroundColor: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage('${usermodel.image}'),
                        //'https://img.freepik.com/free-photo/hacker-with-mask_103577-
                        // 1.jpg?size=626&ext=jpg&ga=GA1.2.1571019282.1647278978'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0,
              ),
              Text('${usermodel.name}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              Text('${usermodel.bio}',
                style: Theme
                    .of(context)
                    .textTheme
                    .caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: defaultButton(
                        function: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>socialEditProfileScreeen()));
                        },
                        text: 'Edit Profile',
                        isUpperCase: false,
                      )),
                ],
              ),
              SizedBox(height: 5.0,
              ),
              defaultButton(
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>socialLoginScreen()));
                },
                text: 'Log out',
                isUpperCase: false,
              ),

              SizedBox(height: 5.0,
              ),
              defaultButton(
                function: () {
                  FirebaseMessaging.instance.subscribeToTopic('announcements');
                },
                text: 'subscribe',
                isUpperCase: false,
              ),
              SizedBox(height: 5.0,
              ),
              defaultButton(
                function: () {
                  FirebaseMessaging.instance.unsubscribeFromTopic('announcements');

                },
                text: 'unsubscribe',
                isUpperCase: false,
              ),
            ],
          ),
        );/*state is! socialGetUserSuccessState ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 180.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 150.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(4.0), topRight: Radius.circular(4.0)),
                          image: DecorationImage(
                            image: NetworkImage('${usermodel.cover}'),
                                //'https://img.freepik.com/free-photo/concept-international-womens-day-with-attractive-girl_185193-76368.jpg?w=740'),
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 63.0,
                      backgroundColor: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage('${usermodel.image}'),
                            //'https://img.freepik.com/free-photo/hacker-with-mask_103577-1.jpg?size=626&ext=jpg&ga=GA1.2.1571019282.1647278978'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0,
              ),
              Text('${usermodel.name}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              Text('${usermodel.bio}',
                style: Theme
                    .of(context)
                    .textTheme
                    .caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text('posts',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: defaultButton(
                       function: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>socialEditProfileScreeen()));
                       },
                        text: 'Edit Profile',
                        isUpperCase: false,
                      )),
                ],
              ),
            ],
          ),
        ):Center(child: CircularProgressIndicator());*/
      }

    );
  }
}
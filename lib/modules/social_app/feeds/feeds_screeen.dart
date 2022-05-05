
import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:app2/models/social_app/post_model.dart';
import 'package:app2/modules/social_app/add_comment/add_comment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class socialFeedsScreeen extends StatelessWidget {
  const socialFeedsScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<socialCubit,socialStates>(
      listener: (context, state)  {},
      builder: (context,state)
      {
        return socialCubit.get(context).posts.length>0 && socialCubit.get(context).user_model !=null ? SingleChildScrollView(
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5.0,
                margin: EdgeInsets.all(8.0),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/concept-international-womens-day-with-attractive-girl_185193-76368.jpg?w=740'),
                      height: 200.0,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('communicate with friends',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildPostItem(socialCubit.get(context).posts[index],context,index),
                separatorBuilder: (context, index) =>SizedBox(height: 8.0,),
                itemCount: socialCubit.get(context).posts.length,
              ),
              SizedBox(height: 8.0,),
            ],
          ),
        ):Center(child: CircularProgressIndicator());
      },
    );
  }
}




/// ITEM BUILDER
Widget buildPostItem(postModel model,context,index)=> Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 5.0,
  margin: EdgeInsets.symmetric(horizontal: 8.0),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius:25.0,
              backgroundImage:NetworkImage('${model.image}'),
              //'https://img.freepik.com/free-photo/wonderful-girl-wi
              // th-wavy-hair-modern-plaid-light-clothes-holding-pink-flowers-looking-into-camera-isolated-background_197531-28770.jpg?t=st=1647267054~exp=1647267654~hmac=96dd027b81329f2d6a078a45bb6b1890399269dca827c323375e0e0279475a9a&w=740'),
            ),
            SizedBox(width:15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(
                    children: [
                      Text('${model.name}',style: TextStyle(height: 1.3),
                      ),
                      SizedBox(width: 5.0,),
                      Icon(Icons.check_circle,color: Colors.blue,size: 16.0,),
                    ],
                  ),
                  Text('${model.dateTime}',
                    style: Theme.of(context).textTheme.caption!.copyWith(height: 1.3),
                  ),
                ],
              ),
            ),
            SizedBox(width:15.0),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,size: 18.0,),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.white,
          ),
        ),
        Text( '${model.text}',
          style: Theme.of(context).textTheme.subtitle1,
        ),
       /* Padding(
          padding: const EdgeInsets.only(bottom: 10.0,top: 5.0),
          child: Container(
            width: double.infinity,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6.0),
                  child: Container(
                    height:25.0,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      minWidth: 1.0,
                      onPressed: (){},
                      child: Text('#Software',
                        style:Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6.0),
                  child: Container(
                    height:25.0,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      minWidth: 1.0,
                      onPressed: (){},
                      child: Text('#flutter',
                        style:Theme.of(context).textTheme.caption!.copyWith(color: Colors.blue),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),*/
        if(model.postImage !='')
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8.0),
          child: Container(
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image:DecorationImage(
                image: NetworkImage('${model.postImage}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Expanded(
                child:InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 18.0,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5.0,),
                        Text(

                          '${socialCubit.get(context).postLikes[index]}',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
              ),
              Spacer(),
              Expanded(
                child:InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.mode_comment_outlined,
                          size: 18.0,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${socialCubit.get(context).postcommentsCount[index]}'+' comments',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius:18.0,
                      backgroundImage:NetworkImage('${socialCubit.get(context).user_model.image}'),
                    ),
                    SizedBox(width: 15.0,),
                    Text(
                      'write a comment',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>socialAddCommentScreeen(postId: socialCubit.get(context).postsId[index] )));
                },
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 18.0,
                    color: Colors.red,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    'love',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
              onTap: (){
                socialCubit.get(context).likePost( socialCubit.get(context).postsId[index] );
              },
            ),
          ],
        ),
      ],
    ),
  ),
);

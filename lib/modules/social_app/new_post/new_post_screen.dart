
import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class socialNewPostScreeen extends StatelessWidget {
  //const socialNewPostScreeen({Key? key}) : super(key: key);

  var textcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialCubit,socialStates>(
      listener:(context, state) {},
      builder:(context, state) {
        return   Scaffold(
          appBar: AppBar(
            title: Text('Create Post'),
            actions:[
              TextButton(
                  onPressed: (){
                    if(socialCubit.get(context).postImage==null)
                      {
                        socialCubit.get(context).createPost(
                            Text: textcontroller.text,
                            dateTime: DateTime.now().toString(),
                            postImage: ''
                          ,);
                      }
                    else{
                      socialCubit.get(context).uploadPostImage(
                          text: textcontroller.text,
                          dateTime: DateTime.now().toString(),);
                        }

                     if(state is! socialCreatePostErrorState)
                     Navigator.pop(context);

                      },
                  child: Text('Post'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is socialCreatePostLoadingState)
                LinearProgressIndicator(),
                if(state is socialCreatePostLoadingState)
                  SizedBox(height: 10.0,),
                Row(
                  children: [
                    CircleAvatar(
                      radius:25.0,
                      backgroundImage:NetworkImage(
                          'https://img.freepik.com/free-photo/hacker-with-mask_103577-1.jpg?size=626&ext=jpg&ga=GA1.2.1571019282.1647278978'),
                    ),
                    SizedBox(width:15.0),
                    Text('Abdullah Ibrahim',style: TextStyle(height: 1.3)),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind...?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                if(socialCubit.get(context).postImage!=null)
                 Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                         image:  FileImage(socialCubit.get(context).postImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        socialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20.0,
                        child: Icon(Icons.close,size: 18.0,),
                      ),
                    ),
                  ],),
                SizedBox(height: 20.0,),
                 Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          socialCubit.get(context).getPostImage();
                        },
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo_outlined),
                          SizedBox(width: 5.0,),
                          Text('add photo'),
                        ],),
                      ),
                    ),
                    Expanded(
                      child: TextButton(onPressed: (){}, child: Text('# tags'),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

      });
  }
}


import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class socialAddCommentScreeen extends StatelessWidget {
  //const socialAddCommentScreeen({Key? key}) : super(key: key);

  String postId;
  socialAddCommentScreeen({
    required this.postId,
   });

  var textcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialCubit,socialStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return  Scaffold(
          appBar: AppBar(
            title: Text('Add Comment'),
            actions: [
              TextButton(
                  onPressed: (){
                    socialCubit.get(context).commentPost(postId, textcontroller.text);
                    if(state is socialCommentPostsSuccessState);
                    Navigator.pop(context);
                  },
                  child: Text('Add')),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add Comment.....',
                      border: InputBorder.none,
                    ),
                    controller: textcontroller,

                  ),
                ),
                TextButton(
                  onPressed: (){
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo_outlined),
                      SizedBox(width: 5.0,),
                      Text('add photo'),
                    ],),
                ),
              ],
            ),
          ),
        );
      });
  }
}

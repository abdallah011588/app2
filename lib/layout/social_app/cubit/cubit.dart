

import 'dart:io';

import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:app2/models/social_app/message_model.dart';
import 'package:app2/models/social_app/post_model.dart';
import 'package:app2/models/social_app/social_user_model.dart';
import 'package:app2/models/user/user_model.dart';
import 'package:app2/modules/social_app/chats/chats_screen.dart';
import 'package:app2/modules/social_app/feeds/feeds_screeen.dart';
import 'package:app2/modules/social_app/new_post/new_post_screen.dart';
import 'package:app2/modules/social_app/settings/settings_screen.dart';
import 'package:app2/modules/social_app/users/users_screen.dart';
import 'package:app2/shared/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class socialCubit extends Cubit<socialStates>
{
  socialCubit ():super(socialInitialState());
  static socialCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> screens=[
    socialFeedsScreeen(),
    socialChatsScreeen(),
    socialNewPostScreeen(),
    socialUsersScreeen(),
    socialSettingsScreeen(),
  ];

  List<Widget> titles=[
    Text('Home'),
    Text('Chats'),
    Text('Add post'),
    Text('Users'),
    Text('Settings'),
  ];

  late socialUserModel user_model;
  void getUserData()
  {
    emit(socialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value)
    {
        user_model= socialUserModel.fromJson(value.data()!);
        print(user_model.name);
        emit(socialGetUserSuccessState());
    }).catchError((onError){
      print(onError.toString()+'this is error');
      emit(socialGetUserErrorState(onError.toString()));
    });
  }


  void changeBottomNav(int index)
  {
    if(index==1)
      getUsers();
    if(index==2)
     emit(socialNewsPostState());
    else
    currentIndex=index;
    emit(socialChangeBottomNavState());
  }


  File? profileImage;
  final ImagePicker picker = ImagePicker();
  Future<void> getProfileImage()async
  {
    final pickedFile=await picker.pickImage(source:ImageSource.gallery);

    if(pickedFile !=null) {
      profileImage=File(pickedFile.path);
      emit(socialProfileImPickedSuccessState());
    }
    else {
      print('No Image Selected');
      emit(socialProfileImPickedErrorState());
    }

    // final XFile ? im=await picker.pickImage(source: ImageSource.gallery);
  }

  File? coverImage;
  Future<void> getCoverImage()async
  {
    final pickedFile=await picker.pickImage(source:ImageSource.gallery);

    if(pickedFile !=null) {
      coverImage=File(pickedFile.path);
      emit(socialCoverImPickedSuccessState());
    }
    else {
      print('No Image Selected');
      emit(socialCoverImPickedErrorState());
    }

    // final XFile ? im=await picker.pickImage(source: ImageSource.gallery);
  }


  void uploadProfileImage({
    required String name,
    required String bio,
    required String phone,
  }) {

    emit(socialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
              value.ref.getDownloadURL().then((value)
              {
                updateUser(
                    name: name,
                    bio: bio,
                    phone: phone,
                    image: value,
                );
             }).catchError((onError){
                emit(socialUploadProfileImErrorState());
              });
       }).catchError((error){
      emit(socialUploadProfileImErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(socialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        updateUser(
            name: name,
            bio: bio,
            phone: phone,
            cover: value,
        );
      }).catchError((onError){
        emit(socialUploadCoverImErrorState());
      });
    }).catchError((error){
      emit(socialUploadCoverImErrorState());
    });
  }

  void updateUser({
    required String name,
    required String bio,
    required String phone,
    String? cover,
    String? image,
  }) {
    socialUserModel model=socialUserModel(
      name: name,
      bio  : bio ,
      phone: phone,
      email: user_model.email,
      uId  :  user_model.uId,
      cover: cover?? user_model.cover ,
      image: image ??user_model.image,
      IsEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(user_model.uId)
        .update(model.toMap())
        .then((value) {
         getUserData();
        }).catchError((onError){
        emit(socialUserUpdateErrorState());
        });
  }



  File? postImage;
  Future<void> getPostImage()async
  {
    final pickedFile=await picker.pickImage(source:ImageSource.gallery);

    if(pickedFile !=null) {
      postImage=File(pickedFile.path);
      emit(socialCoverImPickedSuccessState());
    }
    else {
      print('No Image Selected');
      emit(socialPostImPickedErrorState());
    }
  }

  void removePostImage()
  {
    postImage=null;
    emit(socialRemovePostImageState());
  }


  void uploadPostImage({
    required String text,
    required String dateTime,

  }) {
    emit(socialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        createPost(
          Text: text,
          postImage: value,
          dateTime: dateTime,
        );
      }).catchError((onError){
        emit(socialCreatePostErrorState());
      });
    }).catchError((error){
      emit(socialCreatePostErrorState());
    });
  }



  void createPost({
    required String Text,
    required String dateTime,
    required String postImage,

  }){
    emit(socialCreatePostLoadingState());
    postModel model=postModel(
      name: user_model.name,
      uId  :  user_model.uId,
      image:user_model.image,
      dateTime:dateTime,
      text: Text,
      postImage: postImage,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
          emit(socialCreatePostSuccessState());
          }).catchError((onError){
      emit(socialCreatePostErrorState());
    });
  }



  List<postModel> posts=[];
  List<String> postsId=[];
  List<int> postLikes=[];
  List<int> postcommentsCount=[];
  List<String> postcomments=[];


  void getPosts()
  {
    emit(socialGetPostsLoadingState());
    FirebaseFirestore.instance
     .collection('posts')
     .get().then((value)
     {
       value.docs.forEach((element)
       {

         element.reference.collection('comments').get().then((value) {
           postcommentsCount.add(value.docs.length);
         }).catchError((err){});

         element.reference.collection('likes').get().then((value)
         {
           postsId.add(element.id);
           posts.add(postModel.fromJson(element.data()));
           postLikes.add(value.docs.length);
         }).catchError((err){});

       });
       emit(socialGetPostsSuccessState());
    }).catchError((error){
      emit(socialGetPostsErrorState(error.toString()));
    });
  }


  void likePost(String postId)
  {
  FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('likes')
      .doc(user_model.uId)
      .set({
      'like':true,
      })
      .then((value) {
        emit(socialLikePostsSuccessState());
      }).catchError((error){
        emit(socialLikePostsErrorState(error.toString()));
      });
}

  void commentPost(String postId,String comment)
  {
    emit(socialCommentPostsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(user_model.uId)
        .set({
        'comment':comment,
    }).then((value) {
      emit(socialCommentPostsSuccessState());
    }).catchError((error){
      emit(socialCommentPostsErrorState(error.toString()));
    });
  }


  List<socialUserModel> users=[];
  void getUsers()
  {
    emit(socialGetAllUserLoadingState());
    if(users.length==0)
    FirebaseFirestore.instance
        .collection('users')
        .get().then((value) {
        value.docs.forEach((element)
        {
          if(element.data()['uId'] !=user_model.uId)
          users.add(socialUserModel.fromJson(element.data()));
        });
        emit(socialGetAllUserSuccessState());
        }).catchError((error){
         emit(socialGetAllUserErrorState(error.toString()));
       });
  }




  File? MessageImage;
  Future<void> getMessageImage()async
  {
    final pickedFile=await picker.pickImage(source:ImageSource.gallery);

    if(pickedFile !=null) {
      MessageImage=File(pickedFile.path);
      emit(socialCoverImPickedSuccessState());
    }
    else {
      print('No Image Selected');
      emit(socialPostImPickedErrorState());
    }
  }

  void removeMessageImage()
  {
    MessageImage=null;
    emit(socialRemovePostImageState());
  }

  void uploadMessageImage({
    required String receiverId,
    required String text,
    required String dateTime,

  }) {
    emit(socialCreateMessageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('messages/${Uri.file(MessageImage!.path).pathSegments.last}')
        .putFile(MessageImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        sendMessage(
            receiverId: receiverId,
            dateTime: dateTime,
            text: text,
            messageImage: value,
        );

      }).catchError((onError){
        emit(socialCreateMessageErrorState());
      });
    }).catchError((error){
      emit(socialCreateMessageErrorState());
    });
  }




  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
    required String messageImage,

  })
  {
    messageModel msModel=messageModel(
        senderId: user_model.uId,
        receiverId: receiverId,
        dateTime: dateTime,
        text: text,
      messageImage: messageImage,
    );

    /// Set My Chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(user_model.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add( msModel.toMap() ).then((value)
        {
        emit(socialSendMessageSuccessState());
        }).catchError((error){
       emit(socialSendMessageErrorState(error.toString()));
      });


    /// Set Receiver Chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(user_model.uId)
        .collection('messages')
        .add(msModel.toMap()).then((value)
         {
         emit(socialSendMessageSuccessState());
         }).catchError((error){
        emit(socialSendMessageErrorState(error.toString()));
        });

  }


List<messageModel> messages=[];

  void getMessages({required String receiverId,})
  {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user_model.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event)
        {
          messages=[];
          event.docs.forEach((element)
          {
            messages.add(messageModel.fromJson(element.data()));
          });
          emit(socialGetMessageSuccessState());
        });
  }






}
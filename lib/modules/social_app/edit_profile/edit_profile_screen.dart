import 'dart:io';
import 'package:app2/layout/social_app/cubit/cubit.dart';
import 'package:app2/layout/social_app/cubit/states.dart';
import 'package:app2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
class socialEditProfileScreeen extends StatelessWidget {

   var namecontroller=TextEditingController();
   var biocontroller=TextEditingController();
   var phonecontroller=TextEditingController();
/*
   late File image;
   final ImagePicker picker = ImagePicker();

   Future<void> getImage()async
   {

    final pickedFile=await picker.pickImage(source:ImageSource.gallery);

    if(pickedFile !=null)
      {
        image=File(pickedFile.path);
      }
    else
      {
        print('No Image Selected');
      }

   // final XFile ? im=await picker.pickImage(source: ImageSource.gallery);
   }
*/


   @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<socialCubit,socialStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var usermodel=socialCubit.get(context).user_model;
        var profileImage=socialCubit.get(context).profileImage;
        var coverImage=socialCubit.get(context).coverImage;
        //var img=profileImage !=null? FileImage(profileImage):NetworkImage('${usermodel.image}');

        namecontroller.text=usermodel.name;
        biocontroller.text=usermodel.bio;
        phonecontroller.text=usermodel.phone;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){Navigator.pop(context);}),
            actions: [
              TextButton(
                  onPressed: (){
                    socialCubit.get(context).updateUser(
                      phone: phonecontroller.text,
                      name: namecontroller.text,
                      bio:biocontroller.text,
                    );
                  },
                  child: Text('Update'),
              ),
              SizedBox(width: 15.0,),
            ],
            titleSpacing: 5.0,
            title: Text('Edit Profile'),
          ),
          body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(state is socialUserUpdateLoadingState)
                  LinearProgressIndicator(),
                  SizedBox(height: 5.0,),
                  Container(
                    height: 180.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 150.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
                                  image: DecorationImage(
                                    image:coverImage ==null? NetworkImage('${usermodel.cover}'):FileImage(coverImage) as ImageProvider<Object>,
                                    fit: BoxFit.cover,
                                  ),
                                ),),
                              IconButton(
                                  onPressed: (){
                                    socialCubit.get(context).getCoverImage();
                                  },
                                  icon: CircleAvatar(
                                    radius: 20.0,
                                      child: Icon(Icons.photo_camera_outlined,size: 18.0,),
                                  ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 63.0,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage:profileImage !=null? FileImage(profileImage):NetworkImage('${usermodel.image}') as ImageProvider<Object>?,
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                socialCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(Icons.photo_camera_outlined,size: 18.0,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  if(socialCubit.get(context).profileImage !=null ||socialCubit.get(context).coverImage !=null)
                  Row(
                    children: [
                      if(socialCubit.get(context).profileImage !=null)
                      Expanded(
                          child: Column(
                            children: [
                              defaultButton(
                                  function: (){
                                    socialCubit.get(context).uploadProfileImage(
                                        name: namecontroller.text,
                                        bio: biocontroller.text,
                                        phone: phonecontroller.text,
                                    );
                                  },
                                  text: 'Upload Profile',
                                 isUpperCase: false,
                                radius: 5.0,
                              ),
                              if(state is socialUserUpdateLoadingState)
                              SizedBox(height: 5.0,),
                              if(state is socialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          )),
                      SizedBox(width: 5.0,),
                      if(socialCubit.get(context).coverImage !=null)
                       Expanded(
                          child: Column(
                            children: [
                              defaultButton(
                                function: (){
                                  socialCubit.get(context).uploadCoverImage(
                                    name: namecontroller.text,
                                    bio: biocontroller.text,
                                    phone: phonecontroller.text,
                                  );
                                },
                                text: 'Upload Cover',
                                radius: 5.0,
                                isUpperCase: false,
                              ),
                              if(state is socialUserUpdateLoadingState)
                                SizedBox(height: 5.0,),
                              if(state is socialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          )),
                    ],
                  ),
                  if(socialCubit.get(context).profileImage !=null ||socialCubit.get(context).coverImage !=null)
                    SizedBox(height: 20.0,),


                  defaultFormField(
                      onsubmit: (onsubmit){},
                      ontap: (){},
                      validatointext: 'Can not be empty !',
                      showpasswordicon: (){},
                      onchanged: (onchanged){},
                      controller: namecontroller,
                      type: TextInputType.name,
                      labeltext: 'New Name',
                      prefix: Icons.person_outlined,
                  ),
                  SizedBox(height: 10.0,),
                  defaultFormField(
                    onsubmit: (value){},
                    ontap: (){},
                    validatointext: 'Can not be empty !',
                    showpasswordicon: (){},
                    onchanged: (value){},
                    controller: biocontroller,
                    type: TextInputType.text,
                    labeltext: 'New Bio',
                    prefix: Icons.info_outline_rounded,
                  ),

                  SizedBox(height: 10.0,),
                  defaultFormField(
                    onsubmit: (value){},
                    ontap: (){},
                    validatointext: 'Can not be empty !',
                    showpasswordicon: (){},
                    onchanged: (value){},
                    controller: phonecontroller,
                    type: TextInputType.phone,
                    labeltext: 'New Phone Number',
                    prefix: Icons.phone,
                  ),
              ],),
            ),
          ) ,
        );
      } ,
    );
  }
}

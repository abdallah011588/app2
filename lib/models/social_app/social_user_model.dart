
class socialUserModel
{
    late String name;
    late String email;
    late String phone;
    late String uId;
    late String image;
    late String cover;
    late String bio;
    late bool IsEmailVerified;


    socialUserModel({
    required this.name,
    required this.email,
      required this.phone,
    required this.uId,
       required this.image,
      required this.cover,
      required this.bio,
      required this.IsEmailVerified,
    });


  socialUserModel.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uId=json['uId'];
    image=json['image'];
    cover=json['cover'];
    bio=json['bio'];
    IsEmailVerified=json['IsEmailVerified'];
  }


  Map<String,dynamic> toMap()
  {
   return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
     'image':image,
     'cover':cover,
     'bio':bio,
     'IsEmailVerified':IsEmailVerified,
   };
  }

}
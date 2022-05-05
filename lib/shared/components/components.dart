

import 'package:app2/layout/shop_app/cubit/cubit.dart';
import 'package:app2/models/shop_app/favorites_model.dart';
import 'package:app2/shared/cubit/cubit.dart';
import 'package:app2/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../modules/news_app/web_view/web_view.dart';

/// MATERIALBUTTON ////////////////////////////////

Widget defaultButton ({
   double width=double.infinity,
   Color background=Colors.blue,
   bool isUpperCase =true,
   double radius=0,
  required Function function,
  //required Function? fun,
  required String text,
})
{
  return  Container(
    height: 40.0,
    width: width,
    decoration: BoxDecoration
      (
      color: background,
      borderRadius: BorderRadius.circular(radius),
    ),

    child: MaterialButton
      (
      onPressed:(){
        function();
      },
      child: Text(
        isUpperCase? '${text}'.toUpperCase():'${text}' ,
          style:TextStyle(
            color: Colors.white,fontSize: 20.0,
          ),
      ),

    ),
  );

}


/// TEXTFORMFIELD //////////////////////////////
/*
 Widget defaultTextformField(
{
  required String labeltext,
  required Icon prefixicon,
  required Function function,
  //required Function validatorfunction,

  required  TextEditingController controller,
  @required bool ispassword = false,
  required TextInputType inputtype,
     required Function? changelock(),
   Icon? suffixicon ,

})
 {
   return TextFormField(

     validator:( value)
     {
       if(value!.isEmpty)
       {
         return 'No that is not valid';
       }
       return null;
     },
     controller: controller,
     decoration: InputDecoration(
       labelText: '${labeltext}',
       border: OutlineInputBorder(),
       prefixIcon: prefixicon,

       suffixIcon:suffixicon !=null? IconButton
         (
           icon: suffixicon,
           onPressed:changelock,
       ):null,


     ),
     obscureText: ispassword,
     keyboardType: inputtype,
     onFieldSubmitted:function(),


   );
 }
 */



Widget defaultFormField(
{
  required Function onsubmit,
  required Function()? ontap,
  required String validatointext,
   required Function? showpasswordicon(),
   required Function onchanged,
  required TextEditingController? controller,
  required TextInputType? type,
  required String? labeltext,
  required IconData? prefix,
   bool ispassword=false,
   Icon? suffix,
  bool isenabled=true,

}) => TextFormField(

  validator: (value)
  {
    if(value!.isEmpty)
      {
        return '$validatointext';
      }
    return null;
  },

  controller: controller,
  decoration: InputDecoration(
    labelText: labeltext,
    border: OutlineInputBorder(),
    prefixIcon: Icon(prefix),
    suffixIcon:suffix!=null? IconButton(
      icon: suffix,
      onPressed:showpasswordicon,
    ):null,
  ),
  keyboardType: type,
  onFieldSubmitted:(value)=>onsubmit(value),
  onChanged:(value)=>onchanged(value),
  obscureText: ispassword,
  onTap: ontap,
  enabled: isenabled,
);





Widget itembuild( Map tasks , context) {
  return Dismissible(
    key: Key(tasks['id'].toString()),
    onDismissed: (direction) {
      appcubit.get(context).deleteFromDatabase(id: tasks['id'],);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[600],
            foregroundColor: Colors.white,
            child: Text('${tasks['time']}'),
            radius: 40.0,
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${tasks['title']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                SizedBox(height: 5.0,),
                Text('${tasks['date']}',style: TextStyle(fontSize: 15.0 ,color: Colors.green),),
              ],
            ),
          ),
          SizedBox(width: 10.0,),
          IconButton(
            onPressed: (){
              appcubit.get(context).updateDatabase(id: tasks['id'], status: 'Done');
            },
            icon:tasks['status']=='New' ||tasks['status']=='Archived' ? Icon(Icons.check_box,color: Colors.black54):Icon(Icons.check_box,color: Colors.green),
          ),
          SizedBox(width: 10.0,),
          IconButton(
              onPressed: (){
                appcubit.get(context).updateDatabase(id: tasks['id'], status: 'Archived');
              },
           icon:tasks['status']=='New' ||tasks['status']=='Done' ? Icon(Icons.archive,color: Colors.black54):Icon(Icons.archive,color: Colors.green),
          ),
          SizedBox(width: 10.0,),
          IconButton(
            onPressed: (){
            appcubit.get(context).deleteFromDatabase(id: tasks['id']);
            },
            icon: Icon(Icons.delete,color: Colors.red),
          ),
        ],
      ),
    ),
  );
}




Widget tasksbuilder({required List<Map> task })
{
  return task.length>0? ListView.separated(
  itemBuilder: (context, index) {
  return itembuild(appcubit.get(context).newtasks[index],context);
  } ,
  separatorBuilder:(context, index) => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[400],
  ),
  ) ,
  itemCount:task.length,
): Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.assignment_late_outlined,size: 150.0,color: Colors.grey,),
SizedBox(height: 15.0,),
Text('No tasks ,add tasks',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
],
),
);
}



Widget newItemBuilder(article,context)
{
  return InkWell(
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => webView(article['url']),));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(

        children: [

          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(

                image: NetworkImage('${article['urlToImage']}' =="null"? 'https://st3.depositphotos.com/17828278/33150/v/380/depositphotos_331503262-stock-illustration-no-image-vector-symbol-missing.jpg?forcejpeg=true':'${article['urlToImage']}' )  ,             //('https://www.catphones.com/wp-content/uploads/2021/08/Cat-S62-Pro-Made-Mighty-3-2x.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.0,),

          Expanded(
            child: Container(
              height: 120.0,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                //mainAxisSize: MainAxisSize.min,
                children: [

                  Expanded(
                      child: Text(
                       ' ${article['title']}',
                        style:Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                  ),
                  Text('${article['publishedAt']} ',style: TextStyle(color: Colors.grey),)

                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget Separator()
{
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20.0),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[400],
    ),
  );
}



Widget newsbuilder(list,context,{isSearch =false}){
  return list.length >0 ? ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      return newItemBuilder(list[index],context);
    },
    separatorBuilder:(context,index)=> Separator(),
    itemCount: list.length,
  ) :isSearch? Container(): Center(child: CircularProgressIndicator());
}





Widget listProductItemBuilder( var favorite,context ,{bool isSearch=true,bool isOldPrice=false})
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 120.0,
      height: 120.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(favorite.image),
                width: 120.0,
                height: 120.0,
              ),
              if(favorite.discount !=0 && isOldPrice) Container(
                color: Colors.green,
                padding: EdgeInsets.all( 3.0,),
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${favorite.product.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.0,height: 1.3),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${favorite.price!}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0,color: defaultColor,),
                    ),
                    SizedBox(width: 5.0,),
                    if(favorite.discount !=0 && isOldPrice) Text(
                      '${favorite.oldPrice!}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10.0,color: Colors.grey,decoration: TextDecoration.lineThrough),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                         shopCubit.get(context).changeFavorites(favorite.id!);
                        //print(product.id);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: shopCubit.get(context).favorites[favorite.id]! ? Colors.blue:Colors.grey[400],
                        child: Icon(
                          Icons.favorite_border,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



/*
Future<bool?> showToast()
{
  return Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );

}

 */














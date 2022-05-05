import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget
{
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 15,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person,),
              radius: 20.0,
            ),
            SizedBox(width: 10.0,),
            Text('Chats', style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),)
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.camera_alt,
                size: 17.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.edit,
                size: 17.0,
              ),
            ),
          ),
        ],
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[600],),
                    SizedBox(width: 10.0,),
                    Text('Search', style: TextStyle(color: Colors.grey[700],),),
                  ],
                ),

              ),

              SizedBox(height: 15.0,),

              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder:(context, index) =>  SizedBox(width: 10.0,),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildstoryitem(),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 15.0,),

              ListView.separated(
                  itemBuilder: (context, index) => buildchatitem(),
                  separatorBuilder:(context, index) => SizedBox(height: 20.0,),
                  itemCount: 15,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //  scrollDirection: Axis.vertical,
              ),

            ],
          ),
        ),
      ),


    );
  }


  Widget buildchatitem() =>
      Row(
        children: [
          Container(
            width: 60.0,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person,),
                      radius: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 3.0, end: 3.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 7.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 3.0, end: 3.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 7.0,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 5.0,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Abdallah Ibrahim ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(child: Text('Message to you', maxLines: 2,
                      overflow: TextOverflow.ellipsis,)),
                    SizedBox(width: 10.0,),
                    Text('.', style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text('12:05 pm'),

                  ],
                ),
              ],
            ),
          ),
        ],

      );

  Widget buildstoryitem() =>
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  child: Icon(Icons.person,),
                  radius: 25.0,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      bottom: 3.0, end: 3.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 7.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      bottom: 3.0, end: 3.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 7.0,
                  ),
                ),

              ],
            ),
            SizedBox(height: 6.0,),
            Text('Abdallah Ibrahim',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
}
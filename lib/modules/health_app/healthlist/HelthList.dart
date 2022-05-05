import 'package:app2/models/healthmodel/data_model.dart';
import 'package:app2/modules/health_app/healt_details/HealthDetails.dart';
import 'package:flutter/material.dart';

import '../health/Health.dart';
//import '../../healt_details/HealthDetails.dart';
class HealthList extends StatelessWidget {
  const HealthList({Key? key, required this.mydatalist,}) : super(key: key);

  //final int index;
 // final String imagepath;

   final List<datamodel> mydatalist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),

      body:
      Container(
      color: Colors.grey[300],
      child:
      ListView.builder(
        itemCount: mydatalist.length,
        itemBuilder: (context, index)
        {
          return Card(

            child: ListTile(

              title: Text('${mydatalist[index].name}'),
              leading: SizedBox(
                width: 80.0,
                height: 80.0,
                child: Image(image: AssetImage('${mydatalist[index].imagepath}'),),
              ),
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => HealthDetails(),));

                 /*
                if(index==0){
                  mylist=data1;
                }
                else if(index==1)
                {
                  mylist=data2;

                }
                else if(index==2)
                {
                  mylist=data3;

                }
                else if(index==3)
                {
                  mylist=data4;

                }
                Navigator.push(context,MaterialPageRoute(builder: (context) => HealthList(mydatalist: mylist,),));*/
              },
            ),);
        },
      ),
    )
    ,
    );
  }
}

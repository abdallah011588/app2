import 'package:app2/models/healthmodel/data_model.dart';
import 'package:flutter/material.dart';

import '../healthlist/HelthList.dart';
class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health>
{
  late List<datamodel> mylist;


  List<datamodel> data=[
    datamodel(name: 'فاكهة', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'لحوم', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'خضروات', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'اعشاب', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'عادات', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تمارين', imagepath: 'assets/images/ash.jpg'),
  ];

  //List< List<datamodel> > mydata=new List.filled(4, []);


  List<datamodel> data1=[
    datamodel(name: 'خوخ', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'مانجا', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'برتقال', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'عنب', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تفاح', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تين', imagepath: 'assets/images/ash.jpg'),
  ];
  List<datamodel> data2=[
    datamodel(name: 'لحم ماعز', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'مانجا', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'برتقال', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'عنب', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تفاح', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تين', imagepath: 'assets/images/ash.jpg'),
  ];

  List<datamodel> data3=[
    datamodel(name: 'طماطم', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'مانجا', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'برتقال', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'عنب', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تفاح', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تين', imagepath: 'assets/images/ash.jpg'),
  ];
  List<datamodel> data4=[
    datamodel(name: 'نعناع', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'مانجا', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'برتقال', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'عنب', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تفاح', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تين', imagepath: 'assets/images/ash.jpg'),
  ];

  List<datamodel> data5=[
    datamodel(name: 'النوم المبكر', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'مانجا', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'برتقال', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'عنب', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تفاح', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تين', imagepath: 'assets/images/ash.jpg'),
  ];

  List<datamodel> data6=[
    datamodel(name: 'البلانك', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'مانجا', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'برتقال', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'عنب', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تفاح', imagepath: 'assets/images/ash.jpg'),
    datamodel(name: 'تين', imagepath: 'assets/images/ash.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy'),
        leading: Icon(Icons.person),
      ),

      body:
      Container(
        color: Colors.grey[300],
        child:
          ListView.builder(

            itemCount: data.length,
            itemBuilder: (context, index)
            {
              return Card(
                child: ListTile(
                title: Text('${data[index].name}'),
                  leading: SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: Image(image: AssetImage('${data[index].imagepath}'),),
                  ),

                  onTap: (){
                  if(index==0) {mylist=data1;}
                  else if(index==1) {mylist=data2;}
                  else if(index==2) {mylist=data3;}
                  else if(index==3) {mylist=data4;}
                  else if(index==4) {mylist=data5;}
                  else if(index==5) {mylist=data6;}

                  Navigator.push(context,MaterialPageRoute(builder: (context) => HealthList(mydatalist: mylist,),));

                  },
              ),);
            },
          ),
      )
      ,
    );
  }
}

Widget itembuilder ()=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: double.infinity,
    height: 150.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('assets/images/ash.jpg'),width: 60.0,height: 60.0,)),
          SizedBox(width: 50.0,),
          Expanded(child: Text('Healthy')),
        ],
      ),
    ),
  ),
);



/*ListView.separated(
            itemBuilder:(context, index) => itembuilder(),
            separatorBuilder:(context, index) =>  Container
              (
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            itemCount: 10), */
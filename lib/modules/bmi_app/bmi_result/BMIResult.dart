import 'package:flutter/material.dart';
class BMIResult extends StatelessWidget {
  //const BMIResult({Key? key}) : super(key: key);

  final int age;
  final double result;
  final bool gender;

  BMIResult({
    required this.age,
    required this.result,
    required this.gender,
  });

  String status='';
  @override
  Widget build(BuildContext context)
  {
    if(result<18.5) status='UnderWeight';
    else if (result>=18.5&&result<=24.9) status='HealthyWeight';
    else if (result>=25&&result<=29.9) status='OverWeight';
    else if (result>=30) status='Obesity';


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left,size: 40.0,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('BMIResult'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender: ${gender? 'Male':'Female '}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
           SizedBox(height: 10.0,),
            Text('Age: $age',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
            SizedBox(height: 10.0,),
            Text('Result: ${result.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
            SizedBox(height: 10.0,),
            Text('Status: ${status}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),


          ],
        ),
      ),
    );
  }
}

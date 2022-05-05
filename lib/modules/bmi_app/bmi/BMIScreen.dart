import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/BMIResult.dart';
class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {

  double heightvalue=120.0;
  int weight=50;
  int age=20;

  double result=0.0;

  bool ismale=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold
      (
      appBar:AppBar(
        title:Text('BMI Calculator'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(

          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [

                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(()
                          {
                            ismale=true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: ismale? Colors.blue : Colors.purple,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male,size: 80.0,),
                             // Image(image: AssetImage('assets/images/male2.png'),height: 90,width: 90,),
                              SizedBox(height: 10.0,),
                              Text('MALE',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            ismale=false;

                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ismale? Colors.purple:Colors.blue,
                            borderRadius: BorderRadius.circular(20.0),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female,size: 80.0,),
                             // Image(image: AssetImage('assets/images/female.png'),height: 90,width: 90,),
                              SizedBox(height: 10.0,),
                              Text('FEMALE',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
/////////////////////////////////////
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.purple,
                  ),
                  child: Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('HEIGHT',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('${heightvalue.round()}',style: TextStyle(fontSize: 40.0,color: Colors.white),),
                            SizedBox(width: 5.0,),
                            Text('cm',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                          ],
                        ),
                       Slider(
                         onChanged:(value)
                         {
                           setState(() {
                            heightvalue= value;
                           });
                           },
                         value: heightvalue,
                         max: 220.0,
                         min: 1.0,

                       ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.purple,
                        ),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Weight',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                            SizedBox(height: 5.0,),
                            Text('$weight',style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: '3',
                                  onPressed: ()
                                {
                                  setState(() {
                                   if(weight>0) weight--;
                                  });
                                },
                                  child: Icon(Icons.remove), ),
                                SizedBox(width: 5.0,),
                                FloatingActionButton(
                                  heroTag: '4',
                                  onPressed: ()
                                {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                  child: Icon(Icons.add),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.purple,
                        ),
                        child: Column(
                         // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Age',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                            SizedBox(height: 5.0,),
                            Text('$age',style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: '5',
                                  onPressed: (){
                                  setState(() {
                                    if(age>0)  age--;
                                  });
                                },
                                  child: Icon(Icons.remove),),
                                SizedBox(width: 5.0,),
                                FloatingActionButton(
                                  heroTag: '10',
                                  onPressed: ()
                                {
                                  setState(() {
                                   age++;

                                  });
                                },
                                  child: Icon(Icons.add),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Container(
              height: 50.0,
              width:double.infinity,
              color: Colors.lightBlueAccent,
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                    result=(weight)/pow(heightvalue/100, 2);
                    print(result);
                  });

                  Navigator.push(
                      context, MaterialPageRoute(
                    builder:(context)=>BMIResult(age: age,gender: ismale,result:result ,),));
                },
                child: Text('CALCULATE',style:TextStyle(color: Colors.white)),
                ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyBMIScreen extends StatefulWidget {
  const MyBMIScreen({Key? key}) : super(key: key);

  @override
  _MyBMIScreenState createState() => _MyBMIScreenState();
}

class _MyBMIScreenState extends State<MyBMIScreen>
{
  var heightcontroller=TextEditingController();
  var weightcontroller=TextEditingController();
  var result=0.0;
  String bmiresult='result';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${result.toStringAsFixed(2)}\n'+'${bmiresult}',style:TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
            SizedBox(height: 40.0,),

            TextFormField(
              controller: heightcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration
                (
                border: OutlineInputBorder(),
                labelText: 'Height',
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              controller: weightcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration
                (
                border: OutlineInputBorder(),
                labelText: 'Weight',
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
                child: MaterialButton(
                  onPressed: ()
                  {
                    setState(()
                    {
                      double x=double.parse(heightcontroller.text)/100;
                      double y=double.parse (weightcontroller.text);
                      result=y/(x*x);
                      if(result<18.5) bmiresult='UnderWeight';
                      else if (result>=18.5&&result<=24.9) bmiresult='HealthyWeight';
                      else if (result>=25&&result<=29.9) bmiresult='OverWeight';
                      else if (result>=30) bmiresult='Obesity';
                    });
                  },
                  child: Text('Calculate BMI',style: TextStyle(color: Colors.white),),
                ),),
          //  SizedBox(height: 10.0,),

          ],
        ),
      ),
    );
  }
}

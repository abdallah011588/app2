import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class nativeCodeScreen extends StatefulWidget{

  @override
  State<nativeCodeScreen> createState() => _nativeCodeScreenState();
}

class _nativeCodeScreenState extends State<nativeCodeScreen>
{

  static const platform = MethodChannel('samples.flutter.dev/battery');

  String batteryLevel = 'Unknown battery level.';

  getBatteryLevel()
  {
      platform.invokeMethod('getBatteryLevel').then((value)
         {
          setState(() {
            batteryLevel = 'Battery level at $value % .';
          });
         }).catchError((error) {
          setState(() {
          batteryLevel = "Failed to get battery level: '${error.message}'.";
        });
      });

  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(),
      body: //Text('Native',style: TextStyle(fontSize: 40.0),),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Get Battery Level'),
              onPressed: getBatteryLevel,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(batteryLevel),
            ),
          ],
        ),
      ),
    );
  }
}

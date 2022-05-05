import 'package:flutter/material.dart';

class HealthDetails extends StatelessWidget {
  const HealthDetails ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body:  SingleChildScrollView(child: Text('All Details You Can Find It Here About This Item All Details You Can Find It Here About This ItemAll Details You Can Find It Here About This ItemAll Details You Can Find It Here About This ItemAll Details You Can Find It Here About This ItemAll Details You Can Find It Here About This ItemAll Details You Can Find It Here About This ItemAll Details You Can Find It Here About This Item',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),)),
    );
  }
}

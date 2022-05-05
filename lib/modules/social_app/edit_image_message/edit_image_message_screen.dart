
import 'dart:io';

import 'package:flutter/material.dart';
class socialEditImageScreeen extends StatelessWidget {
  //const socialEditImageScreeen({Key? key}) : super(key: key);
  
  File  image;
  socialEditImageScreeen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.file(File(image.path));
  }
}


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webView extends StatelessWidget
{
  String url;
  webView(this.url);
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(),
     body: WebView(
       initialUrl: '$url',
     ),
   );
  }

}
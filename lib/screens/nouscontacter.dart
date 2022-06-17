import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Contacter extends StatefulWidget {
  @override
  _ContacterState createState() => _ContacterState();
}

class _ContacterState extends State<Contacter> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(34.394220, 10.692345), zoom: 11.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFD80404),
          title: Container(
            padding: EdgeInsets.all(25),
            child: Image.asset(
              "assets/images/tunisair.png",
              height: 60,
            ),
          ),
          elevation: 0.0,
        ),
      body: WebView(
        initialUrl:
            'https://www.tunisair.com/site/publish/content/article.asp?id=530&',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

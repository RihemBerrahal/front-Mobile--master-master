import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WorldMap extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<WorldMap> {
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
            'https://www.google.com/maps/d/u/0/viewer?mid=1eTS6lEWFEvuYhaUvdORZ0wNWtcE&ll=28.382645141865556%2C8.81941615000008&z=3',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

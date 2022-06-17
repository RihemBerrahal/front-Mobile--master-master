import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helpers/utils.dart';

class SelectedAgencePage extends StatelessWidget {
  String? mapurl;

  SelectedAgencePage({required this.mapurl});

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
          initialUrl: this.mapurl,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}

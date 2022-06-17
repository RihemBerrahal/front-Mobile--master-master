import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfosFidelys extends StatefulWidget {
  const InfosFidelys({Key? key}) : super(key: key);

  @override
  State<InfosFidelys> createState() => _InfosFidelysState();
}

class _InfosFidelysState extends State<InfosFidelys> {
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
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.tunisair.com/site/publish/content/article.asp?ID=522#3',
      ),
    );
  }
}

import 'package:currency_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tunisair',
      theme: ThemeData(
        fontFamily: 'Spinnaker',
        primarySwatch: Colors.red,
      ),
      home: SplashPage(duration: 3, goToPage: HomeScreen()),
    );
  }
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
        body: Container(
            color: Color(0xFFD80404),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Image.asset('assets/imgs/tuni+gazelle.png'),
                    SizedBox(height: 250),
                    Image.asset('assets/imgs/getcloser.png')
                  ],
                ))
              ],
            )));
  }
}

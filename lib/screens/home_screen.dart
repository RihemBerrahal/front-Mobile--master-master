import 'dart:convert';

import 'package:currency_flutter/screens/Flight.dart';
import 'package:currency_flutter/screens/LogIn.dart';
import 'package:currency_flutter/screens/achatBillet.dart';
import 'package:currency_flutter/screens/gestiondeprofile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/navigation_drawer_widget.dart';
import 'pages.dart';
import 'package:http/http.dart' as http;

Future upstatus(String id) async {
    var Url = "http://10.0.2.2:8081/upstatus";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"id": id}));
    if (res.statusCode == 200) {
      String jsonResponse = json.decode(res.body);
      print(jsonResponse);

      print(id);
      print(jsonResponse);
      return jsonResponse;
    } 
  }

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List<Widget> _children = [
    HomePage(),
    Flight(),
    LogIn(),
    GestionProfile(),
  ];
  String finalid = "0";
  Future getvalidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('id');
    setState(() {
      finalid = userid!;
      if (finalid == '0') {
        _children = [
          HomePage(),
          Flight(),
          LogIn(),
        ];
      } else {
         upstatus(finalid);
        _children = [
          HomeScreen2(),
          Flight(),
          GestionProfile(),
        ];
      }
    });
    setState(() {});
  }

  @override
  void initState() {
   
    getvalidationData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(onChanged: (i) {
        setState(() {
          _currentIndex = i;
        });
      }),
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFD80404),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Acceuil",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.flight),
            label: "Vols",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: "Fidelys",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

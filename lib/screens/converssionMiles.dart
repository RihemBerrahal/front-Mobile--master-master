import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/fidelys.dart';
import '../widgets/navigation_drawer_widget.dart';
import 'home_screen.dart';

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
Future getfid(String id) async {
  var Url = "http://10.0.2.2:8081/getfidelys";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    // print(jsonResponse.length);

    print(id);
    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

String mliesqua = "";

class ConverssionMiles extends StatefulWidget {
  @override
  _ConverssionMiles createState() {
    // TODO: implement createState
    return _ConverssionMiles();
  }
}

String mp = "";

class _ConverssionMiles extends State<ConverssionMiles> {
  final TextEditingController milesprimecontroller =
      new TextEditingController(text: mp);

  late final TextEditingController milesqualifiantcontroller =
      new TextEditingController(text: mliesqua);

  Future getvalidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('id');
    setState(() {
      finalid = userid!;
    });
  }

  @override
  void initState() {
    getvalidationData();

    super.initState();
  }

  Future TesterSolde(String id, String solde) async {
    var Url = "http://10.0.2.2:8081/testersolde";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"id": id, "solde": solde}));
    if (res.statusCode == 200) {
      int jsonResponse = json.decode(res.body);
      print(jsonResponse);

      print(id);
      print(jsonResponse);

      setState(() {
        mp = solde;
        mliesqua = jsonResponse.toString();
      });
      return jsonResponse;
    } else {
      Fluttertoast.showToast(
          msg: "Votre solde est insuffisant",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw Exception('Unexpected error occured!');
    }
  }

  Future ConvertirSolde(String id, String solde) async {
    var Url = "http://10.0.2.2:8081/convertirsolde";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"id": id, "solde": solde}));
    if (res.statusCode == 200) {
      String jsonResponse = json.decode(res.body);
      print(jsonResponse);

      print(id);
      print(jsonResponse);

      setState(() {
        Fluttertoast.showToast(
            msg: res.body,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
      return jsonResponse;
    } else {
      Fluttertoast.showToast(
          msg: "Votre solde est insuffisant",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw Exception('Unexpected error occured!');
    }
  }
  
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
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
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
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text("Converssion des Miles",
                      style: TextStyle(fontSize: 25, fontFamily: 'ElMessiri')),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Converssion des Miles Primes en Miles qualifiants",
                    style: TextStyle(fontSize: 18)),
                Divider(
                  height: 20,
                  thickness: 0.5,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "Combien de Miles Prime voulez-vous convertir ?\n(2 Miles Prime = 1 Miles qualifiant)",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 240,
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: milesprimecontroller,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Miles qualifiants gagné : ",
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(width: 20),
                    Text(mliesqua,
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(width: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            minimumSize: Size(80, 30),
                            textStyle: TextStyle(fontSize: 17)),
                        child: Text("Initialiser"),
                        onPressed: () {
                          TesterSolde(finalid, milesprimecontroller.text);
                          setState(() {});
                        }),
                  ],
                ),
                SizedBox(height: 20),
                Text("NB : Vos Miles Prime converti seront perdu.",
                    style: TextStyle(
                      fontSize: 17,
                    )),
                SizedBox(
                  height: 150,
                ),
                Container(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            minimumSize: Size(250, 40),
                            textStyle: TextStyle(fontSize: 19)),
                        child: Text("Convertir",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          ConvertirSolde(finalid, milesprimecontroller.text);
                          setState(() {});
                        })
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

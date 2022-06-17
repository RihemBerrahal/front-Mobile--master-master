import 'dart:convert';

import 'package:currency_flutter/screens/reclamationreponse.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import '../model/Reclamtion.dart';
import '../model/fidelys.dart';
import '../widgets/navigation_drawer_widget.dart';

import 'addrec.dart';
import 'home_screen.dart';

var fid = <Fidelys>[];
Future getfid() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8081//getfidelys'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future getrec(String iduser) async {
  var Url = "http://10.0.2.2:8081/getrec";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"iduser": iduser}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(iduser);
    return jsonResponse.map((data) => new ReclamationM.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class recc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Reclamation();
  }
}

class Reclamation extends StatefulWidget {
  @override
  rec createState() => rec();
}

late String finalid = "";

class rec extends State<Reclamation> {
  TextEditingController _textFieldController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddRecPage()),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red[800],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Text("Mes réclamations",
                style: TextStyle(fontSize: 25, fontFamily: 'ElMessiri')),
          ),
          card()
        ]));
  }
}

class card extends StatefulWidget {
  @override
  reccard createState() {
    // TODO: implement createState
    return reccard();
  }
}

class reccard extends State<card> {
  @override
  Widget build(BuildContext context) {
    Future deleterec(String id) async {
      var Url = "http://10.0.2.2:8081/supprec";
      var res = await http.post(Uri.parse(Url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{"id": id}));
      if (res.statusCode == 200) {
        print(res.body);
      } else {
        throw Exception('Unexpected error occured!');
      }
    }

    // TODO: implement build
    return FutureBuilder(
      future: getrec(finalid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ReclamationM> data = snapshot.data;
          return Container(
              child: SingleChildScrollView(
                  child: Column(
            children: data
                .map<Widget>((data) => Padding(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.list_alt,
                                        color: Colors.red[800],
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          data.typederec,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red[800]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      data.dis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, bottom: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24))),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (data.reponse != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Reclamationrep(data.id)));
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "acune reponse",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    },
                                    child: Text(
                                      "Voir reponse",
                                      style: TextStyle(
                                          color: Colors.red[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                )),
                                IconButton(
                                    onPressed: () {
                                      deleterec(data.id.toString());
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          )));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

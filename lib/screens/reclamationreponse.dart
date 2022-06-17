import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../model/Reclamtion.dart';
import '../widgets/navigation_drawer_widget.dart';

Future getrec(String id) async {
  var Url = "http://10.0.2.2:8081/getrep";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    return jsonResponse.map((data) => new ReclamationM.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

late int idrec;

class Reclamationrep extends StatefulWidget {
  Reclamationrep(int id) {
    idrec = id;
  }

  @override
  _rep createState() => _rep();
}

late String finalid = "";

class _rep extends State<Reclamationrep> {
  Future getvalidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('id');
    setState(() {
      finalid = userid!;
      print(idrec);
    });
  }

  @override
  void initState() {
    getvalidationData();
    getvalidationData();

    super.initState();
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
        ),
        body: FutureBuilder(
          future: getrec(idrec.toString()),
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
                                    Text(
                                      data.reponse,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
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
        ));
  }
}

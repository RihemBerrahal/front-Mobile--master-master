import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/MouvementM.dart';

import 'package:http/http.dart' as http;

Future getmouvement(String id) async {
  var Url = "http://10.0.2.2:8081/getmouvement";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    // print(jsonResponse.length);

    print(id);
    return jsonResponse.map((data) => new MouvementM.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class MouvementsPage extends StatefulWidget {
  @override
  _MouvementsPageState createState() => _MouvementsPageState();
}

String finalid = '1';

class _MouvementsPageState extends State<MouvementsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getmouvement(finalid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<MouvementM> data = snapshot.data;
              return Container(
                  child: SingleChildScrollView(
                      child: Column(
                children: data
                    .map<Widget>((data) => Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              )));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

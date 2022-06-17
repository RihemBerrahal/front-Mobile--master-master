import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/fidelys.dart';

class ActiveAccount extends StatefulWidget {
  @override
  _activeAccount createState() {
    // TODO: implement createState
    return _activeAccount();
  }
}

final numDuVolcontroller = TextEditingController();
final NumDuBilletcontroller = TextEditingController();
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

late String finalid = "";

class _activeAccount extends State<ActiveAccount> {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getfid(finalid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Fidelys> data = snapshot.data;
              return Container(
                  child: SingleChildScrollView(
                      child: Column(
                children: data.map<Widget>((data) => Container()).toList(),
              )));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

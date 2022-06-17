import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/textstyle.dart';

import 'package:http/http.dart' as http;

import '../model/MouvementM.dart';

Future getmouvement(String iduser) async {
  var Url = "http://10.0.2.2:8081/getmouvement";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"iduser": iduser}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    // print(jsonResponse.length);

    print(jsonResponse);
    print(iduser);
    return jsonResponse.map((data) => new MouvementM.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Setting extends StatefulWidget {
  @override
  _Setting createState() {
    // TODO: implement createState
    return _Setting();
  }
}

String finalid = '0';

class _Setting extends State<Setting> {
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
    return FutureBuilder(
      future: getmouvement(finalid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<MouvementM> data = snapshot.data;
          return Container(
              child: SingleChildScrollView(
                  child: Column(
            children: data
                .map<Widget>(
                  (data) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 61,
                                  height: 61,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset("assets/logo/circle.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data.transaction,
                                        style: ApptextStyle.LISTTILE_TITLE),
                                    Text(data.dateajout,
                                        style: ApptextStyle.LISTTILE_SUB_TITLE),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("+" + data.credit.toString(),
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                        )),
                                    Text("-" + data.debit.toString(),
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 10 ,)
                    ],
                  ),
                )
                .toList(),
          )));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

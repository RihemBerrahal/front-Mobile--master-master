import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future Activercompte(
  String id,
  String vols,
  String user,
) async {
  var Url = "http://10.0.2.2:8081/findbillet";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "id": id,
        "vols": vols,
        "fidelys": user,
      }));
  String responseStr = res.body;
  print(res.body);
  if (res.statusCode == 200) {
    print("done");
    print(res.body);
  }
}

class ActiverCompte extends StatefulWidget {
  @override
  _activercompte createState() {
    // TODO: implement createState
    return _activercompte();
  }
}

late String finalid = "";
final numeroduvolController = TextEditingController();
final numbilletController = TextEditingController();

class _activercompte extends State<ActiverCompte> {
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
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                  "Pour voir cette page veuillez activer \nvotre compte par taper le numéro de\n votre billet lors d'un voyage avec Tunisair"),
            ),
          ),
          Container(
            child: TextFormField(
              controller: numeroduvolController,
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.red,
                ),
                contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                labelText: "Numero du vol",
                hintText: "Numero du vol",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              autofocus: false,
              controller: numbilletController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.red,
                ),
                contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                labelText: "Numero du Billet",
                hintText: "Numero du Billet",
              ),
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(80),
            color: Colors.red[800],
            child: MaterialButton(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  Activercompte(numbilletController.text,
                      numeroduvolController.text, finalid);
                },
                child: Text(
                  "Valider",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}

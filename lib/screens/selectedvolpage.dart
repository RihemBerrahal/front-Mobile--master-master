import 'dart:convert';

import 'package:currency_flutter/screens/achatBillet.dart';
import 'package:currency_flutter/screens/tickettemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/fidelys.dart';
import 'package:http/http.dart' as http;

import '../widgets/navigation_drawer_widget.dart';

Future acheterbillet(String id, String solde) async {
  var Url = "http://10.0.2.2:8081/achatbillet";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "solde": solde}));
  if (res.statusCode == 200) {
    String jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse;
  } else {
    throw Exception('Unexpected error occured!');
  }
}

int km1 = 0;
double classe1 = 0;
double age1 = 0;
String numvol1 = '';

class SelectedVolPage extends StatefulWidget {
  String numvol = '';
  int km = 0;
  double classe = 0;
  double age = 0;

  get getKm => this.km;

  set setKm(km) => this.km = km;

  get getClasse => this.classe;

  set setClasse(classe) => this.classe = classe;

  get getAge => this.age;

  set setAge(age) => this.age = age;

  SelectedVolPage(int km, double classe, double age, String numvol) {
    km1 = km;
    classe1 = classe;
    age1 = age;
    numvol1 = numvol;
  }

  @override
  State<SelectedVolPage> createState() => _SelectedVolPageState();
}

class _SelectedVolPageState extends State<SelectedVolPage> {
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

  double pricemiles = (km1 * 100) * classe1 * age1;

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
      body: FutureBuilder(
        future: getfid(finalid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Fidelys> data = snapshot.data;
            return Container(
                child: SingleChildScrollView(
                    child: Column(
              children: data
                  .map<Widget>(
                    (data) => Column(children: [
                      SizedBox(
                        height: 280,
                      ),
                      Center(
                          child: Text(
                              "Le prix de ce billet en Miles est : " +
                                  pricemiles.toInt().toString(),
                              style: TextStyle(fontSize: 18))),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            minimumSize: Size(250, 40),
                            textStyle: TextStyle(fontSize: 19)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        "Vous allez payer de votre solde Miles : " +
                                            pricemiles.toInt().toString()),
                                    content: Text("Votre solde actuel est : " +
                                        data.solde.toString()),
                                    actions: [
                                      TextButton(
                                          child: Text("Annuler"),
                                          onPressed: () =>
                                              Navigator.pop(context)),
                                      TextButton(
                                          child: Text("Confirmer"),
                                          onPressed: () {
                                            if (data.Solde >= pricemiles) {
                                              acheterbillet(finalid, pricemiles.toString());
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TicketWidget(
                                                            classevalue,
                                                            numvol1,
                                                            data.firstName +
                                                                " " +
                                                                data.secondName)),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                    title: Text("Erreur"),
                                                    content: Text(
                                                        "Votre solde est insufissant !"),
                                                    actions: [
                                                      TextButton(
                                                          child:
                                                              Text("Annuler"),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context))
                                                    ]),
                                              );
                                            }
                                          })
                                    ],
                                  ));
                        },
                        child: Text("Payer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  )
                  .toList(),
            )));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

import '../model/Vols.dart';
import '../model/fidelys.dart';
import 'package:http/http.dart' as http;

Future getvol(String id) async {
  var Url = "http://10.0.2.2:8081/ticket";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"numeroDuVol": id}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    // print(jsonResponse.length);

    print(jsonResponse);
    return jsonResponse.map((data) => new Vols.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

double classe1 = 0;
String numvol1 = '';
String name1 = '';
String afficheClasse = '';

class TicketWidget extends StatefulWidget {
  double classe = 0;
  String numvol = '';
  String name = '';

  TicketWidget(double classe, String numvol, String name) {
    classe1 = classe;
    numvol1 = numvol;
    name1 = name;
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TicketWidget> {
  @override
  void initState() {
    setState(() {
      if (classe1 == 1.0) {
        afficheClasse = 'Economique';
      } else if (classe1 == 2.0) {
        afficheClasse = 'Business';
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          FutureBuilder(
            future: getvol(numvol1),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Vols> data = snapshot.data;
                return Container(
                    child: SingleChildScrollView(
                        child: Column(
                  children: data
                      .map<Widget>(
                        (data) => Center(
                          child: FlutterTicketWidget(
                            width: 350,
                            height: 500,
                            isCornerRounded: true,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 140,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                width: 1, color: Colors.green)),
                                        child: Center(
                                          child: Text(
                                            'Classe ' + afficheClasse,
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            data.EscaleDepart,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Icon(
                                              Icons.flight_takeoff,
                                              color: Colors.pink,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              data.escaleArrive,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Vol : ' + data.numeroDuVol,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Column(
                                      children: <Widget>[
                                        ticketDetailsWidget('Voyageur', name1,
                                            'Date', data.DateDuvol),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, right: 40),
                                          child: ticketDetailsWidget(
                                              'Classe',
                                              afficheClasse,
                                              'Heure',
                                              data.DepartProgramme),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 80, left: 30, right: 30),
                                    child: Container(
                                      width: 242,
                                      height: 60,
                                      child: Image.asset(
                                          "assets/imgs/barcode.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 75, right: 75),
                                    child: Text(
                                      '1991 9581 7826 1861',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                firstDesc,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              secondTitle,
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                secondDesc,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}

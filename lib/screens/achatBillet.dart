import 'dart:convert';
import 'dart:math';
import 'package:currency_flutter/screens/selectedvolpage.dart';
import 'package:currency_flutter/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../model/Vols.dart';
import 'home_screen.dart';

double classevalue = 1;
double agevalue = 0;
late List<Vols> aller = [];
late List<Vols> retour;
Future findaller(
  String typebillet,
  String depart,
  String destination,
  String voldepart,
  String volretour,
  String age,
  String classe,
) async {
  var Url = "http://10.0.2.2:8081/findaller";
  final res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "typebillet": typebillet,
        "depart": depart,
        "destination": destination,
        "voldepart": voldepart,
        "volretour": volretour,
        "age": age,
        "classe": classe,
      }));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);

    // print(jsonResponse);
    aller = jsonResponse.map((data) => new Vols.fromJson(data)).toList();
    print(aller);
    // print(res.body);
    return jsonResponse.map((data) => new Vols.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future findretour(
  String typebillet,
  String depart,
  String destination,
  String voldepart,
  String volretour,
  String age,
  String classe,
) async {
  var Url = "http://10.0.2.2:8081/findretour";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "typebillet": typebillet,
        "depart": depart,
        "destination": destination,
        "voldepart": voldepart,
        "volretour": volretour,
        "age": age,
        "classe": classe,
      }));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);
    retour = jsonResponse.map((data) => new Vols.fromJson(data)).toList();
    return jsonResponse.map((data) => new Vols.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

late String departvalue;
late String destvalue;

class AchatBillet extends StatefulWidget {
  const AchatBillet({Key? key}) : super(key: key);

  @override
  State<AchatBillet> createState() => _AchatBilletState();
}

class _AchatBilletState extends State<AchatBillet> {
  String classe = 'Economique';
  String age = '';

  int _value = 0;
  List<String> villes = [
    'Abidjan',
    'Alger',
    'Amman',
    'Amesterdam',
    'Bâle',
    'Bamako',
    'Barcelone',
    'Benghazi',
    'Berlin',
    'Bologne',
    'Bordeaux',
    'Bruxelles',
    'Casablanca',
    'Conakry',
    'Constantine',
    'Cotonou',
    'Dakar',
    'Djerba',
    'Dubai',
    'Duesseldorf',
    'Enfidha',
    'Frankfurt',
    'Gabes',
    'Gafsa',
    'Genève',
    'Hamburg',
    'Istanbul',
    'Jeddah',
    'Le Caire',
    'Lille',
    'Lisbonne',
    'Londres',
    'Lyon',
    'Madrid',
    'Malte',
    'Marseille',
    'Médine',
    'Milan',
    'Monastir',
    'Montréal',
    'Munich',
    'Nantes',
    'Naples',
    'Niamey',
    'Nice',
    'Nouakchott',
    'Oran',
    'Ouagadougou',
    'Palerme',
    'Paris',
    'Prague',
    'Rome',
    'Sfax',
    'Strasbourg',
    'Tabarka',
    'Toulouse',
    'Tozeur',
    'Tripoli',
    'Tunis',
    'Venise',
    'Vérone',
    'Vienne',
    'Zurich'
  ];

  String type = '';

  String voyageur = '0 voyageurs';
  String ville1 = 'Tunis';
  String ville2 = 'Paris';
  TextEditingController _date = TextEditingController();
  TextEditingController _date2 = TextEditingController();

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
          child: Container(
              padding:
                  EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("Achat d'une billet Prime",
                        style:
                            TextStyle(fontSize: 25, fontFamily: 'ElMessiri')),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Départ :",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: DropdownButton<String>(
                            value: ville1,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey.shade400,
                            ),
                            items: villes
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: TextStyle(fontSize: 19))))
                                .toList(),
                            onChanged: (item) {
                              setState(() {
                                ville1 = item!;
                                departvalue = ville1;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Destination :",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: DropdownButton<String>(
                            value: ville2,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey.shade400,
                            ),
                            items: villes
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: TextStyle(fontSize: 19))))
                                .toList(),
                            onChanged: (item) {
                              setState(() {
                                ville2 = item!;
                                destvalue = ville2;
                              });
                            }),
                      ),
                      Row(
                        children: [
                          Text("Date du vol :",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            child: TextFormField(
                                readOnly: true,
                                controller: _date,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.calendar_today_rounded),
                                ),
                                onTap: () async {
                                  DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2101));
                                  if (pickeddate != null) {
                                    setState(() {
                                      _date.text = DateFormat('dd/MM/yyyy')
                                          .format(pickeddate);
                                    });
                                  }
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Tranche d'âge :",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Center(
                        child: DropdownButton<String>(
                            value: age,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey.shade400,
                            ),
                            items: const [
                              DropdownMenuItem<String>(
                                  child: Text(
                                      "--Choisissez votre tranche d'âge--",
                                      style: TextStyle(fontSize: 19)),
                                  value: ''),
                              DropdownMenuItem<String>(
                                  child: Text("Adulte (+25)",
                                      style: TextStyle(fontSize: 19)),
                                  value: 'Adulte (+25)'),
                              DropdownMenuItem<String>(
                                  child: Text("Jeune (12-24)",
                                      style: TextStyle(fontSize: 19)),
                                  value: 'Jeune (12-24)'),
                              DropdownMenuItem<String>(
                                  child: Text("Enfant (2-11)",
                                      style: TextStyle(fontSize: 19)),
                                  value: 'Enfant (2-11)'),
                              DropdownMenuItem<String>(
                                  child: Text("Bébé (-2)",
                                      style: TextStyle(fontSize: 19)),
                                  value: 'Bébé (-2)'),
                            ],
                            onChanged: (item) {
                              setState(() {
                                age = item!;
                                if (age == 'Adulte (+25)') {
                                  agevalue = 1;
                                } else if (age == 'Jeune (12-24)') {
                                  agevalue = 0.75;
                                } else if (age == 'Enfant (2-11)') {
                                  agevalue = 0.5;
                                } else if (age == 'Bébé (-2)') {
                                  agevalue = 0.25;
                                }
                              });
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Classe :",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      DropdownButton<String>(
                          value: classe,
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.grey.shade400,
                          ),
                          items: const [
                            DropdownMenuItem<String>(
                                child: Text("Economique",
                                    style: TextStyle(fontSize: 19)),
                                value: 'Economique'),
                            DropdownMenuItem<String>(
                                child: Text("Business",
                                    style: TextStyle(fontSize: 19)),
                                value: 'Business'),
                          ],
                          onChanged: (item) {
                            setState(() {
                              classe = item!;
                              if (classe == 'Economique') {
                                classevalue = 1;
                              } else if (classe == 'Business') {
                                classevalue = 2;
                              }
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            minimumSize: Size(250, 40),
                            textStyle: TextStyle(fontSize: 19)),
                        child: Text("Rechercher",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          print(ville1);
                          print(type);

                          findaller(type, ville1, ville2, _date.text,
                              _date2.text, age, classe);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => allerscreen()),
                          );
                        }),
                  )
                ],
              )),
        ));
  }
}

class allerscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: SingleChildScrollView(
        child: Column(
            children: aller
                .map<Widget>((data) => Padding(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectedVolPage(
                                          data.Km,
                                          classevalue,
                                          agevalue,
                                          data.NumeroDuvol),
                                    ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24))),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          data.escaleDepart,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: Colors.indigo.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 8,
                                            width: 8,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.indigo.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Stack(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 24,
                                                  child: LayoutBuilder(
                                                    builder:
                                                        (context, constraints) {
                                                      return Flex(
                                                        children: List.generate(
                                                            (constraints.constrainWidth() /
                                                                    6)
                                                                .floor(),
                                                            (index) => SizedBox(
                                                                  height: 1,
                                                                  width: 3,
                                                                  child:
                                                                      DecoratedBox(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300),
                                                                  ),
                                                                )),
                                                        direction:
                                                            Axis.horizontal,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Center(
                                                    child: Transform.rotate(
                                                  angle: 1.5,
                                                  child: Icon(
                                                    Icons.local_airport,
                                                    color:
                                                        Colors.indigo.shade300,
                                                    size: 24,
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: Colors.indigo.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 8,
                                            width: 8,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.indigo,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          data.escaleArrive,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          data.departProgramme,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          data.arrivep,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
                              children: <Widget>[],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class allerretourscreen extends StatelessWidget {
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
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.flight_land,
                color: Colors.red[800],
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Les vols de départ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
              children: aller
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
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        data.escaleDepart,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.indigo.shade50,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: SizedBox(
                                          height: 8,
                                          width: 8,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.indigo.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 24,
                                                child: LayoutBuilder(
                                                  builder:
                                                      (context, constraints) {
                                                    return Flex(
                                                      children: List.generate(
                                                          (constraints.constrainWidth() /
                                                                  6)
                                                              .floor(),
                                                          (index) => SizedBox(
                                                                height: 1,
                                                                width: 3,
                                                                child:
                                                                    DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300),
                                                                ),
                                                              )),
                                                      direction:
                                                          Axis.horizontal,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Center(
                                                  child: Transform.rotate(
                                                angle: 1.5,
                                                child: Icon(
                                                  Icons.local_airport,
                                                  color: Colors.indigo.shade300,
                                                  size: 24,
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.indigo.shade50,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: SizedBox(
                                          height: 8,
                                          width: 8,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.indigo,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        data.escaleArrive,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        data.departProgramme,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        data.arrivep,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300),
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
                                children: <Widget>[],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList()),
          SizedBox(height: 30),
          Row(
            children: [
              Icon(
                Icons.flight_land,
                color: Colors.red[800],
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Les vols de retour",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          Column(
              children: retour
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
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        data.escaleDepart,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.indigo.shade50,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: SizedBox(
                                          height: 8,
                                          width: 8,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.indigo.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 24,
                                                child: LayoutBuilder(
                                                  builder:
                                                      (context, constraints) {
                                                    return Flex(
                                                      children: List.generate(
                                                          (constraints.constrainWidth() /
                                                                  6)
                                                              .floor(),
                                                          (index) => SizedBox(
                                                                height: 1,
                                                                width: 3,
                                                                child:
                                                                    DecoratedBox(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300),
                                                                ),
                                                              )),
                                                      direction:
                                                          Axis.horizontal,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Center(
                                                  child: Transform.rotate(
                                                angle: 1.5,
                                                child: Icon(
                                                  Icons.local_airport,
                                                  color: Colors.indigo.shade300,
                                                  size: 24,
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.indigo.shade50,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: SizedBox(
                                          height: 8,
                                          width: 8,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.indigo,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        data.escaleArrive,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        data.departProgramme,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        data.arrivep,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300),
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
                                children: <Widget>[],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList()),
        ],
      )),
    );
  }
}

import 'dart:convert';

import 'package:currency_flutter/screens/reclmation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../widgets/navigation_drawer_widget.dart';

class AddRecPage extends StatefulWidget {
  @override
  _AddRecPageState createState() {
    return _AddRecPageState();
  }
}

final typederecController = TextEditingController();
List<String> types = [
  'Bonus Non Alloue',
  'Cloture compte justificatif',
  'code pin oublie',
  'demande de duplicat de carte',
  'demande revision statut',
  'demande de duplicat talons de bagages',
  'regroupement famille avec 20% bonus',
  'catering',
  'carte non parvenue',
  'transfert des miles du compte famille',
  'voyage non comptablise'
];

var now = DateTime.now();
var formatterDate = DateFormat('dd/MM/yy');

String actualDate = formatterDate.format(now);
final discController = TextEditingController();
final dateController = TextEditingController();
final numeroController = TextEditingController();
final billetController = TextEditingController();

class _AddRecPageState extends State<AddRecPage> {
  Future addFidelys(
    String dis,
    String datedujour,
    String dateduvol,
    String billet,
    String numeroduvol,
    String iduser,
    String typederec,
  ) async {
    var Url = "http://10.0.2.2:8081/addrec";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "dis": dis,
          "datedujour": datedujour,
          "dateduvol": dateduvol,
          "billet": billet,
          "numeroduvol": numeroduvol,
          "iduser": iduser,
          "typederec": typederec
        }));
    String responseStr = res.body;
    print(res.body);
    if (res.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => recc(),
          ));
      print("done");
    }
  }

  late String finalid = "";
  Future getvalidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('id');
    setState(() {
      finalid = userid!;
    });
    print(finalid);
  }

  @override
  void initState() {
    getvalidationData();
    setState(() {});
    super.initState();
  }

  final numero = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.airplanemode_active,
            color: Colors.red,
          ),
          Text(
            ' TU-',
          ),
          IntrinsicWidth(
            child: TextField(
              controller: numeroController,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                labelText: "Numero du vol",
                hintText: "Numero du vol",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide: BorderSide(width: 1.0)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              autocorrect: false,
            ),
          ),
        ],
      ));
  final TypeDeRec = SearchField<String>(
    controller: typederecController,
    searchInputDecoration: InputDecoration(
      prefixIcon: Icon(
        Icons.group,
        color: Colors.red,
      ),
      //contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      labelText: "Type de reclamation",
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide(width: 0.5)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    suggestions: types
        .map(
          (e) => SearchFieldListItem<String>(
            e.toString(),
            item: e,
          ),
        )
        .toList(),
  );
  final Disc = TextFormField(
    autofocus: false,
    controller: discController,
    //obscureText: true,

    onSaved: (value) {
      discController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.factory_outlined,
        color: Colors.red,
      ),
      // contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      labelText: "Discription",
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide(width: 3.0)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );

  final numeroduvol = TextFormField(
    autofocus: false,
    controller: discController,
    //obscureText: true,

    onSaved: (value) {
      discController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.airplanemode_on,
        color: Colors.red,
      ),
      contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      labelText: "Numero du vol",
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide(width: 3.0)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
  final billet1 = TextFormField(
    autofocus: false,
    controller: billetController,
    //obscureText: true,

    onSaved: (value) {
      billetController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.airplane_ticket,
        color: Colors.red,
      ),
      contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      labelText: "Numero de billet",
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide(width: 1.0)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
  final billet2 = TextFormField(
    autofocus: false,
    controller: discController,
    //obscureText: true,

    onSaved: (value) {
      discController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.factory_outlined,
        color: Colors.red,
      ),
      contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      labelText: "Société",
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide(width: 3.0)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final dateFlied = TextFormField(
      controller: dateController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.event_note,
          color: Colors.red,
        ),
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
            borderSide: BorderSide(width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'date du\n vol',
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                1920), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime.now());

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            dateController.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
    );

    final valideButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(80),
      color: Colors.red[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            addFidelys(
              discController.text,
              actualDate,
              dateController.text,
              billetController.text,
              numeroController.text,
              finalid,
              typederecController.text,
            );
          },
          child: Text(
            "Valider",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
    );

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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  // key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                "Votre identifiant : " +
                                    finalid +
                                    "          Date : " +
                                    actualDate,
                                style: TextStyle(
                                    color: Colors.red[800], fontSize: 14)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TypeDeRec,
                      SizedBox(
                        height: 10,
                      ),
                      Disc,
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 60,
                            child: numero,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 60,
                            width: 145,
                            child: dateFlied,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      billet1,
                      SizedBox(
                        height: 25,
                      ),
                      valideButton,
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

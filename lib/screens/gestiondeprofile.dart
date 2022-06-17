import 'dart:convert';

import 'package:currency_flutter/widgets/iconfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants/textstyle.dart';
import '../model/fidelys.dart';
import '../widgets/navigation_drawer_widget.dart';
import 'Setting.dart';
import 'home_screen.dart';

Future upstatus(String id) async {
    var Url = "http://10.0.2.2:8081/upstatus";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{"id": id}));
    if (res.statusCode == 200) {
      String jsonResponse = json.decode(res.body);
      print(jsonResponse);

      print(id);
      print(jsonResponse);
      return jsonResponse;
    } 
  }

Future getfid(String id) async {
  var Url = "http://10.0.2.2:8081/getfidelys";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    // print(jsonResponse.length);

    print(id);
    print(jsonResponse);
    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updateprenom(String id, String secondname) async {
  var Url = "http://10.0.2.2:8081/setprenom";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "secondname": secondname}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatenom(String id, String firstname) async {
  var Url = "http://10.0.2.2:8081/setnom";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "firstname": firstname}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updateemail(String id, String email) async {
  var Url = "http://10.0.2.2:8081/setmail";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "email": email}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatecin(String id, String cin) async {
  var Url = "http://10.0.2.2:8081/setcin";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "cin": cin}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatedate(String id, String birthdaydate) async {
  var Url = "http://10.0.2.2:8081/setdate";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body:
          jsonEncode(<String, String>{"id": id, "birthdaydate": birthdaydate}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatefon(String id, String fonction) async {
  var Url = "http://10.0.2.2:8081/setfn";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "fonction": fonction}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatenat(String id, String nationalite) async {
  var Url = "http://10.0.2.2:8081/setnat";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "id": id,
        "nationalite": nationalite,
      }));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatesexe(String id, String sexe) async {
  var Url = "http://10.0.2.2:8081/setsexe";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "sexe": sexe}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatetel(String id, String tel) async {
  var Url = "http://10.0.2.2:8081/settel";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"id": id, "tel": tel}));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updatesoc(String id, String societe) async {
  var Url = "http://10.0.2.2:8081/setsoc";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "id": id,
        "societe": societe,
      }));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future updateadresse(String id, String adresse) async {
  var Url = "http://10.0.2.2:8081/setadresse";
  var res = await http.post(Uri.parse(Url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "id": id,
        "adresse": adresse,
      }));
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    print(jsonResponse);

    print(id);
    print(jsonResponse);

    return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class GestionProfile extends StatefulWidget {
  @override
  _gestion createState() {
    return _gestion();
  }
}

String finalid = "0";

class _gestion extends State<GestionProfile> {
  Future getvalidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('id');
    setState(() {
      finalid = userid!;
          if (finalid != '0') {
            upstatus(finalid);
          }

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
        body: Container(
      padding: EdgeInsets.only(left: 16, top: 5, right: 16),
      child: ListView(
        children: [
          Center(
            child: Text("Mon Fidelys",
                style: TextStyle(fontSize: 25, fontFamily: 'ElMessiri')),
          ),
          Row(
            children: [
              Icon(
                Icons.card_membership,
                color: Colors.red[800],
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Votre carte",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 8,
          ),
          FutureBuilder(
            future: getfid(finalid),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Fidelys> data = snapshot.data;
                return Container(
                    child: SingleChildScrollView(
                        child: Column(
                  children: data
                      .map<Widget>(
                        (data) => Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(data.card),
                                Positioned(
                                  child: Text(
                                    data.firstname,
                                    style: ApptextStyle.LISTTILE_TITLE,
                                  ),
                                  right: 110,
                                  bottom: 20,
                                ),
                                Positioned(
                                  child: Text(
                                    data.secondName,
                                    style: ApptextStyle.LISTTILE_TITLE,
                                  ),
                                  right: 20,
                                  bottom: 20,
                                ),
                                Positioned(
                                  child: Text(
                                    "ID : " + data.id.toString(),
                                    style: ApptextStyle.LISTTILE_TITLE,
                                  ),
                                  right: 280,
                                  bottom: 20,
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Vos Miles Prime : " +
                                        data.solde.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Vos Miles Status : " +
                                        data.soldequa.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                )));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => editprofile(),
                      ));
                },
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 40,
                  width: 180,
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.manage_accounts),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Editer votre profil",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.history,
                color: Colors.red[800],
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Mouvements",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 170,
            child: Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Setting(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Icon(
                Icons.lock,
                color: Colors.red[800],
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Sécurité",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Edit(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Changer votre mot de passe",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class Edit extends StatefulWidget {
  @override
  editpassword createState() => editpassword();
}

final oldpasswordcontroller = TextEditingController();
final newpasswordcontroller = TextEditingController();
final confirmpasswordcontroller = TextEditingController();
late String nom;
late String prenom;
late String email;
late String sexe;
late String tel;
late String adresse;
String fonction = "-";
String societe = "-";
late String cin;
late String datedenaissance;
late String date;

late String nat;

final birthadaydateController = TextEditingController(text: date);
final nomcontroller = TextEditingController(text: nom);
final prenomcontroller = TextEditingController(text: prenom);
final mailcontroller = TextEditingController(text: email);
final sexecontroller = TextEditingController(text: sexe);
final telcontroller = TextEditingController(text: tel);
final adressecontroller = TextEditingController(text: adresse);
final fonctioncontroller = TextEditingController(text: fonction);
final soccontroller = TextEditingController(text: societe);
final cinController = TextEditingController(text: cin);

final natController = TextEditingController(text: nat);
String setinitial(String inom, String iprenpm, String imail, isexe, itel,
    iadresse, ifonction, isoc, icin, idate, inat) {
  nom = inom;
  prenom = iprenpm;
  email = imail;
  sexe = isexe;
  tel = itel;
  adresse = iadresse;
  fonction = ifonction;
  societe = isoc;
  nat = inat;
  cin = icin;
  date = idate;

  return "";
}

List<String> sexes = ['Homme', 'Femme'];
List<String> nationality = [
  'Afghane',
  'Albanaise',
  'Algerienne',
  'Allmande',
  'Améericaine',
  'Angolaise',
  'Antiguaise et Barbudienne',
  'Argentine',
  'Armenienne',
  'Australienne',
  'Autrichienne',
  'Azerbaïdjanaise',
  'Bahamienne',
  'Baherinienne',
  'Bangladaise',
  'Barbadienne',
  'Belge',
  'Beninoise',
  'Bielorusse',
  'Birmane',
  'Bissao-Guineenne',
  'Bolivienne',
  'Bosnienne',
  'Botswanaise',
  'Bresilienne',
  'Britannique',
  'Bruneienne',
  'Bulgare',
  'Burkinabe',
  'Burundaise',
  'Cambodgienne',
  'Camerounaise',
  'Canadienne'
];

class editpassword extends State<Edit> {
  bool showPassword = false;

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
    Future updatepassword(int id, String password, String oldpassword) async {
      var Url = "http://10.0.2.2:8081/setpassword";
      var res = await http.post(Uri.parse(Url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {"id": id, "password": password, "oldpassword": oldpassword}));
      if (res.statusCode == 200) {
        List jsonResponse = json.decode(res.body);
        print(jsonResponse);

        print(id);
        print(jsonResponse);

        return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    }

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
            future: getfid(finalid),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Fidelys> data = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: data
                        .map(
                          (data) => Container(
                            padding:
                                EdgeInsets.only(left: 16, top: 20, right: 16),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "Changer mot de passe",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  buildTextField("Ancien mot de passe", " ", true,
                                      oldpasswordcontroller),
                                  buildTextField("Nouveau mot de passe", " ", false,
                                      newpasswordcontroller),
                                  buildTextField("Confirmer mot de passe", " ", false,
                                      confirmpasswordcontroller),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: RaisedButton(
                                            onPressed: () {
                                              if (newpasswordcontroller.text ==
                                                  confirmpasswordcontroller.text) {
                                                updatepassword(
                                                    data.id,
                                                    newpasswordcontroller.text,
                                                    oldpasswordcontroller.text);
                                                Fluttertoast.showToast(
                                                    msg: "Mot de passe changé",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            GestionProfile()));
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "Erreur",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            color: Colors.red[800],
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50),
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              "Confirmer",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  letterSpacing: 2.2,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}

class editApropos extends StatefulWidget {
  @override
  _editApropos createState() {
    // TODO: implement createState
    return _editApropos();
  }
}

class _editApropos extends State<editApropos> {
  bool isvisible = false;
  bool isvisible1 = false;
  bool isvisible2 = false;
  bool isvisible3 = false;
  bool isvisible4 = false;
  bool isvisible5 = false;
  bool isvisible6 = false;

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
    setState(() {});
    // TODO: implement build
    return FutureBuilder(
        future: getfid(finalid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Fidelys> data = snapshot.data;
            data
                .map((data) => setinitial(
                    data.firstname,
                    data.secondname,
                    data.email,
                    data.sexe,
                    data.tel,
                    data.adresse,
                    data.fonction,
                    data.societe,
                    data.cin,
                    data.birthdaydate,
                    data.nationalite))
                .toList();
            return SingleChildScrollView(
                child: Column(
                    children: data
                        .map((data) => Container(
                              child: Column(
                                children: [
                                  Padding(
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
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "Votre nom",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible =
                                                              !isvisible;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 60,
                                                          width: 300,
                                                          child: TextFormField(
                                                            autofocus: false,
                                                            controller:
                                                                nomcontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            //validator
                                                            onSaved: (value) {
                                                              nomcontroller
                                                                      .text =
                                                                  value!;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updatenom(
                                                                    data.id
                                                                        .toString(),
                                                                    nomcontroller
                                                                        .text);
                                                                setState(() {
                                                                  isvisible =
                                                                      !isvisible;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.firstname,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 15,
                                          thickness: 2,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "Votre prenom",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible1 =
                                                              !isvisible1;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible1,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 60,
                                                          width: 300,
                                                          child: TextFormField(
                                                            autofocus: false,
                                                            controller:
                                                                prenomcontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            //validator
                                                            onSaved: (value) {
                                                              prenomcontroller
                                                                      .text =
                                                                  value!;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updateprenom(
                                                                    data.id
                                                                        .toString(),
                                                                    prenomcontroller
                                                                        .text);
                                                                setState(() {
                                                                  isvisible1 =
                                                                      !isvisible1;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.secondname,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 15,
                                          thickness: 2,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "Votre email",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible2 =
                                                              !isvisible2;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible2,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 60,
                                                          width: 300,
                                                          child: TextFormField(
                                                            autofocus: false,
                                                            controller:
                                                                mailcontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            //validator
                                                            onSaved: (value) {
                                                              mailcontroller
                                                                      .text =
                                                                  value!;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updateemail(
                                                                    data.id
                                                                        .toString(),
                                                                    mailcontroller
                                                                        .text);
                                                                setState(() {
                                                                  isvisible2 =
                                                                      !isvisible2;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.email,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 15,
                                          thickness: 2,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "Date de naissance",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible4 =
                                                              !isvisible4;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible4,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                            height: 60,
                                                            width: 300,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  birthadaydateController,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .datetime,
                                                              onTap: () async {
                                                                DateTime?
                                                                    pickedDate =
                                                                    await showDatePicker(
                                                                        context:
                                                                            context,
                                                                        initialDate:
                                                                            DateTime
                                                                                .now(),
                                                                        firstDate:
                                                                            DateTime(
                                                                                1920), //DateTime.now() - not to allow to choose before today.
                                                                        lastDate:
                                                                            DateTime.now());

                                                                if (pickedDate !=
                                                                    null) {
                                                                  print(
                                                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                                  String
                                                                      formattedDate =
                                                                      DateFormat(
                                                                              'dd-MM-yyyy')
                                                                          .format(
                                                                              pickedDate);
                                                                  print(
                                                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                                                  //you can implement different kind of Date Format here according to your requirement

                                                                  setState(() {
                                                                    birthadaydateController
                                                                            .text =
                                                                        formattedDate; //set output date to TextField value.
                                                                  });
                                                                } else {
                                                                  print(
                                                                      "Date is not selected");
                                                                }
                                                              },
                                                            )),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updatedate(
                                                                    data.id
                                                                        .toString(),
                                                                    birthadaydateController
                                                                        .text);
                                                                setState(() {
                                                                  isvisible4 =
                                                                      !isvisible4;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.birthDaydate,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList()));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

class editApropos2 extends StatefulWidget {
  @override
  _editApropos2 createState() {
    // TODO: implement createState
    return _editApropos2();
  }
}

class _editApropos2 extends State<editApropos2> {
  bool isvisible = false;
  bool isvisible1 = false;
  bool isvisible2 = false;
  bool isvisible3 = false;
  bool isvisible4 = false;
  bool isvisible5 = false;
  bool isvisible6 = false;

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
    return FutureBuilder(
        future: getfid(finalid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Fidelys> data = snapshot.data;
            data
                .map((data) => setinitial(
                    data.firstname,
                    data.secondname,
                    data.email,
                    data.sexe,
                    data.tel,
                    data.adresse,
                    data.fonction,
                    data.societe,
                    data.cin,
                    data.birthdaydate,
                    data.nationalite))
                .toList();
            return SingleChildScrollView(
                child: Column(
                    children: data
                        .map((data) => Container(
                              child: Column(
                                children: [
                                  Padding(
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
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "CIN",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible =
                                                              !isvisible;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 60,
                                                          width: 300,
                                                          child: TextFormField(
                                                            autofocus: false,
                                                            controller:
                                                                cinController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            //validator
                                                            onSaved: (value) {
                                                              cinController
                                                                      .text =
                                                                  value!;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updatecin(
                                                                    data.id
                                                                        .toString(),
                                                                    cinController
                                                                        .text);
                                                                setState(() {
                                                                  isvisible =
                                                                      !isvisible;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.cin,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 15,
                                          thickness: 2,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "Fonction",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible2 =
                                                              !isvisible2;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible2,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 60,
                                                          width: 300,
                                                          child: TextFormField(
                                                            autofocus: false,
                                                            controller:
                                                                fonctioncontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            //validator
                                                            onSaved: (value) {
                                                              fonctioncontroller
                                                                      .text =
                                                                  value!;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updatefon(
                                                                    data.id
                                                                        .toString(),
                                                                    fonctioncontroller
                                                                        .text);
                                                                setState(() {
                                                                  isvisible2 =
                                                                      !isvisible2;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.fonction,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 15,
                                          thickness: 2,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "Societe",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible3 =
                                                              !isvisible3;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible3,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 60,
                                                          width: 300,
                                                          child: TextFormField(
                                                            autofocus: false,
                                                            controller:
                                                                soccontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            //validator
                                                            onSaved: (value) {
                                                              soccontroller
                                                                      .text =
                                                                  value!;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updatesoc(
                                                                    data.id
                                                                        .toString(),
                                                                    soccontroller
                                                                        .text);
                                                                setState(() {
                                                                  isvisible3 =
                                                                      !isvisible3;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.societe,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 15,
                                          thickness: 2,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight:
                                                      Radius.circular(24))),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        "Numero du telephone",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .red[800]),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isvisible4 =
                                                              !isvisible4;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.red[800],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                  visible: isvisible4,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24))),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 60,
                                                          width: 300,
                                                          child: TextFormField(
                                                            autofocus: false,
                                                            controller:
                                                                telcontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            //validator
                                                            onSaved: (value) {
                                                              telcontroller
                                                                      .text =
                                                                  value!;
                                                            },
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              onPressed: () {
                                                                updatetel(
                                                                    data.id
                                                                        .toString(),
                                                                    telcontroller
                                                                        .text);
                                                                setState(() {
                                                                  isvisible4 =
                                                                      !isvisible4;
                                                                });
                                                              },
                                                              color: Colors
                                                                  .red[800],
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              elevation: 2,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Text(
                                                                "Confirmer",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    letterSpacing:
                                                                        2.2,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    data.tel,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList()));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

class editprofile extends StatelessWidget {
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
        children: [editApropos(), editApropos2()],
      )),
    );
  }
}

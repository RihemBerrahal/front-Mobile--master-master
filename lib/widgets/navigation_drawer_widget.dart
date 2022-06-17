import 'dart:convert';
import 'package:currency_flutter/screens/achatBillet.dart';
import 'package:currency_flutter/screens/agencelistpage.dart';
import 'package:currency_flutter/screens/converssionMiles.dart';
import 'package:currency_flutter/screens/faq.dart';
import 'package:currency_flutter/screens/nouscontacter.dart';
import 'package:currency_flutter/screens/reclmation.dart';
import 'package:flutter/material.dart';
import 'package:currency_flutter/constants/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/textstyle.dart';
import '../model/fidelys.dart';
import '../screens/LogIn.dart';
import '../screens/achatMiles.dart';
import '../screens/gestiondeprofile.dart';
import '../screens/home_screen.dart';
import 'package:http/http.dart' as http;

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

class NavigationDrawerWidget extends StatefulWidget {
  Function(int x)? onChanged;

  NavigationDrawerWidget({Key? key, this.onChanged}) : super(key: key);

  @override
  _NavigationDrawerWidget createState() {
    // TODO: implement createState
    return _NavigationDrawerWidget();
  }
}

String finalid = "0";
late String title;

class _NavigationDrawerWidget extends State<NavigationDrawerWidget> {
  bool isvisible = false;
  final padding = EdgeInsets.symmetric(horizontal: 20);
  Future getvalidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('id');
    setState(() {
      finalid = userid!;
    });
    if (finalid == "0") {
      title = "Se connecter";
      isvisible;
    } else {
      title = "Mon profil Fidelys";
      isvisible = !isvisible;
    }
  }

  @override
  void initState() {
    getvalidationData();
    if (finalid == "0") {
      setState(() {
        title = "Se connecter";
      });
    } else {
      setState(() {
        title = "Mon profil Fidelys";
      });
    }

    super.initState();
  }

  Future logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('id', "0");
  }

  void login(BuildContext context) {
    setState(() {});
    if (finalid == "0") {
      title = "Se connecter";
      isvisible = false;
      setState(() {});
      Navigator.pop(context);
      widget.onChanged!(2);
      setState(() {});
    } else {
      setState(() {
        title = "Mon profil Fidelys";
      });
      isvisible = true;
      title = "Mon profil Fidelys";

      Navigator.pop(context);
      widget.onChanged!(2);
      setState(() {
        title = "Mon profil Fidelys";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ));
  }

  Widget buildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Image.asset("assets/images/fidelys.png"));

  Widget buildMenuItems(BuildContext context) => Wrap(
        children: [
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
                        (data) => Container(
                          height: 65,
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 65,
                                  child: Row(
                                    children: [
                                      Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Image.asset(
                                                data.banner),
                                            Positioned(
                                              top: 11,
                                              left: 4,
                                              child: Text(data.status,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  )),
                                            )
                                          ]),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              data.firstname +
                                                  " " +
                                                  data.secondname,
                                              style:
                                                  ApptextStyle.LISTTILE_TITLE),
                                          Text("ID : " + data.id.toString(),
                                              style: ApptextStyle
                                                  .LISTTILE_SUB_TITLE),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                )));
              }
              return Container(
                height: 65,
                child: Row(
                  children: [
                    SizedBox(
                        height: 65,
                        child: Row(
                          children: [
                            SizedBox(width: 80,),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Bienvenue",
                                    style: ApptextStyle.LISTTILE_TITLE),
                                Text("Invité",
                                    style: ApptextStyle.LISTTILE_SUB_TITLE),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              );
            },
          ),
          const Divider(
            color: Colors.black54,
            height: 0,
            thickness: 0.5,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(title),
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              setState(() {
                getvalidationData().whenComplete(() => widget.onChanged!(2));
              });
            },
          ),
          Visibility(
            visible: isvisible,
            child: ListTile(
              leading: const Icon(Icons.file_copy),
              title: const Text('Mes réclamations'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => recc(),
                    ));
                setState(() {});
              },
            ),
          ),
          Visibility(
            visible: isvisible,
            child: ListTile(
              leading: const Icon(Icons.airplane_ticket),
              title: const Text('Réserver/Acheter une billet Prime'),
              onTap: () {
                setState(() {});
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AchatBillet(),
                    ));
                setState(() {});
              },
            ),
          ),
          Visibility(
            visible: isvisible,
            child: ListTile(
              leading: const Icon(Icons.shopping_cart_rounded),
              title: const Text('Acheter des Miles'),
              onTap: () {
                setState(() {});
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AchatMiles(),
                    ));
                setState(() {});
              },
            ),
          ),
          Visibility(
            visible: isvisible,
            child: ListTile(
              leading: const Icon(Icons.loop_outlined),
              title: const Text('Converssion des Miles'),
              onTap: () {
                setState(() {});
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConverssionMiles(),
                    ));
                setState(() {});
              },
            ),
          ),
          Visibility(
            visible: isvisible,
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Se déconnecter'),
              onTap: () {
                logout();
                finalid = "0";
                title = "Login";
                setState(() {});
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                setState(() {});
              },
            ),
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.home_work_rounded),
            title: const Text('Nos agences'),
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgenceListPage(),
                  ));

              setState(() {});
            },
          ),
          ListTile(
              leading: const Icon(Icons.local_phone),
              title: const Text('Nous contacter'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contacter(),
                  ));
                
              }),
          const Divider(
            color: Colors.black54,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info & Services'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FAQ(),
                  ));
            },
          ),
        ],
      );
}

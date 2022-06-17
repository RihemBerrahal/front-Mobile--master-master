import 'dart:convert';
import 'package:path/path.dart' as Path;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/fidelys.dart';
import '../widgets/navigation_drawer_widget.dart';

import 'SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';


class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new screenLog());
  }
}

/*if (res.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: "backend response", content: res.body);
      },
    );
    Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }*/

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog(
      {required this.title, required this.content, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

class screenLog extends StatelessWidget {
  final TextEditingController emailContoller = new TextEditingController();
  final TextEditingController passwordContoller = new TextEditingController();
  BuildContext? context;
  final _formKey = GlobalKey<FormState>();
  //fidelys user = fidelys(id: null,"","","","","", );
  String url = "http://10.0.2.2:8081/login";
  /*Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
  }*/

  Future addFidelys(String email, String password, BuildContext context) async {
    var Url = "http://10.0.2.2:8081/login1";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }));
    String responseStr = res.body;
    if (res.statusCode == 200) {
      if (res.body == "0") {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(title: "backend response", content: '');
          },
        );
      } else {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('id', res.body);
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }
      /*showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: "backend response", content: res.body);
      },
    );*/
      /*Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));*/
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: "backend response", content: "invalid mail or password");
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //email filed
    final emailField = TextFormField(
      autofocus: false,
      controller: emailContoller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value))
          return 'Saisissez un e-mail valide';
        return null;
      },
      onSaved: (value) {
        emailContoller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        hintText: "Adresse e-mail",
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

    //password filed
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordContoller,
      obscureText: true,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ('password is required for loqin');
        }
        if (!regExp.hasMatch(value)) {
          return ("please enter valid password (Min 6 charchter)");
        }
      },
      onSaved: (value) {
        passwordContoller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        hintText: "Mot de passe",
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

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(80),
      color: Colors.red[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            // save();
            addFidelys(emailContoller.text, passwordContoller.text, context);
          },
          child: Text(
            "Se connecter",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
    );

    return Scaffold(
      
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                      ),
                      emailField,
                      SizedBox(
                        height: 25,
                      ),
                      passwordField,
                      SizedBox(
                        height: 35,
                      ),
                      loginButton,
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Pas encore Fidelys? ",style: TextStyle(
                                  fontSize: 17)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "S'inscrire",
                              style: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17  ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class modificationdesdonnes extends StatefulWidget {
  @override
  _modi createState() {
    return _modi();
  }
}

class _modi extends State<modificationdesdonnes> {
  late String finalid;
  Future getvalidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('id');
    setState(() {
      finalid = userid!;
    });
    print(finalid);
  }

  Future getfidelys(int id) async {
    var res = await http.post(Uri.parse("http://10.0.2.2:8081/getfidelys"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, int>{"id": id}));
    if (res.statusCode == 200) {
      List jsonResponse = json.decode(res.body);
      return jsonResponse.map((data) => new Fidelys.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
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
        future: getfidelys(int.parse(finalid)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Fidelys> data = snapshot.data;
            return Container(
              child: Column(
                  children: data.map<Widget>((data) => Scaffold()).toList()),
            );
          }
          return CircularProgressIndicator();
        });
  }
}

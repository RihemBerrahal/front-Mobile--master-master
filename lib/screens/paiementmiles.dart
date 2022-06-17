import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


String price1 = '';
String miles1 = '';
String finalid = '0';


 Future achetermiles(String id, String solde) async {
    var Url = "http://10.0.2.2:8081/achatmiles";
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
class PaymentMiles extends StatefulWidget {


  String price = '';
  String miles = '';

  PaymentMiles(String price, String miles) {
    price1 = price;
    miles1 = miles;
  }

  @override
  State<PaymentMiles> createState() => _PaymentMilesState();
}

class _PaymentMilesState extends State<PaymentMiles> {

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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250),
            Text(
              "Vous allez payer : " + price1.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(140, 40),
                    textStyle: TextStyle(fontSize: 19)),
                child: Text("Paiement réussi"),
                onPressed: () {
                  print(miles1);
                  achetermiles(finalid, miles1);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: Text("Félicitations !"),
                          content:
                              Text(miles1 + " ont été ajouté à votre compte")));
                }),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(140, 40),
                    textStyle: TextStyle(fontSize: 19)),
                child: Text("Paiement échoué"),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

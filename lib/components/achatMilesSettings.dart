
import 'dart:convert';

import 'package:currency_flutter/screens/paiementmilesq.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../functions/fetchrates.dart';
import '../screens/paiementmiles.dart';
import 'package:http/http.dart' as http;

String finalid = '0';
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


class AchatMilesSettings extends StatefulWidget {
  final rates;
  final Map currencies;
  const AchatMilesSettings(
      {Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  _AchatMilesSettingsState createState() => _AchatMilesSettingsState();
}


class _AchatMilesSettingsState extends State<AchatMilesSettings> {

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
  TextEditingController amountController = TextEditingController();

  String milesachete = '100';
  String dropdownValue1 = 'TND';
  String dropdownValue2 = 'TND';
  String answer = '1 TND = 1.00 TND';
  double taux = 0;
  double tndvalue = 0;
  double pricedevise = 0;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      // width: w / 3,
      padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Nature des Miles : ", style: TextStyle(fontSize: 19)),
          SizedBox(
            height: 10,
          ),

          //TextFields for Entering USD
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                costumRadio("Miles Prime", 1),
                SizedBox(width: 10),
                costumRadio("Miles Qualifiant", 2)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Prix unitaire en TND : ", style: TextStyle(fontSize: 19)),
              Text(price.toStringAsFixed(3), style: TextStyle(fontSize: 19))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Nombre des Miles : ", style: TextStyle(fontSize: 19)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                    child: DropdownButton<String>(
                        value: selectedItem,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        items: miles
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 19))))
                            .toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedItem = item!;
                            milesachete = selectedItem;
                          });
                          if (selectedItem == '100') {
                            tndprice = price * 100;
                          } else if (selectedItem == '500') {
                            tndprice = price * 500;
                          } else if (selectedItem == '1000') {
                            tndprice = price * 1000;
                          } else if (selectedItem == '2500') {
                            tndprice = price * 2500;
                          } else if (selectedItem == '5000') {
                            tndprice = price * 5000;
                          } else if (selectedItem == '10000') {
                            tndprice = price * 10000;
                          }
                          String s = convertany(widget.rates, '1',
                              dropdownValue1, dropdownValue2);
                          taux = double.parse(s);
                          pricedevise = tndprice / taux;
                        })),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Devise : ", style: TextStyle(fontSize: 19)),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  iconSize: 24,
                  elevation: 16,
                  isExpanded: true,
                  underline: Container(
                    height: 2,
                    color: Colors.grey.shade400,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                      answer = '1' +
                          ' ' +
                          dropdownValue1 +
                          ' = ' +
                          convertany(widget.rates, '1', dropdownValue1,
                              dropdownValue2) +
                          ' ' +
                          dropdownValue2;
                      String s = convertany(
                          widget.rates, '1', dropdownValue1, dropdownValue2);
                      taux = double.parse(s);
                      pricedevise = tndprice / taux;
                    });
                  },
                  items: widget.currencies.keys
                      .toSet()
                      .toList()
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          Container(
              child: Text("   " + answer, style: TextStyle(fontSize: 14))),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              Text("Valeur en devise :       ", style: TextStyle(fontSize: 19)),
              Text(pricedevise.toStringAsFixed(3),
                  style: TextStyle(fontSize: 19))
            ],
          ),

          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text("Valeur en TND :           ",
                  style: TextStyle(fontSize: 19)),
              Text(tndprice.toStringAsFixed(3), style: TextStyle(fontSize: 19))
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(140, 40),
                      textStyle: TextStyle(fontSize: 19)),
                  child: Text("Acheter"),
                  onPressed: () {
                    if (selected == 0) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text("Erreur"),
                              content: Text(
                                  "Veuillez spécifier le type des Miles"),actions: [

                                      TextButton(
                                          child: Text("OK"),
                                          onPressed: () =>
                                              Navigator.pop(context)),
                                  
                                  ],),
                                  );
                    } else {
                      print(milesachete);
                      if (selected == 1) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMiles(
                                  pricedevise.toStringAsFixed(3), milesachete)),
                        );
                      }
                     else if (selected == 2) {

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMilesQ(
                                  pricedevise.toStringAsFixed(3), milesachete)),
                        );
                        
                      }
                      
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  int selected = 0;

  Widget costumRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
        if (selected == 1) {
          price = 0.7;
        } else if ((selected == 2)) {
          price = 0.14;
        }
        if (selectedItem == '100') {
          tndprice = price * 100;
        } else if (selectedItem == '500') {
          tndprice = price * 500;
        } else if (selectedItem == '1000') {
          tndprice = price * 1000;
        } else if (selectedItem == '2500') {
          tndprice = price * 2500;
        } else if (selectedItem == '5000') {
          tndprice = price * 5000;
        } else if (selectedItem == '10000') {
          tndprice = price * 10000;
        }
        String s =
            convertany(widget.rates, '1', dropdownValue1, dropdownValue2);
        taux = double.parse(s);
        pricedevise = tndprice / taux;
      },
      child: Text(text,
          style: TextStyle(
            color: (selected == index) ? Color(0xFFD80404) : Colors.blueGrey,
          )),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(
            color: (selected == index) ? Color(0xFFD80404) : Colors.blueGrey,
          )),
    );
  }

  String selectedItem = '100';
  double price = 0;
  double tndprice = 0;
  List<String> miles = ['100', '500', '1000', '2500', '5000', '10000'];
}

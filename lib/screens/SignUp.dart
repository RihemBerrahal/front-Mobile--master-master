import 'dart:convert';

import 'package:currency_flutter/screens/LogIn.dart';
import 'package:currency_flutter/screens/activerCompte.dart';
import 'package:currency_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/navigation_drawer_widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() {
    // TODO: implement createState
    return _SignUp();
  }

  const SignUp({Key? Key}) : super(key: Key);
}

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

class _SignUp extends State<SignUp> {
  Future addFidelys(
      String firstname,
      String secondname,
      String birthdaydate,
      String email,
      String password,
      String adresse,
      String ville,
      String codepostal,
      String tel,
      String teldom,
      String societe,
      String fonction,
      String telpro,
      String fax,
      String sexe,
      String nationalite,
      String cin,
      String typeadhesion,
      String autrefidelisation,
      String idmmbre1,
      String idmmbre2,
      String idmmbre3,
      String assitnace,
      String numeroduvol,
      String numrodebillet,
      String pointdevente,
      String agence,
      String lastflight,
      String cabine,
      String repas,
      String pays,
      String habitude,
      String payment,
      String classe,
      BuildContext context) async {
    var Url = "http://10.0.2.2:8081/register";
    var res = await http.post(Uri.parse(Url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "firstname": firstname,
          "secondname": secondname,
          "birthdaydate": birthdaydate,
          "email": email,
          "password": password,
          "adresse": adresse,
          "ville": ville,
          "tel": tel,
          "teldom": teldom,
          "societe": societe,
          "fonction": fonction,
          "codepostal": codepostal,
          "telpro": telpro,
          "fax": fax,
          "sexe": sexe,
          "nationalite": nationalite,
          "cin": cin,
          "typeadhesion": typeadhesion,
          "autrefidelisation": autrefidelisation,
          "idmmbre1": idmmbre1,
          "idmmbre2": idmmbre2,
          "idmmbre3": idmmbre3,
          "assitnace": assitnace,
          "numeroduvol": numeroduvol,
          "pointdevente": pointdevente,
          "agence": agence,
          "lastflight": lastflight,
          "cabine": cabine,
          "pays": pays,
          "habitude": habitude,
          "payment": payment,
          "classe": classe
        }));
    String responseStr = res.body;
    print(res.body);
    if (res.statusCode == 200) {
      if (res.body == "0") {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(title: 'Erreur', content: 'Compte deja exist');
          },
        );
      } else {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('id', res.body);
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(
                title: 'Compte cr???? avec succ??s',
                content: 'Bienvenue ?? Fidelys');
          },
        );
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
              title: "backend response", content: "invalid mail");
        },
      );
    }
  }

  late String sexevalue;
  late String natvalue;
  late String paysvalue;
  late String typevalue;
  late String siegevalue;
  late String repas1value;
  late String classe1value;
  late String payment1value;
  late String habitude1value;

  final formKey = GlobalKey<FormState>();
  //editing controller
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final birthadaydateController = TextEditingController();
  final adresseController = TextEditingController();
  final telController = TextEditingController();
  final villeController = TextEditingController();
  final codepostalController = TextEditingController();
  final societeController = TextEditingController();
  final fonctionController = TextEditingController();
  final faxController = TextEditingController();
  final telproController = TextEditingController();
  // final sexeController = TextEditingController();
  // final natController = TextEditingController();
  //final typeadhController = TextEditingController();
  final cinController = TextEditingController();
  final autrefidelController = TextEditingController();
  final idmmbre1Controller = TextEditingController();
  final idmmbre2Controller = TextEditingController();
  final idmmbre3Controller = TextEditingController();
  final assitanceController = TextEditingController();
  final numbilletController = TextEditingController();
  final agenceController = TextEditingController();
  final pointduventeController = TextEditingController();
  final numduvolController = TextEditingController();
  final numeroFielddomController = TextEditingController();
  final siteController = TextEditingController();
  final lastflightController = TextEditingController();
  String _selectedlangue = 'Fran??ais';
  @override
  Widget build(BuildContext context) {
    String dropdownValue = '';
    List<String> sexes = ['Homme', 'Femme'];
    List<String> types = ['Adh??sion individuelle', 'Adh??sion familiale'];

    // String? selectSexe = 'Homme';
    // String? valeur = 'Adh??sion individuelle';

    /* final sexe = DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Sexe",
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
      value: selectSexe,
      isDense: true,
      items: sexes
          .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 17),
              )))
          .toList(),

      /* onChanged: (value) {
          setState(() {
            selectSexe = value.toString();
          });
          print(selectSexe);
        },*/

      onChanged: /*(newValue) {
        (item) => setState(() => selectSexe = newValue.toString());
        print(newValue.toString());
      },*/
          (item) => setState(() => selectSexe = item),
    );*/
    String natdropdown = '';
    String typedadhesionvalue = '';
    String cabinevalue = '';
    String repasvalue = '';
    String paysdropdown = '';
    String habitudevalue = '';
    String paymentvalue = '';
    String classevalue = '';

    final nat = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.language,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Nationalit??",
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
      value: natdropdown,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text(
              "--Choisissez votre nationalit??--",
              style: TextStyle(fontSize: 15),
            ),
            value: ''),
        DropdownMenuItem<String>(child: Text("Afghane"), value: 'Afghane'),
        DropdownMenuItem<String>(child: Text("Albanaise"), value: 'Albanaise'),
        DropdownMenuItem<String>(
            child: Text("Alg??rienne"), value: 'Alg??rienne'),
        DropdownMenuItem<String>(child: Text("Allemande"), value: 'Allemande'),
        DropdownMenuItem<String>(
            child: Text("Am??ricaine"), value: 'Am??ricaine'),
        DropdownMenuItem<String>(child: Text("Andorrane"), value: 'Andorrane'),
        DropdownMenuItem<String>(child: Text("Angolaise"), value: 'Angolaise'),
        DropdownMenuItem<String>(
            child: Text("Antiguaise et Barbudienne"),
            value: 'Antiguaise et Barbudienne'),
        DropdownMenuItem<String>(child: Text("Argentine"), value: 'Argentine'),
        DropdownMenuItem<String>(
            child: Text("Arm??nienne"), value: 'Arm??nienne'),
        DropdownMenuItem<String>(
            child: Text("Australienne"), value: 'Australienne'),
        DropdownMenuItem<String>(
            child: Text("Autrichienne"), value: 'Autrichienne'),
        DropdownMenuItem<String>(
            child: Text("Azerba??djanaise"), value: 'Azerba??djanaise'),
        DropdownMenuItem<String>(
            child: Text("Bahamienne"), value: 'Bahamienne'),
        DropdownMenuItem<String>(
            child: Text("Bahreinienne"), value: 'Bahreinienne'),
        DropdownMenuItem<String>(
            child: Text("Bangladaise"), value: 'Bangladaise'),
        DropdownMenuItem<String>(
            child: Text("Barbadienne"), value: 'Barbadienne'),
        DropdownMenuItem<String>(child: Text("Belge"), value: 'Belge'),
        DropdownMenuItem<String>(
            child: Text("B??lizienne"), value: 'B??lizienne'),
        DropdownMenuItem<String>(child: Text("B??ninoise"), value: 'B??ninoise'),
        DropdownMenuItem<String>(
            child: Text("Bhoutanaise"), value: 'Bhoutanaise'),
        DropdownMenuItem<String>(
            child: Text("Bi??lorusse"), value: 'Bi??lorusse'),
        DropdownMenuItem<String>(child: Text("Birmane"), value: 'Birmane'),
        DropdownMenuItem<String>(
            child: Text("Bissao-Guin??enne"), value: 'Bissao-Guin??enne'),
        DropdownMenuItem<String>(
            child: Text("Bolivienne"), value: 'Bolivienne'),
        DropdownMenuItem<String>(child: Text("Bosnienne"), value: 'Bosnienne'),
        DropdownMenuItem<String>(
            child: Text("Botswanaise"), value: 'Botswanaise'),
        DropdownMenuItem<String>(
            child: Text("Br??silienne"), value: 'Br??silienne'),
        DropdownMenuItem<String>(
            child: Text("Britannique"), value: 'Britannique'),
        DropdownMenuItem<String>(
            child: Text("Bruneienne"), value: 'Bruneienne'),
        DropdownMenuItem<String>(child: Text("Bulgare"), value: 'Bulgare'),
        DropdownMenuItem<String>(child: Text("Burkinab??"), value: 'Burkinab??'),
        DropdownMenuItem<String>(
            child: Text("Burundaise"), value: 'Burundaise'),
        DropdownMenuItem<String>(
            child: Text("Cambodgienne"), value: 'Cambodgienne'),
        DropdownMenuItem<String>(
            child: Text("Camerounaise"), value: 'Camerounaise'),
        DropdownMenuItem<String>(
            child: Text("Canadienne"), value: 'Canadienne'),
        DropdownMenuItem<String>(
            child: Text("Cap-verdienne"), value: 'Cap-verdienne'),
        DropdownMenuItem<String>(
            child: Text("Centrafricaine"), value: 'Centrafricaine'),
        DropdownMenuItem<String>(child: Text("Chilienne"), value: 'Chilienne'),
        DropdownMenuItem<String>(child: Text("Chinoise"), value: 'Chinoise'),
        DropdownMenuItem<String>(child: Text("Chypriote"), value: 'Chypriote'),
        DropdownMenuItem<String>(
            child: Text("Colombienne"), value: 'Colombienne'),
        DropdownMenuItem<String>(
            child: Text("Comorienne"), value: 'Comorienne'),
        DropdownMenuItem<String>(
            child: Text("Congolaise"), value: 'Congolaise'),
        DropdownMenuItem<String>(
            child: Text("Congolaise (kinshasa"), value: 'Congolaise (kinshasa'),
        DropdownMenuItem<String>(
            child: Text("Costaricaine"), value: 'Costaricaine'),
        DropdownMenuItem<String>(child: Text("Croate"), value: 'Croate'),
        DropdownMenuItem<String>(child: Text("Cubaine"), value: 'Cubaine'),
        DropdownMenuItem<String>(child: Text("Danoise"), value: 'Danoise'),
        DropdownMenuItem<String>(
            child: Text("Djiboutienne"), value: 'Djiboutienne'),
        DropdownMenuItem<String>(
            child: Text("Dominicaine"), value: 'Dominicaine'),
        DropdownMenuItem<String>(
            child: Text("Dominiquaise"), value: 'Dominiquaise'),
        DropdownMenuItem<String>(
            child: Text("Egyptienne"), value: 'Egyptienne'),
        DropdownMenuItem<String>(child: Text("Emirienne"), value: 'Emirienne'),
        DropdownMenuItem<String>(
            child: Text("Equato-guin??enne"), value: 'Equato-guin??enne'),
        DropdownMenuItem<String>(
            child: Text("Equatorienne"), value: 'Equatorienne'),
        DropdownMenuItem<String>(
            child: Text("Erythr??enne"), value: 'Erythr??enne'),
        DropdownMenuItem<String>(child: Text("Espagnole"), value: 'Espagnole'),
        DropdownMenuItem<String>(
            child: Text("Estonienne"), value: 'Estonienne'),
        DropdownMenuItem<String>(
            child: Text("Est-timoraise"), value: 'Est-timoraise'),
        DropdownMenuItem<String>(
            child: Text("Ethiopienne"), value: 'Ethiopienne'),
        DropdownMenuItem<String>(child: Text("Fidjienne"), value: 'Fidjienne'),
        DropdownMenuItem<String>(
            child: Text("Finlandaise"), value: 'Finlandaise'),
        DropdownMenuItem<String>(child: Text("Fran??aise"), value: 'Fran??aise'),
        DropdownMenuItem<String>(child: Text("Gabonaise"), value: 'Gabonaise'),
        DropdownMenuItem<String>(child: Text("Gambienne"), value: 'Gambienne'),
        DropdownMenuItem<String>(
            child: Text("Georgienne"), value: 'Georgienne'),
        DropdownMenuItem<String>(child: Text("Ghan??enne"), value: 'Ghan??enne'),
        DropdownMenuItem<String>(
            child: Text("Grenadienne"), value: 'Grenadienne'),
        DropdownMenuItem<String>(
            child: Text("Guatemalt??que"), value: 'Guatemalt??que'),
        DropdownMenuItem<String>(child: Text("Guin??enne"), value: 'Guin??enne'),
        DropdownMenuItem<String>(
            child: Text("Guin??enne (Guyana)"), value: 'Guin??enne (Guyana)'),
        DropdownMenuItem<String>(
            child: Text("Guyanienne"), value: 'Guyanienne'),
        DropdownMenuItem<String>(child: Text("Ha??tienne"), value: 'Ha??tienne'),
        DropdownMenuItem<String>(
            child: Text("Hell??nique"), value: 'Hell??nique'),
        DropdownMenuItem<String>(
            child: Text("Hondurienne"), value: 'Hondurienne'),
        DropdownMenuItem<String>(child: Text("Hongroise"), value: 'Hongroise'),
        DropdownMenuItem<String>(child: Text("Indienne"), value: 'Indienne'),
        DropdownMenuItem<String>(
            child: Text("Indon??sienne"), value: 'Indon??sienne'),
        DropdownMenuItem<String>(child: Text("Irakienne"), value: 'Irakienne'),
        DropdownMenuItem<String>(child: Text("Iranienne"), value: 'Iranienne'),
        DropdownMenuItem<String>(
            child: Text("Irlandaise"), value: 'Irlandaise'),
        DropdownMenuItem<String>(
            child: Text("Islandaise"), value: 'Islandaise'),
        DropdownMenuItem<String>(
            child: Text("Isra??lienne"), value: 'Isra??lienne'),
        DropdownMenuItem<String>(child: Text("Italienne"), value: 'Italienne'),
        DropdownMenuItem<String>(
            child: Text("Ivoirienne"), value: 'Ivoirienne'),
        DropdownMenuItem<String>(
            child: Text("Jama??caine"), value: 'Jama??caine'),
        DropdownMenuItem<String>(child: Text("Japonaise"), value: 'Japonaise'),
        DropdownMenuItem<String>(
            child: Text("Jordanienne"), value: 'Jordanienne'),
        DropdownMenuItem<String>(
            child: Text("Kazakhstanaise"), value: 'Kazakhstanaise'),
        DropdownMenuItem<String>(child: Text("Kenyane"), value: 'Kenyane'),
        DropdownMenuItem<String>(child: Text("Kirghize"), value: 'Kirghize'),
        DropdownMenuItem<String>(
            child: Text("Kiribatienne"), value: 'Kiribatienne'),
        DropdownMenuItem<String>(
            child: Text("Kittitienne-et-n??vicienne"),
            value: 'Kittitienne-et-n??vicienne'),
        DropdownMenuItem<String>(
            child: Text("Koweitienne"), value: 'Koweitienne'),
        DropdownMenuItem<String>(child: Text("Laotienne"), value: 'Laotienne'),
        DropdownMenuItem<String>(child: Text("Lesothane"), value: 'Lesothane'),
        DropdownMenuItem<String>(child: Text("Lettone"), value: 'Lettone'),
        DropdownMenuItem<String>(child: Text("Libanaise"), value: 'Libanaise'),
        DropdownMenuItem<String>(
            child: Text("Lib??rienne"), value: 'Lib??rienne'),
        DropdownMenuItem<String>(child: Text("Libyenne"), value: 'Libyenne'),
        DropdownMenuItem<String>(
            child: Text("Liechtensteinoise"), value: 'Liechtensteinoise'),
        DropdownMenuItem<String>(
            child: Text("Lituanienne"), value: 'Lituanienne'),
        DropdownMenuItem<String>(
            child: Text("Luxembourgeoise"), value: 'Luxembourgeoise'),
        DropdownMenuItem<String>(
            child: Text("Mac??donienne"), value: 'Mac??donienne'),
        DropdownMenuItem<String>(
            child: Text("Malaisienne"), value: 'Malaisienne'),
        DropdownMenuItem<String>(
            child: Text("Malawienne"), value: 'Malawienne'),
        DropdownMenuItem<String>(
            child: Text("Maldivienne"), value: 'Maldivienne'),
        DropdownMenuItem<String>(child: Text("Malgache"), value: 'Malgache'),
        DropdownMenuItem<String>(child: Text("Malienne"), value: 'Malienne'),
        DropdownMenuItem<String>(child: Text("Maltaise"), value: 'Maltaise'),
        DropdownMenuItem<String>(child: Text("Marocaine"), value: 'Marocaine'),
        DropdownMenuItem<String>(
            child: Text("Marshallaise"), value: 'Marshallaise'),
        DropdownMenuItem<String>(
            child: Text("Mauricienne"), value: 'Mauricienne'),
        DropdownMenuItem<String>(
            child: Text("Mauritanienne"), value: 'Mauritanienne'),
        DropdownMenuItem<String>(child: Text("Mexicaine"), value: 'Mexicaine'),
        DropdownMenuItem<String>(
            child: Text("Micron??sienne"), value: 'Micron??sienne'),
        DropdownMenuItem<String>(child: Text("Moldave"), value: 'Moldave'),
        DropdownMenuItem<String>(
            child: Text("Mon??gasque"), value: 'Mon??gasque'),
        DropdownMenuItem<String>(child: Text("Mongole"), value: 'Mongole'),
        DropdownMenuItem<String>(
            child: Text("Mont??n??grine"), value: 'Mont??n??grine'),
        DropdownMenuItem<String>(
            child: Text("Mozambicaine"), value: 'Mozambicaine'),
        DropdownMenuItem<String>(
            child: Text("Namibienne"), value: 'Namibienne'),
        DropdownMenuItem<String>(child: Text("Nauruane"), value: 'Nauruane'),
        DropdownMenuItem<String>(
            child: Text("N??erlandaise"), value: 'N??erlandaise'),
        DropdownMenuItem<String>(
            child: Text("Neo-z??landaise"), value: 'Neo-z??landaise'),
        DropdownMenuItem<String>(child: Text("N??palaise"), value: 'N??palaise'),
        DropdownMenuItem<String>(
            child: Text("Nicaraguayenne"), value: 'Nicaraguayenne'),
        DropdownMenuItem<String>(child: Text("Nig??riane"), value: 'Nig??riane'),
        DropdownMenuItem<String>(
            child: Text("Nig??rienne"), value: 'Nig??rienne'),
        DropdownMenuItem<String>(
            child: Text("Nord-cor??enne"), value: 'Nord-cor??enne'),
        DropdownMenuItem<String>(
            child: Text("Norv??gienne"), value: 'Norv??gienne'),
        DropdownMenuItem<String>(child: Text("Omanaise"), value: 'Omanaise'),
        DropdownMenuItem<String>(
            child: Text("Ougandaise"), value: 'Ougandaise'),
        DropdownMenuItem<String>(child: Text("Ouzbeke"), value: 'Ouzbeke'),
        DropdownMenuItem<String>(
            child: Text("Pakistanaise"), value: 'Pakistanaise'),
        DropdownMenuItem<String>(child: Text("Palau"), value: 'Palau'),
        DropdownMenuItem<String>(
            child: Text("Palestinienne"), value: 'Palestinienne'),
        DropdownMenuItem<String>(
            child: Text("Panam??enne"), value: 'Panam??enne'),
        DropdownMenuItem<String>(
            child: Text("Papouane-neoguin??enne"),
            value: 'Papouane-neoguin??enne'),
        DropdownMenuItem<String>(
            child: Text("Paraguayenne"), value: 'Paraguayenne'),
        DropdownMenuItem<String>(
            child: Text("P??ruvienne"), value: 'P??ruvienne'),
        DropdownMenuItem<String>(
            child: Text("Philippine"), value: 'Philippine'),
        DropdownMenuItem<String>(child: Text("Polonaise"), value: 'Polonaise'),
        DropdownMenuItem<String>(
            child: Text("Portoricaine"), value: 'Portoricaine'),
        DropdownMenuItem<String>(
            child: Text("Portugaise"), value: 'Portugaise'),
        DropdownMenuItem<String>(
            child: Text("Qatarienne"), value: 'Qatarienne'),
        DropdownMenuItem<String>(child: Text("Roumaine"), value: 'Roumaine'),
        DropdownMenuItem<String>(child: Text("Russe"), value: 'Russe'),
        DropdownMenuItem<String>(child: Text("Rwandaise"), value: 'Rwandaise'),
        DropdownMenuItem<String>(
            child: Text("Saint-Lucienne"), value: 'Saint-Lucienne'),
        DropdownMenuItem<String>(
            child: Text("Saint-Marinaise"), value: 'Saint-Marinaise'),
        DropdownMenuItem<String>(
            child: Text("Saint-Vincentaise-et-Grenadine"),
            value: 'Saint-Vincentaise-et-Grenadine'),
        DropdownMenuItem<String>(
            child: Text("Salomonaise"), value: 'Salomonaise'),
        DropdownMenuItem<String>(
            child: Text("Salvadorienne"), value: 'Salvadorienne'),
        DropdownMenuItem<String>(
            child: Text("Saoudienne"), value: 'Saoudienne'),
        DropdownMenuItem<String>(child: Text("Samoane"), value: 'Samoane'),
        DropdownMenuItem<String>(
            child: Text("Santom??enne"), value: 'Santom??enne'),
        DropdownMenuItem<String>(
            child: Text("Saoudienne"), value: 'Saoudienne'),
        DropdownMenuItem<String>(
            child: Text("S??n??galaise"), value: 'S??n??galaise'),
        DropdownMenuItem<String>(child: Text("Serbe"), value: 'Serbe'),
        DropdownMenuItem<String>(
            child: Text("Seychelloise"), value: 'Seychelloise'),
        DropdownMenuItem<String>(
            child: Text("Sierra-leonaise"), value: 'Sierra-leonaise'),
        DropdownMenuItem<String>(
            child: Text("Singapourienne"), value: 'Singapourienne'),
        DropdownMenuItem<String>(child: Text("Slovaque"), value: 'Slovaque'),
        DropdownMenuItem<String>(child: Text("Slov??ne"), value: 'Slov??ne'),
        DropdownMenuItem<String>(
            child: Text("Somalienne"), value: 'Somalienne'),
        DropdownMenuItem<String>(
            child: Text("Soudanaise"), value: 'Soudanaise'),
        DropdownMenuItem<String>(
            child: Text("Sri-lankaise"), value: 'Sri-lankaise'),
        DropdownMenuItem<String>(
            child: Text("Sud soudanaise"), value: 'Sud soudanaise'),
        DropdownMenuItem<String>(
            child: Text("Sud-africaine"), value: 'Sud-africaine'),
        DropdownMenuItem<String>(
            child: Text("Sud-cor??enne"), value: 'Sud-cor??enne'),
        DropdownMenuItem<String>(child: Text("Su??doise"), value: 'Su??doise'),
        DropdownMenuItem<String>(child: Text("Suisse"), value: 'Suisse'),
        DropdownMenuItem<String>(
            child: Text("Surinamaise"), value: 'Surinamaise'),
        DropdownMenuItem<String>(child: Text("Syrienne"), value: 'Syrienne'),
        DropdownMenuItem<String>(child: Text("Tadjike"), value: 'Tadjike'),
        DropdownMenuItem<String>(
            child: Text("Taiwanaise"), value: 'Taiwanaise'),
        DropdownMenuItem<String>(
            child: Text("Tanzanienne"), value: 'Tanzanienne'),
        DropdownMenuItem<String>(
            child: Text("Tchadienne"), value: 'Tchadienne'),
        DropdownMenuItem<String>(child: Text("Tch??que"), value: 'Tch??que'),
        DropdownMenuItem<String>(
            child: Text("Tha??landaise"), value: 'Tha??landaise'),
        DropdownMenuItem<String>(child: Text("Togolaise"), value: 'Togolaise'),
        DropdownMenuItem<String>(child: Text("Tongienne"), value: 'Tongienne'),
        DropdownMenuItem<String>(
            child: Text("Trinidadienne"), value: 'Trinidadienne'),
        DropdownMenuItem<String>(
            child: Text("Tunisienne"), value: 'Tunisienne'),
        DropdownMenuItem<String>(child: Text("Turkm??ne"), value: 'Turkm??ne'),
        DropdownMenuItem<String>(child: Text("Turque"), value: 'Turque'),
        DropdownMenuItem<String>(child: Text("Tuvaluane"), value: 'Tuvaluane'),
        DropdownMenuItem<String>(
            child: Text("Ukrainienne"), value: 'Ukrainienne'),
        DropdownMenuItem<String>(
            child: Text("Uruguayenne"), value: 'Uruguayenne'),
        DropdownMenuItem<String>(
            child: Text("Vanuatuane"), value: 'Vanuatuane'),
        DropdownMenuItem<String>(
            child: Text("V??n??zu??lienne"), value: 'V??n??zu??lienne'),
        DropdownMenuItem<String>(
            child: Text("Vietnamienne"), value: 'Vietnamienne'),
        DropdownMenuItem<String>(child: Text("Y??m??nite"), value: 'Y??m??nite'),
        DropdownMenuItem<String>(child: Text("Zambienne"), value: 'Zambienne'),
        DropdownMenuItem<String>(
            child: Text("Zimbabw??enne"), value: 'Zimbabw??enne'),
      ],
      onChanged: (String? value) {
        setState(() {
          natdropdown = value.toString();
          natvalue = natdropdown;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },

      /* onChanged: (newValue) {
        (item) => setState(() => selectedItem = newValue.toString());
        print(newValue.toString());
        print(selectedItem);
      }, */
    );
    final pays = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.language,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Pays",
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
      value: paysdropdown,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text("--Choisissez votre pays--"), value: ''),
        DropdownMenuItem<String>(
            child: Text("Afrique du Sud"), value: 'Afrique du Sud'),
        DropdownMenuItem<String>(
            child: Text("Afghanistan"), value: 'Afghanistan'),
        DropdownMenuItem<String>(child: Text("Albanie"), value: 'Albanie'),
        DropdownMenuItem<String>(child: Text("Alg??rie"), value: 'Alg??rie'),
        DropdownMenuItem<String>(child: Text("Allemagne"), value: 'Allemagne'),
        DropdownMenuItem<String>(child: Text("Andorre"), value: 'Andorre'),
        DropdownMenuItem<String>(child: Text("Angola"), value: 'Angola'),
        DropdownMenuItem<String>(
            child: Text("Antigua-et-Barbuda"), value: 'Antigua-et-Barbuda'),
        DropdownMenuItem<String>(
            child: Text("Arabie Saoudite"), value: 'Arabie Saoudite'),
        DropdownMenuItem<String>(child: Text("Argentine"), value: 'Argentine'),
        DropdownMenuItem<String>(child: Text("Arm??nie"), value: 'Arm??nie'),
        DropdownMenuItem<String>(child: Text("Australie"), value: 'Australie'),
        DropdownMenuItem<String>(child: Text("Autriche"), value: 'Autriche'),
        DropdownMenuItem<String>(
            child: Text("Azerba??djan"), value: 'Azerba??djan'),
        DropdownMenuItem<String>(child: Text("Bahamas"), value: 'Bahamas'),
        DropdownMenuItem<String>(child: Text("Bahre??n"), value: 'Bahre??n'),
        DropdownMenuItem<String>(
            child: Text("Bangladesh"), value: 'Bangladesh'),
        DropdownMenuItem<String>(child: Text("Barbade"), value: 'Barbade'),
        DropdownMenuItem<String>(child: Text("Belgique"), value: 'Belgique'),
        DropdownMenuItem<String>(child: Text("Belize"), value: 'Belize'),
        DropdownMenuItem<String>(child: Text("B??nin"), value: 'B??nin'),
        DropdownMenuItem<String>(child: Text("Bhoutan"), value: 'Bhoutan'),
        DropdownMenuItem<String>(
            child: Text("Bi??lorussie"), value: 'Bi??lorussie'),
        DropdownMenuItem<String>(child: Text("Birmanie"), value: 'Birmanie'),
        DropdownMenuItem<String>(child: Text("Bolivie"), value: 'Bolivie'),
        DropdownMenuItem<String>(
            child: Text("Bosnie-Herz??govine"), value: 'Bosnie-Herz??govine'),
        DropdownMenuItem<String>(child: Text("Botswana"), value: 'Botswana'),
        DropdownMenuItem<String>(child: Text("Br??sil"), value: 'Br??sil'),
        DropdownMenuItem<String>(child: Text("Brunei"), value: 'Brunei'),
        DropdownMenuItem<String>(child: Text("Bulgarie"), value: 'Bulgarie'),
        DropdownMenuItem<String>(
            child: Text("Burkina Faso"), value: 'Burkina Faso'),
        DropdownMenuItem<String>(child: Text("Burundi"), value: 'Burundi'),
        DropdownMenuItem<String>(child: Text("Cambodge"), value: 'Cambodge'),
        DropdownMenuItem<String>(child: Text("Cameroun"), value: 'Cameroun'),
        DropdownMenuItem<String>(child: Text("Canada"), value: 'Canada'),
        DropdownMenuItem<String>(child: Text("Cap-Vert"), value: 'Cap-Vert'),
        DropdownMenuItem<String>(child: Text("Chili"), value: 'Chili'),
        DropdownMenuItem<String>(child: Text("Chine"), value: 'Chine'),
        DropdownMenuItem<String>(child: Text("Chypre"), value: 'Chypre'),
        DropdownMenuItem<String>(child: Text("Colombie"), value: 'Colombie'),
        DropdownMenuItem<String>(child: Text("Comores"), value: 'Comores'),
        DropdownMenuItem<String>(
            child: Text("Cor??e du Nord"), value: 'Cor??e du Nord'),
        DropdownMenuItem<String>(
            child: Text("Cor??e du Sud"), value: 'Cor??e du Sud'),
        DropdownMenuItem<String>(
            child: Text("Costa Rica"), value: 'Costa Rica'),
        DropdownMenuItem<String>(
            child: Text("C??te d???Ivoire"), value: 'C??te d???Ivoire'),
        DropdownMenuItem<String>(child: Text("Croatie"), value: 'Croatie'),
        DropdownMenuItem<String>(child: Text("Cuba"), value: 'Cuba'),
        DropdownMenuItem<String>(child: Text("Danemark"), value: 'Danemark'),
        DropdownMenuItem<String>(child: Text("Djibouti"), value: 'Djibouti'),
        DropdownMenuItem<String>(child: Text("Dominique"), value: 'Dominique'),
        DropdownMenuItem<String>(child: Text("??gypte"), value: '??gypte'),
        DropdownMenuItem<String>(
            child: Text("??mirats arabes unis"), value: '??mirats arabes unis'),
        DropdownMenuItem<String>(child: Text("??quateur"), value: '??quateur'),
        DropdownMenuItem<String>(child: Text("??rythr??e"), value: '??rythr??e'),
        DropdownMenuItem<String>(child: Text("Espagne"), value: 'Espagne'),
        DropdownMenuItem<String>(child: Text("Eswatini"), value: 'Eswatini'),
        DropdownMenuItem<String>(child: Text("Estonie"), value: 'Estonie'),
        DropdownMenuItem<String>(
            child: Text("??tats-Unis"), value: '??tats-Unis'),
        DropdownMenuItem<String>(child: Text("??thiopie"), value: '??thiopie'),
        DropdownMenuItem<String>(child: Text("Fidji"), value: 'Fidji'),
        DropdownMenuItem<String>(child: Text("Finlande"), value: 'Finlande'),
        DropdownMenuItem<String>(child: Text("France"), value: 'France'),
        DropdownMenuItem<String>(child: Text("Gabon"), value: 'Gabon'),
        DropdownMenuItem<String>(child: Text("Gambie"), value: 'Gambie'),
        DropdownMenuItem<String>(child: Text("G??orgie"), value: 'G??orgie'),
        DropdownMenuItem<String>(child: Text("Ghana"), value: 'Ghana'),
        DropdownMenuItem<String>(child: Text("Gr??ce"), value: 'Gr??ce'),
        DropdownMenuItem<String>(child: Text("Grenade"), value: 'Grenade'),
        DropdownMenuItem<String>(child: Text("Guatemala"), value: 'Guatemala'),
        DropdownMenuItem<String>(child: Text("Guin??e"), value: 'Guin??e'),
        DropdownMenuItem<String>(
            child: Text("Guin??e ??quatoriale"), value: 'Guin??e ??quatoriale'),
        DropdownMenuItem<String>(
            child: Text("Guin??e-Bissau"), value: 'Guin??e-Bissau'),
        DropdownMenuItem<String>(child: Text("Guyana"), value: 'Guyana'),
        DropdownMenuItem<String>(child: Text("Ha??ti"), value: 'Ha??ti'),
        DropdownMenuItem<String>(child: Text("Honduras"), value: 'Honduras'),
        DropdownMenuItem<String>(child: Text("Hongrie"), value: 'Hongrie'),
        DropdownMenuItem<String>(child: Text("??les Cook"), value: '??les Cook'),
        DropdownMenuItem<String>(
            child: Text("??les Marshall"), value: '??les Marshall'),
        DropdownMenuItem<String>(child: Text("Inde"), value: 'Inde'),
        DropdownMenuItem<String>(child: Text("Indon??sie"), value: 'Indon??sie'),
        DropdownMenuItem<String>(child: Text("Irak"), value: 'Irak'),
        DropdownMenuItem<String>(child: Text("Iran"), value: 'Iran'),
        DropdownMenuItem<String>(child: Text("Irlande"), value: 'Irlande'),
        DropdownMenuItem<String>(child: Text("Islande"), value: 'Islande'),
        DropdownMenuItem<String>(child: Text("Isra??l"), value: 'Isra??l'),
        DropdownMenuItem<String>(child: Text("Italie"), value: 'Italie'),
        DropdownMenuItem<String>(child: Text("Jama??que"), value: 'Jama??que'),
        DropdownMenuItem<String>(child: Text("Japon"), value: 'Japon'),
        DropdownMenuItem<String>(child: Text("Jordanie"), value: 'Jordanie'),
        DropdownMenuItem<String>(
            child: Text("Kazakhstan"), value: 'Kazakhstan'),
        DropdownMenuItem<String>(child: Text("Kenya"), value: 'Kenya'),
        DropdownMenuItem<String>(
            child: Text("Kirghizistan"), value: 'Kirghizistan'),
        DropdownMenuItem<String>(child: Text("Kiribati"), value: 'Kiribati'),
        DropdownMenuItem<String>(child: Text("Kowe??t"), value: 'Kowe??t'),
        DropdownMenuItem<String>(child: Text("Laos"), value: 'Laos'),
        DropdownMenuItem<String>(child: Text("Lesotho"), value: 'Lesotho'),
        DropdownMenuItem<String>(child: Text("Lettonie"), value: 'Lettonie'),
        DropdownMenuItem<String>(child: Text("Liban"), value: 'Liban'),
        DropdownMenuItem<String>(child: Text("Liberia"), value: 'Liberia'),
        DropdownMenuItem<String>(child: Text("Libye"), value: 'Libye'),
        DropdownMenuItem<String>(
            child: Text("Liechtenstein"), value: 'Liechtenstein'),
        DropdownMenuItem<String>(child: Text("Lituanie"), value: 'Lituanie'),
        DropdownMenuItem<String>(
            child: Text("Luxembourg"), value: 'Luxembourg'),
        DropdownMenuItem<String>(child: Text("Mac??doine"), value: 'Mac??doine'),
        DropdownMenuItem<String>(
            child: Text("Madagascar"), value: 'Madagascar'),
        DropdownMenuItem<String>(child: Text("Malaisie"), value: 'Malaisie'),
        DropdownMenuItem<String>(child: Text("Malawi"), value: 'Malawi'),
        DropdownMenuItem<String>(child: Text("Maldives"), value: 'Maldives'),
        DropdownMenuItem<String>(child: Text("Mali"), value: 'Mali'),
        DropdownMenuItem<String>(child: Text("Malte"), value: 'Malte'),
        DropdownMenuItem<String>(child: Text("Maroc"), value: 'Maroc'),
        DropdownMenuItem<String>(child: Text("Maurice"), value: 'Maurice'),
        DropdownMenuItem<String>(
            child: Text("Mauritanie"), value: 'Mauritanie'),
        DropdownMenuItem<String>(child: Text("Mexique"), value: 'Mexique'),
        DropdownMenuItem<String>(
            child: Text("Micron??sie"), value: 'Micron??sie'),
        DropdownMenuItem<String>(child: Text("Moldavie"), value: 'Moldavie'),
        DropdownMenuItem<String>(child: Text("Monaco"), value: 'Monaco'),
        DropdownMenuItem<String>(child: Text("Mongolie"), value: 'Mongolie'),
        DropdownMenuItem<String>(
            child: Text("Mont??n??gro"), value: 'Mont??n??gro'),
        DropdownMenuItem<String>(
            child: Text("Mozambique"), value: 'Mozambique'),
        DropdownMenuItem<String>(child: Text("Namibie"), value: 'Namibie'),
        DropdownMenuItem<String>(child: Text("Nauru"), value: 'Nauru'),
        DropdownMenuItem<String>(child: Text("N??pal"), value: 'N??pal'),
        DropdownMenuItem<String>(child: Text("Nicaragua"), value: 'Nicaragua'),
        DropdownMenuItem<String>(child: Text("Niger"), value: 'Niger'),
        DropdownMenuItem<String>(child: Text("Nigeria"), value: 'Nigeria'),
        DropdownMenuItem<String>(child: Text("Niue"), value: 'Niue'),
        DropdownMenuItem<String>(child: Text("Norv??ge"), value: 'Norv??ge'),
        DropdownMenuItem<String>(
            child: Text("Nouvelle-Z??lande"), value: 'Nouvelle-Z??lande'),
        DropdownMenuItem<String>(child: Text("Oman"), value: 'Oman'),
        DropdownMenuItem<String>(child: Text("Ouganda"), value: 'Ouganda'),
        DropdownMenuItem<String>(
            child: Text("Ouzb??kistan"), value: 'Ouzb??kistan'),
        DropdownMenuItem<String>(child: Text("Pakistan"), value: 'Pakistan'),
        DropdownMenuItem<String>(child: Text("Palaos"), value: 'Palaos'),
        DropdownMenuItem<String>(child: Text("Palestine"), value: 'Palestine'),
        DropdownMenuItem<String>(child: Text("Panama"), value: 'Panama'),
        DropdownMenuItem<String>(
            child: Text("Papouasie-Nouvelle-Guin??e"),
            value: 'Papouasie-Nouvelle-Guin??e'),
        DropdownMenuItem<String>(child: Text("Paraguay"), value: 'Paraguay'),
        DropdownMenuItem<String>(child: Text("Pays-Bas"), value: 'Pays-Bas'),
        DropdownMenuItem<String>(child: Text("P??rou"), value: 'P??rou'),
        DropdownMenuItem<String>(
            child: Text("Philippines"), value: 'Philippines'),
        DropdownMenuItem<String>(child: Text("Pologne"), value: 'Pologne'),
        DropdownMenuItem<String>(child: Text("Portugal"), value: 'Portugal'),
        DropdownMenuItem<String>(child: Text("Qatar"), value: 'Qatar'),
        DropdownMenuItem<String>(
            child: Text("R??publique centrafricaine"),
            value: 'R??publique centrafricaine'),
        DropdownMenuItem<String>(
            child: Text("R??publique d??mocratique du Congo"),
            value: 'R??publique d??mocratique du Congo'),
        DropdownMenuItem<String>(
            child: Text("R??publique Dominicaine"),
            value: 'R??publique Dominicaine'),
        DropdownMenuItem<String>(
            child: Text("R??publique du Congo"), value: 'R??publique du Congo'),
        DropdownMenuItem<String>(
            child: Text("R??publique tch??que"), value: 'R??publique tch??que'),
        DropdownMenuItem<String>(child: Text("Roumanie"), value: 'Roumanie'),
        DropdownMenuItem<String>(
            child: Text("Royaume-Uni"), value: 'Royaume-Uni'),
        DropdownMenuItem<String>(child: Text("Russie"), value: 'Russie'),
        DropdownMenuItem<String>(child: Text("Rwanda"), value: 'Rwanda'),
        DropdownMenuItem<String>(
            child: Text("Saint-Kitts-et-Nevis"), value: 'Saint-Kitts-et-Nevis'),
        DropdownMenuItem<String>(
            child: Text("Saint-Vincent-et-les-Grenadines"),
            value: 'Saint-Vincent-et-les-Grenadines'),
        DropdownMenuItem<String>(
            child: Text("Sainte-Lucie"), value: 'Sainte-Lucie'),
        DropdownMenuItem<String>(
            child: Text("Saint-Marin"), value: 'Saint-Marin'),
        DropdownMenuItem<String>(child: Text("Salomon"), value: 'Salomon'),
        DropdownMenuItem<String>(child: Text("Salvador"), value: 'Salvador'),
        DropdownMenuItem<String>(child: Text("Samoa"), value: 'Samoa'),
        DropdownMenuItem<String>(
            child: Text("S??o Tom??-et-Principe"), value: 'S??o Tom??-et-Principe'),
        DropdownMenuItem<String>(child: Text("S??n??gal"), value: 'S??n??gal'),
        DropdownMenuItem<String>(child: Text("Serbie"), value: 'Serbie'),
        DropdownMenuItem<String>(
            child: Text("Seychelles"), value: 'Seychelles'),
        DropdownMenuItem<String>(
            child: Text("Sierra Leone"), value: 'Sierra Leone'),
        DropdownMenuItem<String>(child: Text("Singapour"), value: 'Singapour'),
        DropdownMenuItem<String>(child: Text("Slovaquie"), value: 'Slovaquie'),
        DropdownMenuItem<String>(child: Text("Slov??nie"), value: 'Slov??nie'),
        DropdownMenuItem<String>(child: Text("Somalie"), value: 'Somalie'),
        DropdownMenuItem<String>(child: Text("Soudan"), value: 'Soudan'),
        DropdownMenuItem<String>(
            child: Text("Soudan du Sud"), value: 'Soudan du Sud'),
        DropdownMenuItem<String>(child: Text("Sri Lanka"), value: 'Sri Lanka'),
        DropdownMenuItem<String>(child: Text("Su??de"), value: 'Su??de'),
        DropdownMenuItem<String>(child: Text("Suisse"), value: 'Suisse'),
        DropdownMenuItem<String>(child: Text("Suriname"), value: 'Suriname'),
        DropdownMenuItem<String>(child: Text("Syrie"), value: 'Syrie'),
        DropdownMenuItem<String>(
            child: Text("Tadjikistan"), value: 'Tadjikistan'),
        DropdownMenuItem<String>(child: Text("Tanzanie"), value: 'Tanzanie'),
        DropdownMenuItem<String>(child: Text("Tchad"), value: 'Tchad'),
        DropdownMenuItem<String>(child: Text("Tha??lande"), value: 'Tha??lande'),
        DropdownMenuItem<String>(
            child: Text("Timor oriental"), value: 'Timor oriental'),
        DropdownMenuItem<String>(child: Text("Togo"), value: 'Togo'),
        DropdownMenuItem<String>(child: Text("Tonga"), value: 'Tonga'),
        DropdownMenuItem<String>(
            child: Text("Trinit??-et-Tobago"), value: 'Trinit??-et-Tobago'),
        DropdownMenuItem<String>(child: Text("Tunisie"), value: 'Tunisie'),
        DropdownMenuItem<String>(
            child: Text("Turkm??nistan"), value: 'Turkm??nistan'),
        DropdownMenuItem<String>(child: Text("Turquie"), value: 'Turquie'),
        DropdownMenuItem<String>(child: Text("Tuvalu"), value: 'Tuvalu'),
        DropdownMenuItem<String>(child: Text("Ukraine"), value: 'Ukraine'),
        DropdownMenuItem<String>(child: Text("Uruguay"), value: 'Uruguay'),
        DropdownMenuItem<String>(child: Text("Vanuatu"), value: 'Vanuatu'),
        DropdownMenuItem<String>(child: Text("Vatican"), value: 'Vatican'),
        DropdownMenuItem<String>(child: Text("Venezuela"), value: 'Venezuela'),
        DropdownMenuItem<String>(child: Text("Vi??t Nam"), value: 'Vi??t Nam'),
        DropdownMenuItem<String>(child: Text("Y??men"), value: 'Y??men'),
        DropdownMenuItem<String>(child: Text("Zambie"), value: 'Zambie'),
        DropdownMenuItem<String>(child: Text("Zimbabwe"), value: 'Zimbabwe'),
      ],
      onChanged: (String? value) {
        setState(() {
          paysdropdown = value.toString();
          paysvalue = paysdropdown;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },

      /* onChanged: (newValue) {
        (item) => setState(() => selectedItem = newValue.toString());
        print(newValue.toString());
        print(selectedItem);
      }, */
    );
    final sexe = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Sexe",
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
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text("--Choisissez votre sexe--"), value: ''),
        DropdownMenuItem<String>(child: Text("Homme"), value: 'Homme'),
        DropdownMenuItem<String>(child: Text("Femme"), value: 'Femme'),
        DropdownMenuItem<String>(
            child: Text("Non sp??cifi??"), value: 'Non sp??cifi??'),
      ],
      onChanged: (value) {
        setState(() {
          dropdownValue = value.toString();
          print(dropdownValue);
          sexevalue = dropdownValue;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },
    );
    final cabine = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.airline_seat_recline_normal_rounded,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Pr??f??rence de si??ge",
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
      value: cabinevalue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text("--Veuillez choisir--"), value: ''),
        DropdownMenuItem<String>(
            child: Text("C??t?? hublot"), value: 'C??t?? hublot'),
        DropdownMenuItem<String>(
            child: Text("C??t?? couloir"), value: 'C??t?? couloir'),
        DropdownMenuItem<String>(
            child: Text("Indiff??rent"), value: 'Indiff??rent'),
      ],
      onChanged: (String? value) {
        setState(() {
          cabinevalue = value.toString();
          siegevalue = cabinevalue;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },
    );
    final repas = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.fastfood,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Pr??f??rence de repas",
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
      value: repasvalue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text("--Veuillez choisir--"), value: ''),
        DropdownMenuItem<String>(
            child: Text("Repas v??g??tarien asiatique"),
            value: 'Repas v??g??tarien asiatique'),
        DropdownMenuItem<String>(
            child: Text("Repas sans ??pices"), value: 'Repas sans ??pices'),
        DropdownMenuItem<String>(
            child: Text("Repas enfant"), value: 'Repas enfant'),
        DropdownMenuItem<String>(
            child: Text("Reaps diab??tique"), value: 'Reaps diab??tique'),
        DropdownMenuItem<String>(
            child: Text("Reaps plateau de fruits"),
            value: 'Reaps plateau de fruits'),
        DropdownMenuItem<String>(
            child: Text("Reaps b??b??"), value: 'Reaps b??b??'),
        DropdownMenuItem<String>(
            child: Text("Reaps hindou"), value: 'Reaps hindou'),
        DropdownMenuItem<String>(
            child: Text("Reaps faible en calories"),
            value: 'Reaps faible en calories'),
        DropdownMenuItem<String>(
            child: Text("Reaps pauvre en mati??res grasses-cholest??rol"),
            value: 'Reaps pauvre en mati??res grasses-cholest??rol'),
        DropdownMenuItem<String>(
            child: Text("Reaps pauvre en soduim"),
            value: 'Reaps pauvre en soduim'),
        DropdownMenuItem<String>(
            child: Text("Reaps sans lactose"), value: 'Reaps sans lactose'),
        DropdownMenuItem<String>(
            child: Text("Reaps casher"), value: 'Reaps casher'),
        DropdownMenuItem<String>(
            child: Text("Reaps de l??gumes crus"),
            value: 'Reaps de l??gumes crus'),
        DropdownMenuItem<String>(
            child: Text("Reaps de fruits de mer"),
            value: 'Reaps de fruits de mer'),
        DropdownMenuItem<String>(
            child: Text("Reaps v??g??tarien"), value: 'Reaps v??g??tarien'),
        DropdownMenuItem<String>(
            child: Text("Reaps lacto-ovo v??g??tarien"),
            value: 'Reaps lacto-ovo v??g??tarien'),
      ],
      onChanged: (String? value) {
        setState(() {
          repasvalue = value.toString();
          repas1value = repasvalue;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },
    );
    final classe = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.flight_class,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Classe habituelle de voyage",
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
      value: classevalue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text("--Veuillez choisir--"), value: ''),
        DropdownMenuItem<String>(child: Text("Business"), value: 'Business'),
        DropdownMenuItem<String>(
            child: Text("Economique"), value: 'Economique'),
      ],
      onChanged: (String? value) {
        setState(() {
          classevalue = value.toString();
          classe1value = classevalue;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },
    );
    final payment = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.payments,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Mode de paiement",
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
      value: paymentvalue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text("--Veuillez choisir--"), value: ''),
        DropdownMenuItem<String>(
            child: Text("Carte de cr??dit"), value: 'Carte de cr??dit'),
        DropdownMenuItem<String>(child: Text("Cash"), value: 'Cash'),
        DropdownMenuItem<String>(child: Text("Ch??que"), value: 'Ch??que'),
      ],
      onChanged: (String? value) {
        setState(() {
          paymentvalue = value.toString();
          payment1value = paymentvalue;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },
    );
    final habitude = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.people_outlined,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Vos habitudes de voyage",
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
      value: habitudevalue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text("--Veuillez choisir--"), value: ''),
        DropdownMenuItem<String>(child: Text("Seul"), value: 'Seul'),
        DropdownMenuItem<String>(
            child: Text("Accompagn??"), value: 'Accompagn??'),
      ],
      onChanged: (String? value) {
        setState(() {
          habitudevalue = value.toString();
          habitude1value = habitudevalue;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },
    );
    final assistance = TextFormField(
      maxLength: 100,
      maxLines: 3,
      autofocus: false,
      controller: assitanceController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        assitanceController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 25, top: 25, right: 15),
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
    final Typedadhesion = DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Type d'adh??sion",
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
      value: typedadhesionvalue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      items: const [
        DropdownMenuItem<String>(
            child: Text(
              "--Choisir votre type d'adh??sion--",
              style: TextStyle(fontSize: 14),
            ),
            value: ''),
        DropdownMenuItem<String>(
            child: Text("Adh??sion individuelle"),
            value: 'Adh??sion individuelle'),
        DropdownMenuItem<String>(
            child: Text("Adh??sion familiale"), value: 'Adh??sion familiale'),
      ],
      onChanged: (String? value) {
        setState(() {
          typedadhesionvalue = value.toString();
          typevalue = typedadhesionvalue;
        });
      },
      validator: (value) {
        if (value == '') return 'Champs obligatoire';
        return null;
      },
    );
    final firstNameField = TextFormField(
      autofocus: false,
      maxLines: 1,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Nom",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'^[a-z  A-Z]+$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Le nom doit contenir des lettres seulement';
        return null;
      },
    );
    final numbillet = TextFormField(
      autofocus: false,
      controller: numbilletController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        numbilletController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.airplane_ticket,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Num??ro du billet",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        String pattern = r'^(199)[0-9]{15}$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Num??ro du billet doit commencer par "199" \net doit comporter 15 chiffres';
        return null;
      },
    );
    final agencepref = TextFormField(
      autofocus: false,
      controller: agenceController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        agenceController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.apartment,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Agence de voyage",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        return null;
      },
    );
    final pointdevente = TextFormField(
      autofocus: false,
      controller: pointduventeController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        pointduventeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.apartment,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Point de vente Tunisair",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        return null;
      },
    );
    final sitevendeur = TextFormField(
      autofocus: false,
      controller: siteController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        siteController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.laptop,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Site Vendeur",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        return null;
      },
    );
    final numvol = TextFormField(
      autofocus: false,
      controller: numduvolController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        numduvolController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.flight,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Num??ro du vol",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        String pattern = r'^(TU)[0-9]{3}$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Num??ro du vol doit commencer par TU \net doit comporter 3 chiffres';
        return null;
      },
    );
    String? level;
    /*final Typedadhesion = DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Sexe",
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
      value: valeur,
      isDense: true,
      items: types
          .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 17),
              )))
          .toList(),
      onChanged: (item) => setState(() => valeur = item),
    );*/
    final autrefidelisation = TextFormField(
      maxLength: 100,
      maxLines: 3,
      autofocus: false,

      controller: autrefidelController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        autrefidelController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
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
    final idMmbre1 = TextFormField(
      autofocus: false,
      controller: idmmbre1Controller,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        idmmbre1Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
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
    final idMmbre2 = TextFormField(
      autofocus: false,
      controller: idmmbre2Controller,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        idmmbre2Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
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
    final idMmbre3 = TextFormField(
      autofocus: false,
      controller: idmmbre3Controller,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        idmmbre3Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
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
    final secondNameField = TextFormField(
      autofocus: false,
      maxLines: 1,
      controller: secondNameController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Pr??nom",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'^[a-z  A-Z]+$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Le pr??nom doit contenir des lettres seulement';
        return null;
      },
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: mailController,
      keyboardType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value))
          return 'Saisissez un e-mail valide';
        return null;
      },
      onSaved: (value) {
        mailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "E-mail",
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
    final AdresseField = TextFormField(
      autofocus: false,
      controller: adresseController,
      //obscureText: true,

      onSaved: (value) {
        adresseController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.home,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Adresse domicile",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        return null;
      },
    );
    final ville = TextFormField(
      autofocus: false,
      controller: villeController,
      //obscureText: true,

      onSaved: (value) {
        villeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.location_city,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Ville",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'^[a-z  A-Z]+$';
        if (!RegExp(pattern).hasMatch(value))
          return 'La ville doit contenir des lettres seulement';
        return null;
      },
    );
    final codePostalField = TextFormField(
      autofocus: false,
      controller: codepostalController,
      //obscureText: true,

      keyboardType: TextInputType.number,
      onSaved: (value) {
        codepostalController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.markunread_mailbox,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Code postal",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'^[0-9]+$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Saisissez un code postal valide';
        return null;
      },
    );
    final numeroField = TextFormField(
      autofocus: false,
      controller: telController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        telController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone_android,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "T??l??phone portable",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Saisissez un num??ro valide';
        return null;
      },
    );
    final numeroFielddom = TextFormField(
      autofocus: false,
      controller: numeroFielddomController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        numeroFielddomController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "T??l??phone domicile",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        String pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Saisissez un num??ro valide';
        return null;
      },
    );
    final faxField = TextFormField(
      autofocus: false,
      controller: faxController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        faxController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Fax",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        String pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';
        if (!RegExp(pattern).hasMatch(value!))
          return 'Saisissez un num??ro valide';
        return null;
      },
    );
    final societeField = TextFormField(
      autofocus: false,
      controller: societeController,
      //obscureText: true,

      onSaved: (value) {
        societeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.factory_outlined,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Soci??t??",
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
    final fonctionField = TextFormField(
      autofocus: false,
      controller: fonctionController,
      //obscureText: true,

      onSaved: (value) {
        fonctionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.wallet_travel,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        labelText: "Fonction",
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
    final telproField = TextFormField(
      autofocus: false,
      controller: telproController,
      //obscureText: true,

      keyboardType: TextInputType.phone,
      onSaved: (value) {
        telproController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "T??l??phone professionnel",
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
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        String pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';
        if (!RegExp(pattern).hasMatch(value!))
          return 'Saisissez un num??ro valide';
        return null;
      },
    );
    final CinField = TextFormField(
      maxLength: 12,
      autofocus: false,
      controller: cinController,
      //obscureText: true,

      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        cinController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.credit_card,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "Num??ro du Passeport ou CIN",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        String pattern = r'[A-Za-z0-9]{6,}$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Saissiez une format valide';
        return null;
      },
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      //validator
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.red,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        labelText: "  Password",
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
      validator: (value) {
        if (value == null || value.isEmpty) return 'Champs obligatoire';
        return null;
      },
    );
    final dateFlied = TextFormField(
      controller: birthadaydateController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.datetime,
      readOnly: true,
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
        hintText: 'Date de naissance',
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                1910), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime.now());
        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            birthadaydateController.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Champs obligatoire";
        } else {
          return null;
        }
      },
    );
    final lastflight = TextFormField(
      readOnly: true,
      controller: lastflightController,
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
        hintText: 'Date du dernier voyage',
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                2022), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime.now());
        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            birthadaydateController.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        String pattern = r'^(TU)[0-9]{3}$';
        if (!RegExp(pattern).hasMatch(value))
          return 'Num??ro du vol doit commencer par TU \net doit comporter 3 chiffres';
        return null;
      },
    );
    final SignUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(80),
      color: Colors.red[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print(dropdownValue);
              addFidelys(
                  firstNameController.text,
                  secondNameController.text,
                  birthadaydateController.text,
                  mailController.text,
                  passwordController.text,
                  adresseController.text,
                  villeController.text,
                  codepostalController.text,
                  telController.text,
                  numeroFielddomController.text,
                  societeController.text,
                  fonctionController.text,
                  telproController.text,
                  faxController.text,
                  sexevalue,
                  natvalue,
                  cinController.text,
                  typevalue,
                  autrefidelController.text,
                  idmmbre1Controller.text,
                  idmmbre2Controller.text,
                  idmmbre3Controller.text,
                  assitanceController.text,
                  numeroduvolController.text,
                  numduvolController.text,
                  pointduventeController.text,
                  agenceController.text,
                  lastflightController.text,
                  siegevalue,
                  repas1value,
                  paysvalue,
                  habitude1value,
                  payment1value,
                  classe1value,
                  context);
            }
          },
          child: Text(
            "S'inscrire",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
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
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Informations personnelles",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      firstNameField,
                      SizedBox(
                        height: 25,
                      ),
                      secondNameField,
                      SizedBox(
                        height: 25,
                      ),
                      sexe,
                      SizedBox(
                        height: 25,
                      ),
                      dateFlied,
                      SizedBox(
                        height: 25,
                      ),
                      emailField,
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CinField,
                      SizedBox(
                        height: 25,
                      ),
                      nat,
                      SizedBox(
                        height: 25,
                      ),
                      Text("Adresse et contact",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      AdresseField,
                      SizedBox(
                        height: 25,
                      ),
                      ville,
                      SizedBox(
                        height: 25,
                      ),
                      codePostalField,
                      SizedBox(
                        height: 25,
                      ),
                      pays,
                      SizedBox(
                        height: 25,
                      ),
                      numeroField,
                      SizedBox(
                        height: 25,
                      ),
                      numeroFielddom,
                      SizedBox(
                        height: 25,
                      ),

                      Text("Informations professionnelles",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      societeField,
                      SizedBox(
                        height: 25,
                      ),
                      fonctionField,
                      SizedBox(
                        height: 25,
                      ),
                      telproField,
                      SizedBox(
                        height: 25,
                      ),
                      faxField,
                      SizedBox(
                        height: 25,
                      ),
                      Text("Caract??ristiques de l'adh??sion",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Typedadhesion,
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Si vous ??tes inscrit dans d'autres programmes de fid??lisation, Citez 3 : ",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      autrefidelisation,
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Votre identifiant du 1er programme : ",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      idMmbre1,
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Votre identifiant du 2??me programme : ",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      idMmbre2,
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Votre identifiant du 3??me programme : ",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      idMmbre3,
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Langue de communication : ",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        leading: Radio<String>(
                          activeColor: Colors.red[800],
                          value: 'Fran??ais',
                          groupValue: _selectedlangue,
                          onChanged: (value) {
                            setState(() {
                              _selectedlangue = value!;
                            });
                          },
                        ),
                        title: const Text('Fran??ais'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          activeColor: Colors.red[800],
                          value: 'Anglais',
                          groupValue: _selectedlangue,
                          onChanged: (value) {
                            setState(() {
                              _selectedlangue = value!;
                            });
                          },
                        ),
                        title: const Text('Anglais'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Dernier voyage effectu??",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "Le voyage doit ??tre durant cet ann??e : \n(Vous pouvez laisser ces champs vide)",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      numvol,
                      SizedBox(
                        height: 25,
                      ),

                      lastflight,
                      SizedBox(
                        height: 25,
                      ),
                      numbillet,

                      SizedBox(
                        height: 25,
                      ),
                      Text("Lieu d'achat de vos billets",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      agencepref,
                      SizedBox(
                        height: 25,
                      ),
                      pointdevente,
                      SizedBox(
                        height: 25,
                      ),
                      sitevendeur,
                      SizedBox(
                        height: 25,
                      ),
                      Text("Vos pr??f??rences",
                          style: TextStyle(
                            fontSize: 20,
                          )),

                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Cabine",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      cabine,
                      SizedBox(
                        height: 25,
                      ),
                      repas,
                      SizedBox(
                        height: 25,
                      ),
                      classe,
                      SizedBox(
                        height: 25,
                      ),

                      Text("Voyage",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      payment,
                      SizedBox(
                        height: 25,
                      ),
                      habitude,
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                          "Avez-vous besoin d'une assistance particuli??re ? Si oui, veuillez d??crire bri??vement pourqoui.",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 20,
                      ),
                      assistance,
                      SizedBox(
                        height: 20,
                      ),
                      passwordField,
                      SizedBox(
                        height: 25,
                      ),

                      //comfirmpasswordField,
                      SignUpButton,
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

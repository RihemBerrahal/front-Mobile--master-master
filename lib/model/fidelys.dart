import 'dart:convert';

import 'package:flutter/material.dart';

Fidelys fidelysJson(String str) => Fidelys.fromJson(json.decode(str));
String fidelysToJson(Fidelys data) => json.encode(data.toJson());

class Fidelys {
  int id;
  String firstname;
  String secondname;
  String birthdaydate;
  String email;
  String password;
  String status;
  String sexe;
  String nationalite;
  String cin;
  String typeadhesion;
  String autrefidelisation;
  String idmmbre1;
  String idmmbre2;
  String idmmbre3;
  String adresse;
  String ville;
  String tel;
  String teldom;
  String societe;
  String fonction;
  String codepostal;
  String telpro;
  String fax;
  int solde;
  int soldequa;
  String assitnace;
  String numeroduvol;
  String numrodebillet;
  String pointdevente;
  String agence;
  String lastflight;
  String cabine;
  String repas;
  String pays;
  String habitude;
  String payment;
  String classe;
  String card;
  String banner;

  Fidelys(
      {required this.id,
      required this.firstname,
      required this.secondname,
      required this.birthdaydate,
      required this.email,
      required this.password,
      required this.adresse,
      required this.ville,
      required this.tel,
      required this.teldom,
      required this.societe,
      required this.fonction,
      required this.codepostal,
      required this.telpro,
      required this.fax,
      required this.sexe,
      required this.nationalite,
      required this.cin,
      required this.typeadhesion,
      required this.autrefidelisation,
      required this.idmmbre1,
      required this.idmmbre2,
      required this.idmmbre3,
      required this.status,
      required this.solde,
      required this.soldequa,
      required this.assitnace,
      required this.numeroduvol,
      required this.agence,
      required this.cabine,
      required this.classe,
      required this.habitude,
      required this.lastflight,
      required this.numrodebillet,
      required this.payment,
      required this.pays,
      required this.pointdevente,
      required this.repas,
      required this.card,
      required this.banner});
  factory Fidelys.fromJson(Map<String, dynamic> json) {
    return Fidelys(
      id: json["id"],
      firstname: json["firstname"],
      secondname: json["secondname"],
      birthdaydate: json["birthdaydate"],
      email: json["email"],
      password: json["password"],
      adresse: json["adresse"],
      ville: json["ville"],
      tel: json["tel"],
      teldom: json["teldom"],
      societe: json["societe"],
      fonction: json["fonction"],
      codepostal: json["codepostal"],
      telpro: json["telpro"],
      fax: json["fax"],
      sexe: json["sexe"],
      nationalite: json["nationalite"],
      cin: json["cin"],
      typeadhesion: json["typeadhesion"],
      autrefidelisation: json["autrefidelisation"],
      idmmbre1: json["idmmbre1"],
      idmmbre2: json["idmmbre2"],
      idmmbre3: json["idmmbre3"],
      status: json["status"],
      solde: json["solde"],
      soldequa: json["soldequa"],
      assitnace: json["assitnace"],
      numeroduvol: json["numeroduvol"],
      numrodebillet: json["numrodebillet"],
      pointdevente: json["pointdevente"],
      agence: json["agence"],
      lastflight: json["lastflight"],
      cabine: json["cabine"],
      repas: json["repas"],
      pays: json["pays"],
      habitude: json["habitude"],
      payment: json["payment"],
      classe: json["classe"],
      card: json["card"],
      banner: json ["banner"]
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
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
        "status": status,
        "solde": solde,
        "soldequa": soldequa,
        "assitnace": assitnace,
        "numeroduvol": numeroduvol,
        "numrodebillet": numrodebillet,
        "pointdevente": pointdevente,
        "agence": agence,
        "lastflight": lastflight,
        "cabine": cabine,
        "pays": pays,
        "habitude": habitude,
        "payment": payment,
        "classe": classe,
        "card": card,
        "banner": banner,
      };

  String get firstName => firstname;
  String get secondName => secondname;
  String get birthDaydate => birthdaydate;
  String get Email => email;
  String get passWord => password;
  String get Adresse => adresse;
  String get Ville => ville;
  String get Tel => tel;
  String get Teldom => teldom;
  String get Societe => societe;
  String get Fonction => fonction;
  String get Codepostal => codepostal;
  String get Telpro => telpro;
  String get Fax => fax;
  String get Sexe => sexe;
  String get Nationalite => nationalite;
  String get Cin => cin;
  String get Typeadhesion => typeadhesion;
  String get Autrefidelisation => autrefidelisation;
  String get Idmmbre1 => idmmbre1;
  String get Idmmbre2 => idmmbre2;
  String get Idmmbre3 => idmmbre3;
  String get Status => status;
  int get Solde => solde;
  int get Soldequa => soldequa;
  String get Assitnace => assitnace;
  String get Numeroduvol => numeroduvol;
  String get Numrodebillet => numrodebillet;
  String get Pointdevente => pointdevente;
  String get Agence => agence;
  String get Lastflight => lastflight;
  String get Cabine => cabine;
  String get Pays => pays;
  String get Habitude => habitude;
  String get paymente => payment;
  String get Classe => classe;
  String get Card => card;
  String get Banner => banner;
}

import 'dart:convert';

import 'dart:ffi';

MouvementM mouvementMJson(String str) => MouvementM.fromJson(json.decode(str));
String mouvementToJson(MouvementM data) => json.encode(data.toJson());

class MouvementM {
  int id;
  String transaction;
  int debit;
  int credit;
  String dateajout;
  int milesqalifiant;

  int iduser;
  MouvementM(
      {required this.id,
      required this.debit,
      required this.credit,
      required this.transaction,
      required this.iduser,
      required this.dateajout,
      required this.milesqalifiant});

  factory MouvementM.fromJson(Map<String, dynamic> json) {
    return MouvementM(
        id: json["id"],
        debit: json["debit"],
        credit: json["credit"],
        transaction: json["transaction"],
        iduser: json["iduser"],
        dateajout: json["dateajout"],
        milesqalifiant: json["milesqalifiant"]);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "debit": debit,
        "credit": credit,
        "transaction": transaction,
        "iduser": iduser,
        "dateajout": dateajout,
        "milesqalifiant": milesqalifiant
      };
  int get Id => id;
  int get Debit => debit;
  int get Credit => credit;
  String get Transaction => transaction;
  int get idUser => iduser;
  String get Dateajout => dateajout;
  int get Milesqalifiant => milesqalifiant;
}

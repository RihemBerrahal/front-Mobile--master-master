import 'dart:convert';

ReclamationM reclamationMJson(String str) =>
    ReclamationM.fromJson(json.decode(str));
String reclamationToJson(ReclamationM data) => json.encode(data.toJson());

class ReclamationM {
  int id;
  String dis;
  String datedujour;
  String reponse;
  String dateduvol;
  String billet;
  String numeroduvol;
  int iduser;
  String typederec;
  ReclamationM(
      {required this.id,
      required this.dis,
      required this.datedujour,
      required this.reponse,
      required this.dateduvol,
      required this.billet,
      required this.numeroduvol,
      required this.iduser,
      required this.typederec});

  factory ReclamationM.fromJson(Map<String, dynamic> json) {
    return ReclamationM(
        id: json["id"],
        dis: json["dis"],
        datedujour: json["datedujour"],
        reponse: json["reponse"],
        dateduvol: json["dateduvol"],
        billet: json["billet"],
        numeroduvol: json["numeroduvol"],
        iduser: json["iduser"],
        typederec: json["typederec"]);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "dis": dis,
        "datedujour": datedujour,
        "reponse": reponse,
        "dateduvol": dateduvol,
        "billet": billet,
        "numeroduvol": numeroduvol,
        "iduser": iduser,
        "typederec": typederec
      };
  int get Id => id;
  String get Dis => dis;
  String get dateDujour => datedujour;
  String get Reponse => reponse;
  String get dateDuvol => dateduvol;
  String get Billet => billet;
  String get numeroDuvol => numeroduvol;
  int get idUser => iduser;
  String get typeDerec => typederec;
}

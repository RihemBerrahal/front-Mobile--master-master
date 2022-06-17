import 'dart:convert';

import 'package:currency_flutter/model/Vols.dart';
import 'package:currency_flutter/model/fidelys.dart';

import 'Vols.dart';

Billet billetJson(String str) => Billet.fromJson(json.decode(str));
String billetToJson(Billet data) => json.encode(data.toJson());

class Billet {
  String id;
  String vols;

  int fidelys;
  Billet({required this.id, required this.vols, required this.fidelys});
  factory Billet.fromJson(Map<String, dynamic> json) {
    return Billet(
      id: json["id"],
      vols: json["vols"],
      fidelys: json["fidelys"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "vols": vols,
        "fidelys": fidelys,
      };
  String get Id => id;
  String get Vols => vols;
  int get Fidelys => fidelys;
}

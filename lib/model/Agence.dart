import 'package:flutter/cupertino.dart';

class Agence {
  String name;
  String icon;
  Color color;
  String imgName;
  String adresse;
  String numTel1;
  String? numTel2;
  String? numTel3;
  String? numTel4;
  String? fax;
  String? mapurl;
  List<Agence> subAgences;

  Agence(
    {
      required this.name,
      required this.icon,
      required this.color,
      required this.adresse,
      required this.numTel1,
      this.numTel2,
      this.numTel3,
      this.numTel4,
      this.fax,
      this.mapurl,
      required this.imgName,
      required this.subAgences
    }
  );
}
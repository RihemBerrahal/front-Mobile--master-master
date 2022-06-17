import 'dart:convert';

Vols VolJson(String str) => Vols.fromJson(json.decode(str));

String VolsToJson(Vols data) => json.encode(data.toJson());

class Vols {
  String numeroDuVol;
  String dateDuvol;
  String escaleDepart;
  String escaleArrive;
  String etatDuVol;
  String departProgramme;
  String arrivep;
  String departEstime;
  String arriveeEstimee;
  int km;
  int nbeconomic;
  int nbbusiness;
  Vols({
    required this.numeroDuVol,
    required this.dateDuvol,
    required this.escaleDepart,
    required this.escaleArrive,
    required this.etatDuVol,
    required this.departProgramme,
    required this.arrivep,
    required this.departEstime,
    required this.arriveeEstimee,
    required this.km,
    required this.nbeconomic,
    required this.nbbusiness,
  });

  factory Vols.fromJson(Map<String, dynamic> json) {
    return Vols(
      numeroDuVol: json["numeroDuVol"],
      dateDuvol: json["dateDuvol"],
      escaleArrive: json["escaleArrive"],
      escaleDepart: json["escaleDepart"],
      etatDuVol: json["etatDuVol"],
      departProgramme: json["departProgramme"],
      arrivep: json["arrivep"],
      departEstime: json["departEstime"],
      arriveeEstimee: json["arriveeEstimee"],
      km: json["km"],
      nbeconomic: json["nbeconomic"],
      nbbusiness: json["nbbusiness"],
    );
  }
  Map<String, dynamic> toJson() => {
        "numeroDuVol": numeroDuVol,
        "dateDuvol": dateDuvol,
        "escaleDepart": escaleDepart,
        "escaleArrive": escaleArrive,
        "etatDuVol": etatDuVol,
        "departProgramme": departProgramme,
        "arrivep": arrivep,
        "departEstime": departEstime,
        "arriveeEstimee": arriveeEstimee,
        "km": km,
        "nbeconomic": nbeconomic,
        "nbbusiness": nbbusiness
      };
  String get NumeroDuvol => numeroDuVol;
  String get DateDuvol => dateDuvol;
  String get EscaleDepart => escaleDepart;
  String get EscaleArrive => escaleArrive;
  String get EtatDuVol => etatDuVol;
  String get DepartProgramme => departProgramme;
  String get ArriveeProgramme => arrivep;
  String get DepartEstime => departEstime;
  String get ArriveeEstimee => arriveeEstimee;
  int get Km => km;
  int get Nbeconomic => nbeconomic;
  int get Nbbusiness => nbbusiness;
}

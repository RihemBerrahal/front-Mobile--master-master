import 'package:flutter/material.dart';

import '../model/Agence.dart';

class Utils {
  static List<Agence> getMockedAgences() {
    return [
      Agence(
          color: Colors.blue,
          name: 'Agence Tunisair Bizerte',
          imgName: 'Bizerte',
          adresse: '76 Av. Habib Bourguiba Bizerte',
          numTel1: '(00216) 72 432 201',
          numTel2: '(00216) 72 432 202',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Agence+Tunisair+Bizerte/@37.2715843,9.8674956,17z/data=!3m1!4b1!4m5!3m4!1s0x12e31e4da3c72f65:0x75cba40216246de3!8m2!3d37.2715664!4d9.8697296',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Siège Tunisair',
          imgName: 'Siege',
          adresse: 'Agence Siège Tunisair : CHARGUIA 2 2035 Tunis Carthage',
          numTel1: '(00216) 71 942 322',
          fax: '(00216) 70 936 900',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Tunisair/@36.8508355,10.2030209,17z/data=!3m1!4b1!4m5!3m4!1s0x12fd34d1c0f0428b:0x55b6f2c0608987ac!8m2!3d36.850869!4d10.2052236',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Délégation Générale',
          adresse: '138, Av de la Liberté',
          numTel1: '(00216) 31 370 503	',
          imgName: 'avion',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/الخطوط+التونسية%E2%80%AD/@36.8181862,10.1763088,17z/data=!3m1!4b1!4m5!3m4!1s0x12fd348777119a6d:0xc8ae74668a83a35e!8m2!3d36.8181862!4d10.1785028',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Principale',
          adresse: '19, Rue Houcine Bouzaiene',
          numTel1: '(00216) 71 336 500',
          numTel2: '(00216) 71 344 096	',
          imgName: 'Tunis',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Agence+Principale+TUNISAIR/@36.8011979,10.1821271,17z/data=!3m1!4b1!4m5!3m4!1s0x12fd346e7e3a8457:0xcc8b18b7e1ea012c!8m2!3d36.8011878!4d10.1843229',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Liberté (Groupe)',
          adresse: '113 Av. de la Liberté',
          numTel1: '(00216) 71 841 258',
          numTel2: '(00216) 71 841 967',
          fax: '(00216) 71 802 336',
          imgName: 'avion',
          mapurl:
              'https://www.google.com/maps/place/Tunisair/@36.8173047,10.1765924,17z/data=!3m1!4b1!4m5!3m4!1s0x12fd34878002c797:0x5dfc00aca1119b96!8m2!3d36.8173085!4d10.1788197',
          icon: 'gazelle',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Liberté',
          adresse: '138 Av. de la Liberté',
          numTel1: '(00216) 31 370 527',
          numTel2: '(00216) 31 370 548',
          numTel3: '(00216) 31 370 549',
          imgName: 'avion',
          mapurl:
              'https://www.google.com/maps/place/138+Av.+de+La+Liberté,+Tunis+1002/@36.8183844,10.1761473,17z/data=!4m5!3m4!1s0x12fd3487715c23b5:0xa9d0008694a17063!8m2!3d36.8183844!4d10.178336',
          icon: 'gazelle',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence El Menzah',
          numTel1: '(00216) 71 718 111',
          numTel2: '(00216) 71 233 310',
          adresse: 'Menzah 4 Tunis',
          imgName: 'avion',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Agence+Tunisair+Saadi/@36.8447409,10.1814234,17z/data=!3m1!4b1!4m5!3m4!1s0x12fd34bb6d885823:0x88b0a8bb98999ce9!8m2!3d36.8447409!4d10.1836174',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence La Kasbah',
          numTel1: '(00216) 71 573 934',
          numTel2: '(00216) 71 571 751',
          numTel3: '(00216) 71 564 023',
          adresse: 'La Kasbah Tunis',
          imgName: 'avion',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/الخطوط+التونسية+القصبة%E2%80%AD/@36.7972117,10.1659666,17z/data=!3m1!4b1!4m5!3m4!1s0x12fd338ad1ecd179:0x79bfb887d407e4da!8m2!3d36.7972144!4d10.1681067',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence La Marsa',
          numTel1: '(00216) 71 775 222',
          numTel2: '(00216) 71 740 680',
          adresse: 'La Marsa',
          imgName: 'Marsa',
          mapurl:
              'https://www.google.com/maps/place/Tunisair+La+Marsa/@36.8795647,10.3251825,17z/data=!3m1!4b1!4m5!3m4!1s0x12e2b4f2acc34bbd:0x9627e1d6753c86cf!8m2!3d36.8795647!4d10.3273765',
          icon: 'gazelle',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Aéroport Tunis Carthage',
          numTel1: '(00216) 71 754 000',
          numTel2: '(00216) 71 848 000',
          numTel3: '(00216) 71 115 800',
          numTel4: '(00216) 70 702 100',
          adresse: 'Aéroport Tunis Carthage',
          imgName: 'Airport',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Tunis-Carthage+International+Airport/@36.8475562,10.2153661,17z/data=!3m1!4b1!4m5!3m4!1s0x12e2cad2e1d7f1bb:0x902488d100b5819b!8m2!3d36.8475562!4d10.2175601',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Fret Export / Import',
          numTel1: '(00216) 71 784 913',
          adresse: '',
          imgName: 'avion',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Fret+Tunis+Carthage/@36.8360815,10.2118059,17z/data=!3m1!4b1!4m5!3m4!1s0x12fd35e1eca14d6d:0x4de1edcc12336e37!8m2!3d36.8360815!4d10.2139999',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Tunisair Nabeul',
          numTel1: '(00216) 72 286 775',
          numTel2: '(00216) 72 285 193',
          adresse: '178, Av. Habib Bourguiba 8000 Nabeul',
          imgName: 'Nabeul',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Agence+Tunisair+Nabeul+الخطوط+التونسية+بنابل%E2%80%AD/@36.4559376,10.7307722,17z/data=!3m1!4b1!4m5!3m4!1s0x130299ead7bc41f7:0x152daf563b061537!8m2!3d36.4559376!4d10.7329662',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Tunisair Sousse',
          numTel1: '(00216) 70 164 563',
          numTel2: '(00216) 70 164 564',
          adresse: '5 Av Habib Bourguiba',
          imgName: 'avion',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Tunisair+Sousse/@35.8304417,10.6385029,17z/data=!3m1!4b1!4m5!3m4!1s0x13027574e6e1bd69:0x1a2d2e0fbb45516d!8m2!3d35.8304374!4d10.6406916',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Tunisair Sfax',
          numTel1: '(00216) 74 228 028',
          numTel2: '(00216) 74 297 080',
          numTel3: '(00216) 74 296 631',
          adresse: '4, Avenue de l' 'armée 3000 Sfax',
          imgName: 'Sfax',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/Tunisair/@34.7342461,10.7628762,17z/data=!3m1!4b1!4m5!3m4!1s0x13002d2d9e1e3213:0x23b320b8797b56cc!8m2!3d34.7342544!4d10.7650866',
          subAgences: []),
      Agence(
          color: Colors.blue,
          name: 'Agence Tunisair Djerba',
          numTel1: '(00216) 75 650 307',
          numTel2: '(00216) 75 650 320',
          numTel3: '(00216) 75 651 813',
          fax: '(00216) 75 653 104',
          adresse: 'Avenue Habib Bourguiba Houmt Souk',
          imgName: 'Djerba',
          icon: 'gazelle',
          mapurl:
              'https://www.google.com/maps/place/TUNISAIR+-+Agency+Houmt+Souk/@33.8740091,10.8557547,17z/data=!3m1!4b1!4m5!3m4!1s0x13aaa4e83fe5357d:0xdd82118188508155!8m2!3d33.8740404!4d10.8580432',
          subAgences: []),
    ];
  }
}

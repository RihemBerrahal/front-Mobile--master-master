import 'package:currency_flutter/constants/textstyle.dart';
import 'package:currency_flutter/screens/achatMiles.dart';
import 'package:currency_flutter/screens/agencelistpage.dart';
import 'package:currency_flutter/screens/converssionMiles.dart';
import 'package:currency_flutter/screens/infofidelys.dart';
import 'package:currency_flutter/screens/morenews.dart';
import 'package:currency_flutter/screens/reclmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../functions/fetchrates.dart';
import '../model/miles.dart';
import '../model/ratesmodel.dart';
import '../widgets/carousels.dart';
import 'achatBillet.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 16, bottom: 24),
                child: Text('Bienvenue 👋, découvrez nos derniers promos !',
                    style: TextStyle(fontSize: 18))),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 360,
                      child: Swiper(
                        onIndexChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        autoplay: true,
                        layout: SwiperLayout.DEFAULT,
                        itemCount: carousels.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                    carousels[index].image!,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: map<Widget>(carousels, (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.red
                                      : Colors.blueGrey),
                            );
                          }),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsPage(),
                                ));

                            setState(() {});
                          },
                          child: Text("Plus..",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        )
                      ],
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 10),
                child: Text("Merci d'avoir être Fidelys ❤️ !",
                    style: TextStyle(fontSize: 18))),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    SizedBox(
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AchatMiles(),
                              ));

                          setState(() {});
                        },
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12, right: 8),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.black26, width: 1),
                            ),
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Achat Miles",
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConverssionMiles(),
                              ));

                          setState(() {});
                        },
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 8, right: 12),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.black26, width: 1),
                            ),
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.loop_outlined,
                                size: 30,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Converssion Miles",
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 1),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          SizedBox(
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AchatBillet(),
                                    ));

                                setState(() {});
                              },
                              child: Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12, right: 8),
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.black26, width: 1),
                                  ),
                                  child: Row(children: <Widget>[
                                    Icon(
                                      Icons.airplane_ticket,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Achat Billet",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => recc(),
                                    ));

                                setState(() {});
                              },
                              child: Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 8, right: 12),
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.black26, width: 1),
                                  ),
                                  child: Row(children: <Widget>[
                                    Icon(
                                      Icons.file_copy,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Mes Réclamations",
                                              style: TextStyle(fontSize: 15)),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                          height: 50,
                          ),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 16, bottom: 24),
                child: Text('Bienvenue 👋, découvrez nos derniers promos !',
                    style: TextStyle(fontSize: 18))),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 360,
                      child: Swiper(
                        onIndexChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        autoplay: true,
                        layout: SwiperLayout.DEFAULT,
                        itemCount: carousels.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                    carousels[index].image!,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: map<Widget>(carousels, (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.red
                                      : Colors.blueGrey),
                            );
                          }),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsPage(),
                                ));

                            setState(() {});
                          },
                          child: Text("Plus..",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        )
                      ],
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 10),
                child: Text("Merci d'avoir choisi Tunisair ❤️ !",
                    style: TextStyle(fontSize: 18))),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    SizedBox(
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgenceListPage(),
                              ));

                          setState(() {});
                        },
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12, right: 8),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.black26, width: 1),
                            ),
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.apartment,
                                size: 30,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Nos Agences",
                                        style: TextStyle(fontSize: 18)),
                                    Text("Où nous trouvez ?",
                                        style: TextStyle(fontSize: 12))
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfosFidelys(),
                              ));

                          setState(() {});
                        },
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 8, right: 12),
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.black26, width: 1),
                            ),
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.info_outline,
                                size: 30,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Fidelys",
                                        style: TextStyle(fontSize: 18)),
                                    Text("C'est quoi Fidelys ?",
                                        style: TextStyle(fontSize: 12))
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FlightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Convertissement des Miles Primes en Miles Qualifiants"),
        Text("Miles Prime"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 170,
                height: 35,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                )),
          ],
        ),
        Text("Max 15647."),
        Text("Miles Qualifiants"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 170,
                height: 35,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 61,
                    height: 61,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/icons/circle.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Achat Miles Prime",
                          style: ApptextStyle.LISTTILE_TITLE),
                      Text("26/05/2022",
                          style: ApptextStyle.LISTTILE_SUB_TITLE),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("+10000",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          )),
                      Text("-0",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 61,
                    height: 61,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/icons/circle.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Convertissement des \nMiles Prime \nen Miles Qualifiant",
                          style: ApptextStyle.LISTTILE_TITLE),
                      Text("26/05/2022",
                          style: ApptextStyle.LISTTILE_SUB_TITLE),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("+2500",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          )),
                      Text("-5000",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 61,
                    height: 61,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/icons/circle.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Bonus", style: ApptextStyle.LISTTILE_TITLE),
                      Text("26/05/2022",
                          style: ApptextStyle.LISTTILE_SUB_TITLE),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("+3000",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          )),
                      Text("-0",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

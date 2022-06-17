import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Agence.dart';
import 'iconfont.dart';

class AgencyCard extends StatelessWidget {
  Agence agence;
  Function onCardClick;

  AgencyCard({required this.agence, required this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          this.onCardClick();
        },
        child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            height: 170,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                        'assets/imgs/' + this.agence.imgName + '.png',
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent
                            ])),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(this.agence.name,
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    ))
              ],
            )));
  }
}

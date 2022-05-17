import 'package:flutter/material.dart';
import 'package:histovet/src/pages/clinicalHistory/clinicalHistory_page.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';

import '../pet/pets_page.dart';

class GridDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;
    
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: [Container(
            height: 100,
              decoration: BoxDecoration(
                  color:Color.fromRGBO(33, 211, 255, 1), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Image.asset(
                    "assets/img/pet.png",
                    height: 120,
                    
                  ),
                  
                
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {Navigator.pushNamed(context, PetsPage.id);},
                    child: Text("Mascotas"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 211, 255, 1), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/img/medicine.png",
                    height: 110,
                    scale: 5,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {Navigator.pushNamed(context, MedicinePage.id);},
                    child: Text("Medicina"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 211, 255, 1), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/img/history.png",
                    height: 110,
                    scale: 5,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {Navigator.pushNamed(context, clinicalHistory.id);},
                    child: Text("Historias Clínicas"),
                  ),
                ],
              ),
            )
          ]
          ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(this.title, this.subtitle, this.event, this.img);
}
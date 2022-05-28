import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Login/signin_screen.dart';
import 'griddashboard.dart';

class Home extends StatefulWidget {
  static String id = "home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          signOut();
        },
        child: Icon(Icons.logout_rounded),
        backgroundColor: Colors.red,
      ),
   
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          

          Padding(
            
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("HistoVet",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "La historia médica de tu mascota a la mano",
                      style: TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                IconButton(
                  alignment: Alignment.topRight,
                  icon: Image.asset('assets/img/vet.png'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const GridDashboard()
        ],
      ),
    );
  }
}

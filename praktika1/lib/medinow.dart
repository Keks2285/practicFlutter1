import 'package:flutter/material.dart';

class MediNow extends StatefulWidget {
  const MediNow({Key? key}) : super(key: key);

  @override
  State<MediNow> createState() => _MediNowState();
}

class _MediNowState extends State<MediNow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 158, 162),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Align(
            child: Column(children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Text(
                    "medinow",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Text(
                  "Meditate width us",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                  child: ElevatedButton(
                      child: Text(
                        "Sign in width Aplle",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 50),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {})
                      ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                      child: Text(
                        "Continue width email or phone",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 50),
                          backgroundColor: Color.fromARGB(255, 205, 253, 254),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {})
                      ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text("Continue width Google",
                  style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255))
                  ), 
              ),
              Image.asset('assets/images/MeditateChel.png', width: 250, height: 250,),
            ]),
          ),
        ),
      ),
    );
  }
}

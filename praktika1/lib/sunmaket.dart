import 'package:flutter/material.dart';

class SunMaket extends StatefulWidget {
  const SunMaket({Key? key}) : super(key: key);

  @override
  State<SunMaket> createState() => _SunMaketState();
}

class _SunMaketState extends State<SunMaket> {
  List<String> RowValues = [
    " Bible in year ",
    " Dailies ",
    " Minutes ",
    " November "
  ];
  List<String> Paths = [
    'assets/images/moon.png',
    'assets/images/YellowMoon.png',
    'assets/images/moon.png',
    'assets/images/YellowMoon.png'
  ];
  List<String> Headers = [
    'The Sleep Hour',
    'Easy on the Mission',
    'Relax width Me',
    'Sun and Energy'
  ];
  List<String> Descriptions = [
    'Asha Mukfga',
    'Peter Mach',
    'Amanda James',
    'Michael Hiu'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Meditate",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: Icon(Icons.search, color: Colors.black))
          ]),
      body: Column(
        children: [
          SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      height: 30,
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 3, 158, 162),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text("All",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white)))),
                  ...RowValues.map(
                    (element) {
                      return CreateElementRow(element);
                    },
                  ),
                ],
              )),
          Container(
              width: 350,
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(children: [
                Card(
                    child: Column(
                  // crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 201, 76),
                          borderRadius: BorderRadius.circular(15)),
                      height: 150,
                      child:
                          //Column(
                          // children:[

                          Image.asset(
                        'assets/images/Sun.png',
                        width: 350,
                        height: 250,
                      ), //)
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("A Song of Moon",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                      child: Row(children: [
                        Text(
                          "Start with the basics",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18),
                        )
                      ]),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/heart.png'),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text('9 sessions'),
                            ),
                            Expanded(child: Text(""), flex: 1),
                            Container(
                              child: Text(
                                "Start",
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Image.asset(
                                  'assets/icons/chevron.forward.png'),
                            )
                          ],
                        )),
                  ],
                )),
                CreateRows(Paths, Headers, Descriptions),
              ])),
        ],
      ),
    ));
  }

  Widget CreateElementRow(String text) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        height: 30,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 254, 255),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 3, 158, 162)))));
  }

  Widget CreateRows(
      List<String> imagePath, List<String> Header, List<String> Desription) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Column(children: [
          Container(
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Card(
                        margin: EdgeInsets.fromLTRB(0, 20, 10, 0),
                        child: Column(
                          // crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 240, 146, 53),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 75,
                              child:
                                  //Column(
                                  // children:[

                                  Image.asset(
                                imagePath[0],
                                width: 320,
                                height: 250,
                              ), //)
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(Header[0],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                  ]),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                              child: Row(children: [
                                Text(
                                  Desription[0],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14),
                                )
                              ]),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                                child: Row(
                                  children: [
                                    Image.asset('assets/icons/heart.png'),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text('3 sessions'),
                                    ),
                                    Expanded(child: Text(""), flex: 1),
                                    Container(
                                      child: Text(
                                        "Start",
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Image.asset(
                                          'assets/icons/chevron.forward.png'),
                                    )
                                  ],
                                ))
                          ],
                        ))),
                Expanded(
                    flex: 1,
                    child: Card(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(
                          // crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 201, 76),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 75,
                              child:
                                  //Column(
                                  // children:[

                                  Image.asset(
                                imagePath[1],
                                width: 320,
                                height: 250,
                              ), //)
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(Header[1],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                  ]),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                              child: Row(children: [
                                Text(
                                  Desription[1],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14),
                                )
                              ]),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                                child: Row(
                                  children: [
                                    Image.asset('assets/icons/heart.png'),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text('5 minutes'),
                                    ),
                                    Expanded(child: Text(""), flex: 1),
                                    Container(
                                      child: Text(
                                        "Start",
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Image.asset(
                                          'assets/icons/chevron.forward.png'),
                                    )
                                  ],
                                ))
                          ],
                        ))),
              ],
            ),
          ),
          Container(
              child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Card(
                      margin: EdgeInsets.fromLTRB(0, 20, 10, 0),
                      child: Column(
                        // crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 47, 128, 237),
                                borderRadius: BorderRadius.circular(15)),
                            height: 75,
                            child:
                                //Column(
                                // children:[

                                Image.asset(
                              imagePath[2],
                              width: 320,
                              height: 250,
                            ), //)
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(Header[2],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                            child: Row(children: [
                              Text(
                                Desription[2],
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                              child: Row(
                                children: [
                                  Image.asset('assets/icons/heart.png'),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text('3 sessions'),
                                  ),
                                  Expanded(child: Text(""), flex: 1),
                                  Container(
                                    child: Text(
                                      "Start",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Image.asset(
                                        'assets/icons/chevron.forward.png'),
                                  )
                                ],
                              ))
                        ],
                      ))),
              Expanded(
                  flex: 1,
                  child: Card(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        // crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 245, 201, 76),
                                borderRadius: BorderRadius.circular(15)),
                            height: 75,
                            child:
                                //Column(
                                // children:[

                                Image.asset(
                              imagePath[1],
                              width: 320,
                              height: 250,
                            ), //)
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(Header[1],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                            child: Row(children: [
                              Text(
                                Desription[1],
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                              child: Row(
                                children: [
                                  Image.asset('assets/icons/heart.png'),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text('5 minutes'),
                                  ),
                                  Expanded(child: Text(""), flex: 1),
                                  Container(
                                    child: Text(
                                      "Start",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Image.asset(
                                        'assets/icons/chevron.forward.png'),
                                  )
                                ],
                              ))
                        ],
                      ))),
            ],
          ))
        ]));
  }
}

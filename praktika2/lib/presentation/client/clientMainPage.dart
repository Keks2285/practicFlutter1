import 'package:flutter/material.dart';


class ClientMainPage extends StatefulWidget {
  const ClientMainPage({Key? key}) : super(key: key);

  @override
  State<ClientMainPage> createState() => _ClientMainPageState();
}

class _ClientMainPageState extends State<ClientMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        Text(
          "Клиент",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
          ElevatedButton(
          child: Text('Назад',
          style: TextStyle(color:Colors.yellow),
          ),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 50),
              backgroundColor: Color.fromARGB(255, 52, 12, 199),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ))));
  }
}

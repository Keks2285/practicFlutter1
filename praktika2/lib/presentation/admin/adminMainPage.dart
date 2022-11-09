import 'package:flutter/material.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 50, 131),
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        Text(
          "Администратор",
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

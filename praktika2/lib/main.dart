import 'package:flutter/material.dart';
import 'package:praktika2/core/db/databasehelper.dart';


void main() async{
  await DataBaseHelper.instance.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
    
  }
}


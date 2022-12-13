
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/':(context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/second':(context) => SecondPage(title: 'Flutter Demo Home Page')
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String savedString ="";
  late SharedPreferences sharedPreferences;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    sharedPreferences.setInt("counter", _counter);
  }
  Future<void> initShared() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  
  @override
  void initState(){
    initShared().then((value) {
      _counter=sharedPreferences.getInt('counter') ?? 0;
      savedString =sharedPreferences.getString('savedString')??"empty";
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController _controller= TextEditingController();



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Сохраненная строка: $savedString'
            ),
            TextFormField(controller: _controller,),
            ElevatedButton(
            onPressed: (){
                Navigator.pushNamed(context, '/second', arguments: _controller.text);
                sharedPreferences.setString("savedString", _controller.text);
                _controller.clear();
            },
             child: Text("Новое окно")
            ), 
           


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

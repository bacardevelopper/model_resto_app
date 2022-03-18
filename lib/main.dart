// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names
import 'package:flutter/material.dart';
import './rect.dart';
import './data_simul.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // config data
  double _prix = 12.00;
  String _nom = "sandwich poulet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: scroll_module(),
      ),
      backgroundColor: Colors.grey,
    );
  }

  Widget scroll_module() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: laListeMenu(),
      ),
    );
  }

  List<Widget> laListeMenu() {
    Widget espacer = Container(
      height: 10.0,
    );
    List<Widget> maListe = [];
    data_db.forEach((element) {
      maListe.add(espacer);
      maListe.add(RectRadius(element['nom'], element['prix']));
      maListe.add(espacer);
    });
    return maListe;
  }
}

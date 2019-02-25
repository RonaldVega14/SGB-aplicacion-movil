import 'package:flutter/material.dart';
import 'package:sgb_app/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey =new GlobalKey<ScaffoldState>();

//----------------------------------------------------------Creando botones e Interfaz grafica----------------------------------------------------------
  
  @override
  Widget build(BuildContext context){
//Creando la interfaz grafica
    return Container(
        child: LoginScreen(),
    );
  }
}

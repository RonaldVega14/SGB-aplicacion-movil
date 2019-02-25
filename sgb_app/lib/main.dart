import 'package:flutter/material.dart';

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
  final formKey =new GlobalKey<FormState>();
  bool _isLoading =false, _userFound = false;
  String _email, _password;

//----------------------------------------------------------Funciones que cargan el Loading----------------------------------------------------------
  _showLoading() {
		setState(() {
		  _isLoading = true;
		});
    CircularProgressIndicator();
	}

  _hideLoading() {
		setState(() {
		  _isLoading = false;
		});
  }









//----------------------------------------------------------Metodo para hacer Login----------------------------------------------------------
  
  void _login(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      _showLoading();
      //performLogin();
    }
  }

//----------------------------------------------------------Creando botones e Interfaz grafica----------------------------------------------------------
  TextStyle style =TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.black);
  @override
  Widget build(BuildContext context){
//Email
    final emailField = TextFormField(
      validator: (val) => !val.contains('@') ? 'Invalid Email' :null,
      onSaved: (val) => _email = val,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0)
        )
      ),
    );
//Password
    final passwordField =TextFormField(
      validator: (val) => !(val.length > 5) ? 'Invalid Password' :null,
      onSaved: (val) => _password = val,
      obscureText: true,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0 , 15.0 , 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0)
        )
      ),
    );
//Login
    final loginButton = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(14.0),
      color: Color.fromRGBO(23, 17, 85, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
        onPressed: _login,
        child: Text("Entrar",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );
//SingUp
      final signUpButton = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(14.0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 15.0),
        onPressed: (){},
        child: Text("Registrarse",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      );
//Olvido su usuario
      final forgotUser = FlatButton(
        onPressed: (){},
        child: Text("¿Olvidó su usuario?",
        textScaleFactor: 0.9,
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.black54, fontWeight: FontWeight.bold)),
        );

//Olvido su contraseña
      final forgotPassword = FlatButton(
        onPressed: (){},
        child: Text("¿Olvidó su contraseña?",
        textScaleFactor: 0.9,
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.black54, fontWeight: FontWeight.bold)),
        );

//Creando la interfaz grafica
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      resizeToAvoidBottomPadding: true,
      body: Center(
        child: new Form(
          key:formKey,
          child: Container(
            color: Colors.white,
            child: Padding(
            padding: const EdgeInsets.all(36.0),
            child:SingleChildScrollView(
              reverse: true,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                  child: Image.asset("assets/logo_sgb.png",
                  fit:BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                //Email
                emailField,
                SizedBox(height: 25.0),
                //Password
                passwordField,
                SizedBox(height: 35.0),
                //Botones 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Login
                    loginButton,
                    SizedBox(height: 25.0),
                    //Registrarse
                    signUpButton
                    ],
                  ),
                SizedBox(height: 15.0),
                forgotUser,
                SizedBox(height: 1.0),
                forgotPassword,
                ], 
              ),
              )
            ),
          ),
        ),
      ),
    );
  }
}

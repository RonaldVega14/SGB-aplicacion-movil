import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
    
}
  
  class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{
  final scaffoldKey =new GlobalKey<ScaffoldState>();
  final formKey =new GlobalKey<FormState>();
  bool _isLoading =false;
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

 //-------------------------------------------------------------------------------------------------------------------------------------------
 
  @override
  void initState(){
    super.initState();
  }
  TextStyle style =TextStyle(fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    //Email
    final emailField = TextFormField(
      validator: (val) => !val.contains('@') ? 'Usuario Incorrecto' :null,
      onSaved: (val) => _email = val,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Usuario',
        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0)
        )
      ),
    );
//Password
    final passwordField =TextFormField(
      validator: (val) => !(val.length > 5) ? 'Contraseña Invalida' :null,
      onSaved: (val) => _password = val,
      obscureText: true,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        labelText: 'Contraseña',
        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0)
        )
      ),
    );
//Login
    final loginButton = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(16.0),
      color: Color.fromRGBO(23, 17, 85, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 3.0),
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
      borderRadius: BorderRadius.circular(16.0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(12.0, 1.0, 12.0, 1.0),
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
        textScaleFactor: 1,
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.black54, fontWeight: FontWeight.bold)),
        );

//Olvido su contraseña
      final forgotPassword = FlatButton(
        onPressed: (){},
        child: Text("¿Olvidó su contraseña?",
        textScaleFactor: 1,
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
            height: MediaQuery.of(context).size.height,
            alignment: Alignment(0, 0),
            color: Colors.white,
            child: Padding(
            padding: const EdgeInsets.fromLTRB(36.0, 25.0, 36.0, 15.0),
            child:SingleChildScrollView(
              reverse: true,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25.0),
                SizedBox(
                  height: 80.0,
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
                    //Registrarse
                    signUpButton,
                    ],
                  ),
                Divider(height: 65.0, color: Colors.black),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    forgotUser,
                    forgotPassword,
                ],
                ),
                ], 
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
      
}

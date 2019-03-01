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

//Construye el boton de olvido<info>?
    Widget _forgotInfo(String info){
      return FlatButton(
        onPressed: (){},
        child: Text(info,
        textScaleFactor: 0.8,
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.black54, fontWeight: FontWeight.bold)),
        );
    }

//Construye el contenido
  Widget _buildContent(){
    return new Form(
      key:formKey,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36.0, 0.0, 36.0, 20.0),
          child:SingleChildScrollView(
            reverse: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*0.10),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.13,
                  child: Image.asset("assets/logo_sgb.png",
                  fit:BoxFit.contain,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.08),
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
                Divider(height: 65.0, color: Colors.black, indent: 0.0,),
                Container(
                  margin: const EdgeInsets.only(top:10.0),
                  height: MediaQuery.of(context).size.height*0.12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(child: _forgotInfo("¿Olvidó su usuario?"), flex: 1, fit: FlexFit.tight),
                      Flexible(child: _forgotInfo("¿Olvidó su contraseña?"), flex: 1, fit: FlexFit.tight),
                    ],
                  ),
                ),
              ], 
            ),
          ),
        ),
      ),
    );
  }
//Creando la interfaz grafica
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      body: Center(
        child: _buildContent()
      ),
    );
  }
}

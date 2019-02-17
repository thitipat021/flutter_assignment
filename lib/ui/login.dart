import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
@override
LoginPageState createState() {
  return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    //int idchecker = 0;
    //int pswordchecker = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Log-in"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
      child: ListView(
        children: <Widget>[
          Image.asset("resources/snoopy.jpg",
          height: 200,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "User id",
              hintText: "Pls input user id",
              icon: Icon(Icons.person),
            ),
            validator: (value){
              if(value.isEmpty){
                return "Please Input User id";
              }else if(value == 'admin'){
                return "user or password ไม่ถูกต้อง";
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Pls input ur password",
              icon: Icon(Icons.lock),
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value){
              if(value.isEmpty){
                return "Please Input Password";
              }else if(value == 'admin'){
                return "user or password ไม่ถูกต้อง";
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: RaisedButton(
              color: Colors.orange,
              child: Text("LOGIN"),
              
              onPressed: () {
              if(_formkey.currentState.validate()){
                //idchecker = 0;
                //pswordchecker = 0;
                Navigator.pushNamed(context, "/home");}
                // else if(idchecker == 1 || pswordchecker == 1){
                //   Scaffold.of(context).showSnackBar(SnackBar(
                //   content: Text('user or password ไม่ถูกต้อง'),
                //   duration: Duration(seconds: 3),));
                // }
              },
            ),
          ),
          FlatButton(
            child: Text('Register New Account', 
            textAlign: TextAlign.right),
            textColor: Colors.orange,
            onPressed: (){
              Navigator.pushNamed(context, '/register');
            },
          )
        ],
      ),
      ),
    );
  }
}
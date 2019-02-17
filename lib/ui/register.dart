import 'package:flutter/material.dart';
import './login.dart';

class RegistPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistPageState();
  }
}

class RegistPageState extends State<RegistPage> {
  final _formKey = GlobalKey<FormState>();
  
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordagain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        centerTitle: true, title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: username,
              style: TextStyle(color: Colors.orange),
              decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.yellow)),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.yellow,
                  )
                  ),
            ),
            TextField(
              controller: password,
              style: TextStyle(color: Colors.orange),
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.yellow)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  )
                  ),
            ),
            TextField(
              controller: passwordagain,
              style: TextStyle(color: Colors.orange),
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Type Password again",
                  enabledBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.yellow)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  )
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonTheme(
              height: 45,
              child: RaisedButton(
                color: Colors.orange,
                child: Text(
                  "CONTINUE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if(username.text.isEmpty||
                  password.text.isEmpty||passwordagain.text.isEmpty){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: new Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("OK"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                      );
                    }
                  );
                } 
                else if(username.text=='admin'&&
              password.text.isNotEmpty&&passwordagain.text.isNotEmpty){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text("user นี้มีอยู่ในระบบแล้ว"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
                    );
                  }
                );
              } else{
                Navigator.pop(context);
              }
                  // if (username.text.isEmpty || password.text.isEmpty ||
                  //     passwordagain.text.isEmpty){
                  //   return "กรุณาระบุข้อมูลให้ครบถ้วน";
                  // }else if (username.text == "admin"){
                  //   return "user นี้มีอยู่ในระบบแล้ว";
                  // }else{
                  //   Navigator.push(context,MaterialPageRoute
                  //   (builder: (context) => LoginPage()
                  //   ));
                  // }
                },
              ),
            )
          ],
        ),
      ),
    );
    }
  }
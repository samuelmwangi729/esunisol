import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  _HomeState createState()=> new _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Sample Login Page'
        ),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget{
  LoginFormState createState()=> LoginFormState();
}

class LoginFormState extends State<LoginForm>{
  final formKey=new GlobalKey<FormState>();
  String _email='';
  String _password='';
  void ValidateAndSave(){
    final form=formKey.currentState;
    if(form.validate()){
      print('form Valid');
    }else{
      print('Form is Invalid');
    }
  }
  @override
  Widget build(BuildContext context)=>Container(
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email'
              ),
              validator: (value)=>value.isEmpty ? 'Email can\'t be empty ': null,
              onSaved: (value)=> _email=value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              validator: (value)=>value.isEmpty ? 'Password can\'t be empty ': null,
              onSaved: (value)=> _password=value,
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.teal,
              splashColor: Colors.blueAccent,
              child: Text(
                'Login'
              ),
              onPressed:ValidateAndSave,
            ),
          )
        ],
      )
    ),
  );
}
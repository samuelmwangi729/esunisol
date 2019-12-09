import 'package:flutter/material.dart';


class Login extends StatelessWidget{
@override
  Widget build(BuildContext context){
  return new Scaffold(
    backgroundColor: Colors.black45,
    body: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Image(
          image: AssetImage('assets/images/special.png'),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: new Column(
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Image(
                    width:75,
                    height: 75,
                    alignment: Alignment.centerLeft,
                    image: AssetImage('assets/images/Real.png'),
                  ),
                ),
              ),
              Form(
                child: Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0
                      )
                    )
                  ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                decoration: new InputDecoration(
                                    hintText: "Enter the Username here"
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                decoration: new InputDecoration(
                                    hintText: "Enter the Password here"
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2),
                            ),
                            MaterialButton(
                              color: Colors.teal,
                              textColor: Colors.white,
                              splashColor: Colors.deepPurpleAccent,
                              onPressed: ()=>{
                                print('Button Clicked')
                              },
                              child:Text(
                                'Login'
                              )
                            )
                          ],
                        ),
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
}
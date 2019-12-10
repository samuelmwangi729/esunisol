import 'package:flutter/material.dart';


class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconanimationController=new AnimationController(
      vsync:this,
      duration: new Duration(
        milliseconds: 2500
      ),
    );
    _iconAnimation= new CurvedAnimation(
      parent: _iconanimationController,
      curve: Curves.easeInQuart
    );
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconanimationController.forward();
  }
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
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: new Column(
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Image(
                    width:_iconAnimation.value*100,
                    height: _iconAnimation.value*100,
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(
                                decoration: new InputDecoration(
                                   labelText: 'Username/Email Address'
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: TextFormField(
                                decoration: new InputDecoration(
                                    labelText: 'Password'
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0),
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
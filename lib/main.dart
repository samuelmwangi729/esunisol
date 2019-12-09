import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:esunisol/login.dart';
import 'package:esunisol/Home.dart';
import 'package:esunisol/Portfolio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'eSUnisol School Management System'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex=0;
  String dropdownStr='network Security';
  Widget getPage(int currentIndex){
    switch(currentIndex){
      case 0:
        return Home();
        break;
      case 1:
        return Login();
        break;
      case 2:
        return Portfolio();
        break;
      default:
        return Home();

    }
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  void changeIndex(index){
    setState(() {
      _selectedIndex=index;
    });
  }

  void callContact(){
    print('Calling the contact');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        actions: <Widget>[
          Image(
           fit: BoxFit.cover,
            width: 100,
            image: AssetImage('assets/images/Real.png'),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child:Text(

                      widget.title
                  )
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child:ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
//                gradient: LinearGradient(colors:<Color>[
//                  Colors.red,
//                  Colors.deepPurple
//                ])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                      elevation: 10.0,
                      child: Image(
                        width:120,
                        height: 120,
                        alignment: Alignment.center,
                        image: AssetImage('assets/images/Real.png'),
                      ),
                    ),
                    Text(
                      'EliteSecurityConsultants',style: new TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                    )
                  ],
                ),
              ),

            ),
            CustomListTile(Icons.person,'Profile',()=>{}),
            CustomListTile(Icons.announcement,'Announcements',()=>{}),
            CustomListTile(Icons.settings,'Settings',()=>{}),
            CustomListTile(Icons.accessibility,'About Us',()=>{}),
            CustomListTile(Icons.settings_overscan,'Version 1.1',()=>{}),
            CustomListTile(Icons.lock_open,'Logout',()=>{}),
          ],
        )
      ),
     body:getPage(_selectedIndex),
     bottomNavigationBar: BottomNavigationBar(
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("home")),
         BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("Software")),
         BottomNavigationBarItem(icon: Icon(Icons.accessibility),title: Text("About Us"))
       ],
       currentIndex: _selectedIndex,
       onTap: changeIndex,
     ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class CustomListTile extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 20, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
          child:InkWell(
              splashColor: Colors.deepPurpleAccent,
              onTap: onTap,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 35,
                    child:Row(
                      children: <Widget>[
                        Icon(icon,color: Colors.blue),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child:Text(text,style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                          ),),
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_right),
                ],
              )
          )
      ),
    );
  }

}
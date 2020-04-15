import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertrainer/logic/auth/auth_bloc.dart';
import 'package:fluttertrainer/widgets/account_page.dart';
import 'package:fluttertrainer/widgets/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
//TODO ROUTES
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//      routes: {
//        "/" : (context) => MyHomePage(title: 'Flutter Demo Home Page')
//      },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/account":
              return MaterialPageRoute(builder: (context) => AccountPage());
            default:
              return MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page',));
          }
        },
      ),
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
  int _counter = 0;

  int selectedItem = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body(context),
//      TODO Drawer & Bottom Navigation Bar
      drawer: drawer(),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget body(BuildContext context) {
    switch (selectedItem) {
      case 0:
        return Profile();
      default:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        );
    }
  }

//  TODO Bottom Navigation Bar
  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
//      elevation: 16.0,
//      type: BottomNavigationBarType.shifting,
//      showSelectedLabels: false,
//      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
//            backgroundColor: Colors.red,
//            activeIcon: Icon(Icons.account_box),
            icon: Icon(Icons.account_circle),
            title: Text("Profile")),
        BottomNavigationBarItem(
//            backgroundColor: Colors.orange,
            icon: Icon(Icons.home),
            title: Text("Home")),
        BottomNavigationBarItem(
//            backgroundColor: Colors.brown,
            icon: Icon(Icons.settings),
            title: Text("Settings")),
      ],
      currentIndex: selectedItem,
      onTap: (index) {
        setState(() {
          selectedItem = index;
        });
      },
    );
  }

//  TODO Drawer
  Drawer drawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
//              dense: true,
//              enabled: false,
//              isThreeLine: true,
//              subtitle: Text("Home, sweet home"),
//              trailing: Icon(Icons.settings),
//              contentPadding: EdgeInsets.all(16),
//              contentPadding: EdgeInsets.symmetric(vertical: 16),
//              contentPadding: EdgeInsets.only(left: 16),
              selected: selectedItem == 1,
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  selectedItem = 1;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              selected: selectedItem == 0,
              title: Text("Profile"),
              leading: Icon(Icons.account_circle),
              onTap: () {
                setState(() {
                  selectedItem = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              selected: selectedItem == 2,
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                setState(() {
                  selectedItem = 2;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

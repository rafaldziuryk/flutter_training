import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrainer/widgets/account_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Użytkownik: ${name?.isNotEmpty == true ? name : "Niezalogowany"}"),
          RaisedButton(
            child: Text("Zaloguj"),
            onPressed: () async {
//              TODO Navigation between pages
              dynamic name = await Navigator.of(context).pushNamed("/account");
//           dynamic name = await Navigator.of(context).push(MaterialPageRoute(
//            builder: (context) => AccountPage()
//          ));
//          Navigator.pushReplacement(
//              context, MaterialPageRoute(builder: (context) => AccountPage()));
              setState(() {
                this.name = name;
              });
            },
          ),
        ],
      ),
    );
  }
}

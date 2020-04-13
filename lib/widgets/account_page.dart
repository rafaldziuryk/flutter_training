import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            RaisedButton(
//              TODO return value to previous page
              onPressed: () => Navigator.pop(context, controller.text),
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

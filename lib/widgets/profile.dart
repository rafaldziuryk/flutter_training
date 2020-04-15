import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertrainer/logic/auth/auth_bloc.dart';
import 'package:fluttertrainer/logic/auth/auth_event.dart';
import 'package:fluttertrainer/logic/auth/auth_state.dart';
import 'package:fluttertrainer/widgets/account_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder(
        bloc: BlocProvider.of<AuthBloc>(context),
        builder: (BuildContext context, state) {
          if (state is LoggedOutAuthState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Niezalogowany"),
                RaisedButton(
                  child: Text("Zaloguj"),
                  onPressed: () async {
//              TODO Navigation between pages
                    Navigator.of(context).pushNamed("/account");
//           dynamic name = await Navigator.of(context).push(MaterialPageRoute(
//            builder: (context) => AccountPage()
//          ));
//          Navigator.pushReplacement(
//              context, MaterialPageRoute(builder: (context) => AccountPage()));
                  },
                ),
              ],
            );
          } else if (state is LoggedInAuthState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Zalogowany jako: ${state.login}"),
                RaisedButton(child: Text("Wyloguj"), onPressed: () => BlocProvider.of<AuthBloc>(context).add(LogoutEvent()),)
              ],
            );
          } else {
            return Container();
          }
      },
      ),
    );
  }
}

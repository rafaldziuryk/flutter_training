import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertrainer/logic/auth/auth_event.dart';
import 'package:fluttertrainer/logic/auth/auth_state.dart';
import 'package:fluttertrainer/logic/auth/bloc.dart';

class AccountPage extends StatelessWidget {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<AuthBloc>(context),
      listener: (BuildContext context, state) {
        if (state is LoggedInAuthState) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Account"),
        ),
        body: Center(
          child: BlocBuilder(
            bloc: BlocProvider.of<AuthBloc>(context),
            builder: (BuildContext context, state) {
              if (state is LoggedOutAuthState) {
                return Column(
                  children: <Widget>[
                    TextField(
                      controller: controller,
                    ),
                    RaisedButton(
                      onPressed: () => BlocProvider.of<AuthBloc>(context).add(LoginEvent(controller.text)),
                      child: Text("Zaloguj"),
                    ),
                  ],
                );
              } else if (state is LoggingInAuthState) {
                return CircularProgressIndicator();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

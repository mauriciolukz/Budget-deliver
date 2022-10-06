import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../data/authentication_client.dart';
import '../utils/global.color.dart';
import 'login.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  var username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

        _initvar();

    });


  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: _AppBar(),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(username != null)
              Column(
                  children: [ Text("hola $username"),]
                )

            ,
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(GlobalColors.buttonColor),
                  foregroundColor: MaterialStateProperty.all<Color>(GlobalColors.textColorButton),
                ),
                onPressed: () async {},
                child:  Text('Salir $username',style: TextStyle(fontSize:14))
            )
          ],
        )
    );

  }

  PreferredSizeWidget? _AppBar(){

    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return AppBar(
      title: const Text("Budget - Deliver"),
      actions: <Widget>[Text("$username"),
        TextButton(
          style: style,
          onPressed: () async {
            await _authenticationClient.signOut();
            Navigator.pushNamedAndRemoveUntil(context,LoginView.routeName,(_) => false);
          },
          child: const Text('Salir'),
        ),
      ],
    );

  }

  Future<void> _initvar() async {
    username = (await _authenticationClient.username)!;
    setState(() {});
    print("mi alor $username");
  }

}

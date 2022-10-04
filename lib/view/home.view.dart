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

  final  _authenticationClient = GetIt.instance<AuthenticationClient>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(GlobalColors.buttonColor),
                  foregroundColor: MaterialStateProperty.all<Color>(GlobalColors.textColorButton),
                ),
                onPressed: () async {
                  await _authenticationClient.signOut();
                  Navigator.pushNamedAndRemoveUntil(context,LoginView.routeName,(_) => false);
                },
                child: const Text('Salir ',style: TextStyle(fontSize:14))
            )
          ],
        )
    );

  }

}

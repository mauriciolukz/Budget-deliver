import 'dart:async';
import 'package:budgetdeliver/data/authentication_client.dart';
import 'package:budgetdeliver/utils/global.color.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'home.view.dart';
import 'login.view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Timer(const Duration(seconds: 2), () {
        _checkLogin();
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: GlobalColors.backgroudColor,
      body: const Center(
          child: Text(
              'Budget',
              style: TextStyle(
                  color:Colors.white,
                  fontSize:35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NerkoOne'
              )
          )
      ),
    );
  }

  Future<void> _checkLogin() async {

    final token = await _authenticationClient.accessToken;

    if(token == null){
      Navigator.pushNamedAndRemoveUntil(context,LoginView.routeName,(_) => false);
      return;
    }
    Navigator.pushNamedAndRemoveUntil(context,HomeView.routeName,(_) => false);

  }

}

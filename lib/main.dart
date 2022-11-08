import 'package:budgetdeliver/utils/dependency_injection.dart';
import 'package:budgetdeliver/utils/global.color.dart';
import 'package:budgetdeliver/view/home.view.dart';
import 'package:budgetdeliver/view/login.view.dart';
import 'package:budgetdeliver/view/splash.view.dart';
import 'package:budgetdeliver/view/tire_check.dart';
import 'package:flutter/material.dart';

void main() {
  DependencyInjection.initialize();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget',
      home:  TireCheck(),
      //home:  SplashView(),
      routes: {
        LoginView.routeName: (context) => LoginView(),
        HomeView.routeName: (context) => HomeView(),
        TireCheck.routeName: (context) => TireCheck(),
      },
    );
  }
}

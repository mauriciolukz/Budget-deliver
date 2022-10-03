import 'dart:async';

import 'package:budgetdeliver/utils/global.color.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const LoginView());
    });

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
}

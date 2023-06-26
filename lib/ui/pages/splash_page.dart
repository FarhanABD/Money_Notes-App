import 'dart:async';

import 'package:financial_note/shared/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign_in', (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Container(
          width: 164,
          height: 164,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/money.png'))),
        ),
      ),
    );
  }
}

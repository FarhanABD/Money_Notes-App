import 'package:financial_note/shared/theme.dart';
import 'package:financial_note/ui/pages/add_page.dart';
import 'package:financial_note/ui/pages/menu_page.dart';
import 'package:financial_note/ui/pages/profile_page.dart';
import 'package:financial_note/ui/pages/sign_in.dart';
import 'package:financial_note/ui/pages/sign_up.dart';
import 'package:financial_note/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/sign_in': (context) => const SignInPage(),
        '/sign_up': (context) => const SignUpPage(),
        '/menu_page': (context) => const MenuPage(),
        '/add_page': (context) => const AddFinancialPage(),
        '/profile_page': (context) => const ProfilePage(),
      },
    );
  }
}

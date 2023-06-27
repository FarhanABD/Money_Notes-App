import 'package:financial_note/shared/theme.dart';
import 'package:financial_note/ui/widgets/button.dart';
import 'package:financial_note/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 80,
            margin: const EdgeInsets.only(
              top: 70,
              bottom: 80,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/financial_record.jpg'),
              ),
            ),
          ),

          //---------- TEXT DI SIGN IN PAGE ------------//
          Text(
            'Sign In & Catat Keuangan Anda',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //---------------- RECTANGLE EMAIL & PASSWORD TEXTFIELD ---------------//
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),

            //------------- PENEMPATAN TEXTFIELD EMAIL DAN PASSWORD -------//
            child: Column(
              children: [
                CustomFormField(
                  title: 'Alamat Email',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 38,
                ),

                //-------- WIDGET UNTUK BUTTON ----------//
                CustomFillButton(title: 'Sign In')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

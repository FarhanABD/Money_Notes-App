import 'package:financial_note/shared/shared_preferences.dart';
import 'package:financial_note/shared/snackbar_page.dart';
import 'package:financial_note/shared/theme.dart';
import 'package:financial_note/ui/widgets/button.dart';
import 'package:financial_note/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void login(BuildContext ctx, String email, String pass) async {
    if (email.isEmpty && pass.isEmpty) {
      CustomSnackBar.showToast(ctx, "Inputan Masih Kosong!");
    } else {
      String pEmail = await SharedPrefUtils.getEmail();
      String pPassword = await SharedPrefUtils.getPassword();

      if (email == pEmail && pass == pPassword) {
        //menu page
      } else {
        CustomSnackBar.showToast(ctx, "Login Gagal!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                  controller: emailController,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  title: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 38,
                ),

                //-------- WIDGET UNTUK BUTTON ----------//
                CustomFillButton(
                  title: 'Sign In',
                  onPressed: () {
                    login(
                        context, emailController.text, passwordController.text);
                  },
                )
              ],
            ),
          ),

          const SizedBox(
            height: 50,
          ),
          CustomTextButton(
            title: 'Buat Akun Baru',
            onPressed: () {
              //sign up page
            },
          ),
        ],
      ),
    );
  }
}

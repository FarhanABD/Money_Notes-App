import 'package:financial_note/shared/date_timenow.dart';
import 'package:financial_note/shared/shared_preferences.dart';
import 'package:financial_note/shared/snackbar_page.dart';
import 'package:financial_note/shared/theme.dart';
import 'package:financial_note/ui/widgets/button.dart';
import 'package:financial_note/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  void register(
    BuildContext ctx,
    String nama,
    String email,
    String pass,
  ) {
    SharedPrefUtils.saveNama(nama);
    SharedPrefUtils.saveEmail(email);
    SharedPrefUtils.savePassword(pass);
    SharedPrefUtils.saveTanggalGabung(DateTimeNow.datetimenow());

    CustomSnackBar.showToast(ctx, 'Berhasil Disimpan');
    Navigator.pushNamed(ctx, '/sign_in');
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController namaController = TextEditingController();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 80,
            margin: const EdgeInsets.only(
              top: 70,
              bottom: 70,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/financial_records.JPG'),
              ),
            ),
          ),

          //---------- TEXT DI SIGN IN PAGE ------------//
          Text(
            'Buat Akun Anda',
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
                  title: 'Nama',
                  controller: namaController,
                ),
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
                  title: 'Sign Up',
                  onPressed: () {
                    register(context, namaController.text, emailController.text,
                        passwordController.text);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 50,
          ),
          CustomTextButton(
            title: 'Sign In',
            onPressed: () {
              Navigator.pushNamed(context, '/sign_in');
            },
          ),
        ],
      ),
    );
  }
}

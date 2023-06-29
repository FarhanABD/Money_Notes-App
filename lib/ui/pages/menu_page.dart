import 'package:financial_note/shared/shared_method.dart';
import 'package:financial_note/shared/shared_preferences.dart';
import 'package:financial_note/shared/theme.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildProfile(context),
          buildWallet(context),
        ],
      ),

      //--------- BUTTON ADD DI MENU HOME ------------------------------------//
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: const Icon(Icons.add),
      ),
      //========================== END OF FLOATING BUTTON =================== //
    );
  }

  //------------ WIDGET PROFILE DI MENU HOME PAGE ----------------------------//
  Widget buildProfile(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),

              //---- FUTURE BUILDER UNTUK MEMANGGIL USERNAME USER PAS REGISTER KE KOME PAGE --//
              FutureBuilder(
                future: SharedPrefUtils.getNama(),
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  );
                },
              ),
              //======== ENDS OF FUTURE BUILDER ==============================//
            ],
          ),

          //---------- GAMBAR ICONS PROFILE DI MENU -------------------------//
          FutureBuilder(
            // future: SharedPrefUtils.getNama(),
            builder: (context, snapshot) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: snapshot.data == null
                        ? const AssetImage('assets/image-1.png')
                        : AssetImage('assets/image-1.png'),
                  ),
                ),
              );
            },
          ),
          //============== ENDS OF PROFILE ICONS IMAGE =======================//
        ],
      ),
    );
  }
  // ======================== ENDS OF WIDGET PROFILE =========================//

  //------------------ WIDGET WALLET DI MENU HOME PAGE -----------------------//
  Widget buildWallet(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/img_bg_card.png'),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            ),

            //--------- PENGAMBILAN DATA SALDO -------------------------------//
            FutureBuilder(
              future: SharedPrefUtils.getSaldo(),
              builder: (context, snapshot) {
                return Text(
                  '${formatCurrency(snapshot.data)}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  //========================= ENDS OF WIDGET WALLET ==========================//
}

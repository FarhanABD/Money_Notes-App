import 'package:financial_note/models/catatan.dart';
import 'package:financial_note/shared/separator.dart';
import 'package:financial_note/shared/shared_method.dart';
import 'package:financial_note/shared/shared_preferences.dart';
import 'package:financial_note/shared/theme.dart';
import 'package:financial_note/ui/widgets/history_transaksi_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Future<List<Catatan>> readCatatan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String catatanString = prefs.getString('catatan_key') ?? '';
    if (catatanString.isNotEmpty) {
      return Catatan.decode(catatanString);
    }

    return [];
  }

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
          buildHistory(context),
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
            //====== ENDS OF WIDGET PENGAMBILAN DATA SALDO =================//
            const SizedBox(
              height: 20,
            ),
            const Separator(
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            //---------------- ROW PEMASUKAN & PENGELUARAN -------------------//
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pemasukan',
                      style: whiteTextStyle,
                    ),
                    FutureBuilder(
                      future: SharedPrefUtils.getPemasukan(),
                      builder: (context, snapshot) {
                        return Text(
                          '${formatCurrency(snapshot.data)}',
                          style: whiteTextStyle.copyWith(fontWeight: semiBold),
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengeluaran',
                      style: whiteTextStyle,
                    ),
                    FutureBuilder(
                      future: SharedPrefUtils.getPengeluaran(),
                      builder: (context, snapshot) {
                        return Text(
                          '${formatCurrency(snapshot.data)}',
                          style: whiteTextStyle.copyWith(fontWeight: semiBold),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //========================= ENDS OF WIDGET WALLET ==========================//

  //---------------------- WIDGET HITORY -------------------------------------//
  Widget buildHistory(
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'History Transaksi',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: FutureBuilder(
              future: readCatatan(),
              builder: (context, snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                  itemBuilder: (context, index) => HistoryTransaksiItem(
                      iconUrl: snapshot.data!
                                  .elementAt(index)
                                  .tipeTransaksi
                                  .toString() ==
                              'pemasukan'
                          ? 'assets/transaksi_pemasukan.png'
                          : 'assets/transaksi_pengeluaran.png',
                      title:
                          snapshot.data!.elementAt(index).category.toString(),
                      date: snapshot.data!.elementAt(index).tanggal.toString(),
                      value: snapshot.data!
                                  .elementAt(index)
                                  .tipeTransaksi
                                  .toString() ==
                              'pemasukan'
                          ? '+ ${formatCurrency(snapshot.data!.elementAt(index).jumlah, symbol: '')}'
                          : '- ${formatCurrency(snapshot.data!.elementAt(index).jumlah, symbol: '')}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
  //====================== ENDS OF HISTORY WIDGET ============================//
}

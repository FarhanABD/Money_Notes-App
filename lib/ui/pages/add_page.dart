import 'package:financial_note/models/catatan.dart';
import 'package:financial_note/shared/shared_preferences.dart';
import 'package:financial_note/shared/snackbar_page.dart';
import 'package:financial_note/shared/theme.dart';
import 'package:financial_note/ui/widgets/button.dart';
import 'package:financial_note/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AddFinancialPage extends StatefulWidget {
  const AddFinancialPage({super.key});

  @override
  State<AddFinancialPage> createState() => _AddFinancialPageState();
}

enum TipeTransaksi { pengeluaran, pemasukan }

class _AddFinancialPageState extends State<AddFinancialPage> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  List<Catatan> catatanItems = [];
  final formKey = GlobalKey<FormState>();
  TipeTransaksi? group = TipeTransaksi.pemasukan;

  String kategori = '';

  void save(
    BuildContext context,
    String tanggal,
    String kategori,
    String tipeTransaksi,
    int jumlah,
    String catatan,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = const Uuid().v1();
    catatanItems.add(
      Catatan(
        id: id,
        tanggal: tanggal,
        tipeTransaksi: tipeTransaksi,
        kategori: kategori,
        jumlah: jumlah,
        catatan: catatan,
      ),
    );
    final String encodeData = Catatan.encode(catatanItems);
    await prefs.setString('catatan_key', encodeData);

    if (tipeTransaksi.contains('pengeluaran')) {
      int saldo = await SharedPrefUtils.readSaldo() - jumlah;
      SharedPrefUtils.saveSaldo(saldo);

      int pengeluaran = await SharedPrefUtils.readPengeluaran() + jumlah;
      SharedPrefUtils.savePengeluaran(pengeluaran);
    } else {
      int saldo = await SharedPrefUtils.readSaldo() + jumlah;
      SharedPrefUtils.saveSaldo(saldo);

      int pemasukan = await SharedPrefUtils.readPemasukan() + jumlah;
      SharedPrefUtils.savePemasukan(pemasukan);
    }

    CustomSnackBar.showToast(context, 'Berhasil Disimpan!');
    Navigator.pushNamed(context, '/menu_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Keuangan'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/menu_page');
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormField(
                    title: 'Tanggal',
                    controller: tanggalController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickerDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickerDate != null) {
                        String formatDate =
                            DateFormat('dd MMMM yyyy').format(pickerDate);

                        setState(() {
                          tanggalController.text = formatDate;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Tipe Transaksi',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  ListTile(
                    title: Text(
                      'Pengeluaran',
                      style: blackTextStyle.copyWith(fontWeight: regular),
                    ),
                    leading: Radio<TipeTransaksi>(
                      value: TipeTransaksi.pengeluaran,
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Pemasukan',
                      style: blackTextStyle.copyWith(fontWeight: regular),
                    ),
                    leading: Radio<TipeTransaksi>(
                      value: TipeTransaksi.pemasukan,
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Category',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: kategori == ''
                            ? Text(
                                '- Pilih Kategori -',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              )
                            : Text(
                                kategori,
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                        isDense: true,
                        isExpanded: true,
                        items: ['Gajian', 'Bonus', 'Hiburan', 'Tagihan', 'Dll']
                            .map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            kategori = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'Jumlah',
                    controller: jumlahController,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'Catatan',
                    controller: catatanController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFillButton(
                    title: 'Simpan',
                    onPressed: () {
                      if (kategori.isEmpty &&
                          tanggalController.text.isEmpty &&
                          jumlahController.text.isEmpty &&
                          catatanController.text.isEmpty) {
                        CustomSnackBar.showToast(
                            context, 'Inputan Masih Kosong');
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Info'),
                              content: const Text('Yakin Ingin Simpan ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Batal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    save(
                                        context,
                                        tanggalController.text,
                                        kategori,
                                        group.toString().split('.').last,
                                        int.parse(jumlahController.text),
                                        catatanController.text);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ya'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

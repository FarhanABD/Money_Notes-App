import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static saveNama(String nama) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('nama', nama);
  }

  static getNama() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('nama');
  }

  static saveNameImage(String nameImage) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('nameImage', nameImage);
  }

  static readNameImage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('nameImage');
  }

  static saveEmail(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
  }

  static getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('email');
  }

  static savePassword(String pass) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('pass', pass);
  }

  static getPassword() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('pass');
  }

  static saveTanggalGabung(String tanggalGabung) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('tanggalGabung', tanggalGabung);
  }

  static getTanggalGabung() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('tanggalGabung');
  }

  static saveSaldo(int saldo) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('saldo', saldo);
  }

  static readSaldo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('saldo') ?? 0;
  }

  static savePemasukan(int pemasukan) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('pemasukan', pemasukan);
  }

  static readPemasukan() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('pemasukan') ?? 0;
  }

  static savePengeluaran(int pengeluaran) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('pengeluaran', pengeluaran);
  }

  static readPengeluaran() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('pengeluaran') ?? 0;
  }
}

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

  static saveSaldo(String saldo) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('saldo', saldo);
  }

  static getSaldo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('saldo');
  }

  static savePemasukan(String pemasukan) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('saldo', pemasukan);
  }

  static getPemasukan() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('pemasukan');
  }

  static savePengeluaran(String pengeluaran) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('pengeluaran', pengeluaran);
  }

  static getPengeluaran() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('pengeluaran');
  }
}

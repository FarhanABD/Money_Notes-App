import 'dart:convert';

class Catatan {
  final String? id, tanggal, tipeTransaksi, kategori, catatan;
  final int? jumlah;

//------ CONSTRUCT -----//
  Catatan({
    this.id,
    this.tanggal,
    this.tipeTransaksi,
    this.kategori,
    this.jumlah,
    this.catatan,
    // required String kategori,
  });

  factory Catatan.fromJson(Map<String, dynamic> jsonData) {
    return Catatan(
      id: jsonData['id'],
      tanggal: jsonData['tanggal'],
      tipeTransaksi: jsonData['tipeTransaksi'],
      kategori: jsonData['kategori'],
      jumlah: jsonData['jumlah'],
      catatan: jsonData['catatan'],
    );
  }

  static Map<String, dynamic> toMap(Catatan cat) => {
        'id': cat.id,
        'tanggal': cat.tanggal,
        'tipeTransaksi': cat.tipeTransaksi,
        'kategori': cat.kategori,
        'jumlah': cat.jumlah,
        'catatan': cat.catatan,
      };

// Jadi, fungsi encode ini mengambil daftar objek Catatan, mengonversi setiap objek menjadi Map<String, dynamic>, dan kemudian mengenkripsi seluruh daftar objek tersebut menjadi string JSON.//

  static String encode(List<Catatan> cats) => json.encode(
      cats.map<Map<String, dynamic>>((cat) => Catatan.toMap(cat)).toList());

//Jadi, fungsi decode ini mengambil string JSON terenkripsi, mengurai dan mengonversinya menjadi daftar objek Catatan menggunakan metode fromJson.//

  static List<Catatan> decode(String cats) =>
      (json.decode(cats) as List<dynamic>)
          .map((item) => Catatan.fromJson(item))
          .toList();
}

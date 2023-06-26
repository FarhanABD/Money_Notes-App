import 'dart:convert';

class Catatan {
  final String? id, tanggal, tipeTransaksi, category, catatan;
  final int? jumlah;

//------ CONSTRUCT -----//
  Catatan({
    this.id,
    this.tanggal,
    this.tipeTransaksi,
    this.category,
    this.jumlah,
    this.catatan,
  });

  factory Catatan.fromJson(Map<String, dynamic> jsonData) {
    return Catatan(
      id: jsonData['id'],
      tanggal: jsonData['tanggal'],
      tipeTransaksi: jsonData['tipeTransaksi'],
      category: jsonData['category'],
      jumlah: jsonData['jumlah'],
      catatan: jsonData['catatan'],
    );
  }

  static Map<String, dynamic> toMap(Catatan cat) => {
        'id': cat.id,
        'tanggal': cat.tanggal,
        'tipeTransaksi': cat.tipeTransaksi,
        'category': cat.category,
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

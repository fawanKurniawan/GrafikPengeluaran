import 'package:flutter/foundation.dart';

class Transaksi {
  final String id, judul, nama, deskripsi, kategori;
  final double jumlah;
  final DateTime tanggal;

  Transaksi(
      {@required this.id,
      @required this.judul,
      @required this.nama,
      @required this.kategori,
      @required this.deskripsi,
      @required this.jumlah,
      @required this.tanggal});
}

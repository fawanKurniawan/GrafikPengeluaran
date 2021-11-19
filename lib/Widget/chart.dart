import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hematkuy/Model/blueprint.dart';
import 'package:hematkuy/Widget/chart_bar.dart';

class ChartView extends StatelessWidget {
  //
  //Tambahkan var untuk penampung dattar List Transaksi terakhir, lalu kita Konstruk ( konstruktor)
  final List<Transaksi> recentTransaksi;

  ChartView(this.recentTransaksi) {
    print('Constructor Chart');
  }
  //
  //Dibuat daftar BAR get perHari
  List<Map<String, dynamic>> get grupTransaksiHari {
    //
    //Perulangan daftar LIST index item untuk 7 hari atau alternatif dari looping daftar LIST index item untuk 7 hari
    return List.generate(7, (index) {
      //
      //mendapatkan hari ini sampai dengan 7 hari sebelumnya dengan bantuan substract duration dan isi substractnya diisi index generate yaitu 7
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalHarga = 0.0;

      //
      // menentukan total harga dalam 1 hari
      //Sub: recentTransaksi.lenght dari banyaknya daftar index tersebut
      for (var i = 0; i < recentTransaksi.length; i++) {
        if (recentTransaksi[i].tanggal.day == weekDay.day &&
            recentTransaksi[i].tanggal.month == weekDay.month &&
            recentTransaksi[i].tanggal.year == weekDay.year) {
          totalHarga += recentTransaksi[i].jumlah;
        }
      }

      /* print(DateFormat.E().format(weekDay));
      print(totalHarga); */

      //
      //return value MAP
      return {
        //
        //Penting untuk Method date jangan lupa menggunakan konstruktor .format()
        'days': DateFormat.E().format(weekDay).substring(0, 1),
        'ammount': totalHarga,
      };
    }).reversed.toList();
  }

  //menghitung jumlah total keseluruhan dalam 1 minggu
  double get totalSeminggu {
    return grupTransaksiHari.fold(0.0, (jumlah, item) {
      return jumlah + item['ammount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Class Chart()');
    //print(grupTransaksiHari);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //me-MAP sebuah daftar LIST yang sudah disortir transaksi values perhari
          children: grupTransaksiHari.map((e) {
            //dengan flex maka dapat meresponsive kan sebuah widget agar tidak memakan space row dengan dibagi rata spacenya
            return Flexible(
              fit: FlexFit.tight,
              //ChartBar dibawah ini merupakan sebuah objek ( bagi Dart ) dan diperlakukan Widget oleh flutter
              child: ChartBar(
                e['days'],
                e['ammount'],
                //untuk mendapatkan rasio yaitu (totalJumlah dalam 1 hari) / (totalJumlah dalam seminggu)
                totalSeminggu == 0.0 ? 0.0 : (e['ammount']) / totalSeminggu,
              ),
              //kita dapat mengakses properti dari objek itu, label, spendHarga, percentTotalHarga disini setelah objek ChartBar.
            );
          }).toList(),
        ),
      ),
    );
  }
}

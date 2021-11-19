import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hematkuy/Model/blueprint.dart';
import 'package:hematkuy/Widget/chart_bar.dart';

class ChartView extends StatelessWidget {
  
  final List<Transaksi> recentTransaksi;

  ChartView(this.recentTransaksi) {
    print('Constructor Chart');
  }
 
  List<Map<String, dynamic>> get grupTransaksiHari {
   
    return List.generate(7, (index) {
     
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalHarga = 0.0;

    
      for (var i = 0; i < recentTransaksi.length; i++) {
        if (recentTransaksi[i].tanggal.day == weekDay.day &&
            recentTransaksi[i].tanggal.month == weekDay.month &&
            recentTransaksi[i].tanggal.year == weekDay.year) {
          totalHarga += recentTransaksi[i].jumlah;
        }
      }

    
      return {
        //
        //Penting untuk Method date jangan lupa menggunakan konstruktor .format()
        'days': DateFormat.E().format(weekDay).substring(0, 1),
        'ammount': totalHarga,
      };
    }).reversed.toList();
  }

  
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
          
          children: grupTransaksiHari.map((e) {
          
            return Flexible(
              fit: FlexFit.tight,
             
              child: ChartBar(
                e['days'],
                e['ammount'],
                
                totalSeminggu == 0.0 ? 0.0 : (e['ammount']) / totalSeminggu,
              ),
            
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendHarga;
  final double percentTotalHarga;

  ChartBar(this.label, this.spendHarga, this.percentTotalHarga) {
    print('Constructor ChartBar');
  }

  @override
  Widget build(BuildContext context) {
    print('Class ChartBar()');
    //menggunakan LayoutBuilder tentang batasan yang diterapkan pada widget yang Anda gunakan (constraint)
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.15,
            child: Text(label),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          //penumpukan bar dengan bantuan stack()
          Container(
            height: constraints.maxHeight * 0.5,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    color: Color.fromRGBO(210, 210, 210, 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //apa itu kegunaan fractionallysizedbox?? (belom searching)
                FractionallySizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  heightFactor: percentTotalHarga,
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.white,
                width: 0.5,
              )),
              child: Text(
                'Rp.${spendHarga.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 11),
              ),
            )),
          ),
        ],
      );
    });
  }
}

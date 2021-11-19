import 'package:flutter/material.dart';
import 'package:hematkuy/Model/blueprint.dart';
import 'transaction_item.dart';

//import 'user_transaksi.dart';
//import 'package:hematkuy/main.dart';

class ListTransaksi extends StatelessWidget {
  //
  // PARAMETER KONSTRUKTOR DARI USERTRANSAKSI
  final List<Transaksi> transaksi2;
  final Function hapusTransaksi;

  //DI KONSTRUKSI DI SINI
  ListTransaksi(this.transaksi2, this.hapusTransaksi) {
    print('Constructor ListTransaksi');
  }

  @override
  Widget build(BuildContext context) {
    print('Class ListTransaksi()');
    return transaksi2.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const Text('Belom ada Transaksinya'),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: constraints.maxHeight * 0.9,
                  child: Image.network(
                    'https://product-image.juniqe-production.juniqe.com/media/catalog/product/seo-cache/x800/93/83/93-83-101P/Waiting-for-the-Sun-Viktor-Hertz-Poster.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transaksi2
                .map(
                  (tx) => ListItem(
                      key: ValueKey(tx.id),
                      transaksi: tx,
                      hapusTransaksi: hapusTransaksi),
                )
                .toList()

            /* Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.grey,
                            width: 2.5,
                          )),
                          margin: EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
                          child: Text(
                            'Rp.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(),
                          margin: EdgeInsets.fromLTRB(0, 7.5, 20, 7.5),
                          child: Text(
                              '${transaksi2[index].jumlah.toStringAsFixed(2)}'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                transaksi2[index].judul,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                DateFormat('EEEE, d MMMM y, H:m')
                                    .format(transaksi2[index].tanggal),
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                transaksi2[index].deskripsi,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ); */

            //Panjang LIST tergantung dari banyaknya data argumen konstruktor transaksi2

            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            );
  }
}

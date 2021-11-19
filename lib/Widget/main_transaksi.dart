import 'package:flutter/material.dart';
import 'package:hematkuy/Model/blueprint.dart';
import 'transaction_item.dart';


class ListTransaksi extends StatelessWidget {
  final List<Transaksi> transaksi2;
  final Function hapusTransaksi;

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
                .toList());
     }
}

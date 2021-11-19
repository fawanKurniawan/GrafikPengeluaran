import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hematkuy/Model/blueprint.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    Key key,
    @required this.transaksi,
    @required this.hapusTransaksi,
  }) : super(key: key);

  final Transaksi transaksi;
  final Function hapusTransaksi;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  Color _bgColor;

  @override
  void initState() {
    const avaibleColor = [
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.yellow
    ];

    _bgColor = avaibleColor[Random().nextInt(4)];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor, //Colors.green,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                'Rp.${widget.transaksi.jumlah.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaksi.judul,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 3, bottom: 10),
              child: Text(
                DateFormat('EEEE, d MMMM y, H:mm')
                    .format(widget.transaksi.tanggal),
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
            Container(
              child: FittedBox(
                child: Text(
                  widget.transaksi.deskripsi,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            )
          ],
        ),
        trailing: MediaQuery.of(context).size.width > 420
            ? TextButton.icon(
                onPressed: () => widget.hapusTransaksi(widget.transaksi.id),
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                ),
                label: const Text("Delete"),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Theme.of(context).errorColor))
                //textColor: Theme.of(context).errorColor,
                )
            : IconButton(
                padding: const EdgeInsets.only(right: 10),
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                ),
                color: Theme.of(context).errorColor,
                //pasing argumen fungsi dengan index id itu mengelink yang ingin dihapus
                onPressed: () => widget.hapusTransaksi(widget.transaksi.id),
              ),
      ),
    );
  }
}

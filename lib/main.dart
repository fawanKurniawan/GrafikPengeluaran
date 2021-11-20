import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:hematkuy/Model/blueprint.dart';
import 'package:hematkuy/Widget/chart.dart';
import 'package:hematkuy/Widget/form_transaksi.dart';
import 'package:hematkuy/Widget/main_transaksi.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.grey.shade50,
          errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(),
                button: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaksi> _transaksi = [
    Transaksi(
        id: 'sadaxasa',
        judul: 'Makan Seblakfdsfdsdd fsbrsbsdfsb s fsfsbs',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 12000.0,
        tanggal: DateTime.utc(2021, 3, 23, 13, 0, 00, 0)),
    Transaksi(
        id: 'ghsgda2',
        judul: 'Makan Seblakfdsfdsdd fsbrsbsdfsb s fsfsbs',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 42000.0,
        tanggal: DateTime.utc(2021, 3, 22, 15, 0, 00, 0)),
    Transaksi(
        id: 'cadadwaas',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 62000.0,
        tanggal: DateTime.utc(2021, 3, 27, 13, 0, 00, 0)),
    Transaksi(
        id: 'aacacds',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 12000.0,
        tanggal: DateTime.utc(2021, 3, 21, 13, 0, 00, 0)),
    Transaksi(
        id: 'svfsvfsdv',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 17000.0,
        tanggal: DateTime.utc(2021, 3, 25, 13, 0, 00, 0)),
    Transaksi(
        id: 'bddfgf',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 120090.0,
        tanggal: DateTime.utc(2021, 3, 24, 13, 0, 00, 0)),
    Transaksi(
      id: 'scsfscfs',
      judul: 'Makan Seblak',
      kategori: 'Jajan',
      nama: 'Fajar Kurniawan',
      deskripsi: 'Makan',
      jumlah: 19000.0,
      tanggal: DateTime.utc(2021, 3, 23, 13, 0, 00, 0),
    ),
    Transaksi(
      id: 'bsbfssdfesf',
      judul: 'Tas Eiger',
      kategori: 'Peralatan',
      nama: 'Fajar Kurniawan',
      deskripsi: 'Kerja',
      jumlah: 180000,
      tanggal: DateTime.utc(2021, 3, 26, 13, 0, 00, 0),
    )
  ];
  //
  //
  //get data dari _transaksi dan difilter berdasarkan hari per 7 hari
  List<Transaksi> get _recentTransaksi {
    return _transaksi.where((tx) {
      return tx.tanggal.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  
  void _tambahTransaksiBaru(String txJudul, String txNama, String txKategori,
      String txDeskripsi, double txJumlah, DateTime txTanggal) {
  
    final tambahTransaksi = Transaksi(
        id: DateTime.now().toString(),
        judul: txJudul,
        kategori: txKategori,
        nama: txNama,
        deskripsi: txDeskripsi,
        jumlah: txJumlah,
        tanggal: txTanggal);
   
    setState(() { 
      _transaksi.add(tambahTransaksi);
    });
  }

  void _hapusTransaksi(String id) {
    setState(() {
      return _transaksi.removeWhere((element) => element.id == id);
    });
  }

  void _modalHomepage(BuildContext aCtx) {
    showModalBottomSheet(
        context: aCtx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: FormTransaksi(_tambahTransaksiBaru),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Widget> _buildLandscape(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListTransaksi) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Tampilkan Chart:'),
          Switch(
              value: _showChartView,
              onChanged: (val) {
                setState(() {
                  _showChartView = val;
                });
              })
        ],
      ),
      _showChartView
          ? Container(
                      height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: ChartView(_recentTransaksi))
          : txListTransaksi
    ];
  }

  List<Widget> _buildPotrait(
    MediaQueryData mediaQuery,
    AppBar appBar,
    Widget txListTransaksi,
  ) {
    return [
      Container(
        height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.3,
          child: ChartView(_recentTransaksi)),
      txListTransaksi
    ];
  }

  bool _showChartView = false;

  @override
  Widget build(BuildContext context) {
    print('Class MyHomePage()');
    final mediaQuery = MediaQuery.of(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      backgroundColor: Colors.green,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: null,
      ),
      title: Text('Mafiana'),
      centerTitle: true,
      actions: [
        IconButton(
            padding: EdgeInsets.only(right: 20),
            hoverColor: Colors.green,
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () => _modalHomepage(context))
      ],
    );

    final txListTransaksi = Container(
       height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: ListTransaksi(_transaksi, _hapusTransaksi));
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           if (isLandscape)
              ..._buildLandscape(mediaQuery, appBar, txListTransaksi),
           if (!isLandscape)
              ..._buildPotrait(mediaQuery, appBar, txListTransaksi),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _modalHomepage(context),
        child: Icon(
          Icons.add,
          size: 40,
        ),
        focusColor: Colors.red,
        splashColor: Colors.white,
        tooltip: Text('sadsad').toString(),
        hoverColor: Colors.red,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

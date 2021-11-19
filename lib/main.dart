import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:hematkuy/Model/blueprint.dart';
import 'package:hematkuy/Widget/chart.dart';
import 'package:hematkuy/Widget/form_transaksi.dart';
import 'package:hematkuy/Widget/main_transaksi.dart';

//var sekarang = DateFormat('EEEE, d MMMM y, H:m').format(new DateTime.now());

void main() {
  //Bila ingin menonaktifkan mode landscape, maka dengan menambahkan method SystemChrome.SetPreferredOrientations dan diisi dengan construkctor  DeviceOrientation.potraitUp dan DeviceOrientation.potraitDown.
  //Sekarang satu catatan penting pada versi terbaru dari flutter. Anda perlu menambahkan WidgetsFlutterBinding.ensureInitialized() diatas method systemchrome
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
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
        id: 'ghsgda2',
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
        id: 'ghsgda2',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 62000.0,
        tanggal: DateTime.utc(2021, 3, 27, 13, 0, 00, 0)),
    Transaksi(
        id: 'ghsgda2',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 12000.0,
        tanggal: DateTime.utc(2021, 3, 21, 13, 0, 00, 0)),
    Transaksi(
        id: 'ghsgda2',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 17000.0,
        tanggal: DateTime.utc(2021, 3, 25, 13, 0, 00, 0)),
    Transaksi(
        id: 'ghsgda2',
        judul: 'Makan Seblak',
        kategori: 'Jajan',
        nama: 'Fajar Kurniawan',
        deskripsi: 'Makan',
        jumlah: 120090.0,
        tanggal: DateTime.utc(2021, 3, 24, 13, 0, 00, 0)),
    Transaksi(
      id: 'ghsgda2',
      judul: 'Makan Seblak',
      kategori: 'Jajan',
      nama: 'Fajar Kurniawan',
      deskripsi: 'Makan',
      jumlah: 19000.0,
      tanggal: DateTime.utc(2021, 3, 23, 13, 0, 00, 0),
    ),
    Transaksi(
      id: 'ghsse',
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
    // parameter list _transaksi dibagi menjadi per 7 hari
    return _transaksi.where((tx) {
      return tx.tanggal.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  //
  //method untuk store ke model
  void _tambahTransaksiBaru(String txJudul, String txNama, String txKategori,
      String txDeskripsi, double txJumlah, DateTime txTanggal) {
    //
    //Store ke model Transaksi
    final tambahTransaksi = Transaksi(
        id: DateTime.now().toString(),
        judul: txJudul,
        kategori: txKategori,
        nama: txNama,
        deskripsi: txDeskripsi,
        jumlah: txJumlah,
        tanggal: txTanggal);

    //
    //Finishing store ke var transaksi
    setState(() {
      //transaksi.add(tambahTransaksi);
      _transaksi.add(tambahTransaksi);
    });
  }

  void _hapusTransaksi(String id) {
    setState(() {
      return _transaksi.removeWhere((element) => element.id == id);
    });
  }
/* void _hapusTransaksiBaru(
    String txJudul,
    String txNama,
    String txKategori,
    String txDeskripsi,
    double txJumlah,
  ) {
    //
    //Store ke model Transaksi
    final tambahTransaksi = Transaksi(
        id: DateTime.now().toString(),
        judul: txJudul,
        kategori: txKategori,
        nama: txNama,
        deskripsi: txDeskripsi,
        jumlah: txJumlah,
        tanggal: DateTime.now());

    //
    //Finishing store ke var transaksi
    setState(() {
      //transaksi.add(tambahTransaksi);
      _transaksi.remove(tambahTransaksi);
    });
  } */

  //Kalo membuat sebuah contex atau item build halaman, maka membutuhkan (BuildContext)
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

  /* void _modalSatu(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (sada) {
          return FormTransaksi(_tambahTransaksiBaru);
        });
  } */

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
              //perhitungan untuk me responsive kan suatu page dengan perhitungan, statusbar, appBar, dan widgetnya itu sendiri
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
          //perhitungan untuk me responsive kan suatu page dengan perhitungan, statusbar, appBar, dan widgetnya itu sendiri
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
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // TODO: implement initState
    super.initState();
  }

  @override
  //Jadi metode ini akan dipanggil setiap kali siklus hidup Anda berubah,
  //setiap kali aplikasi mencapai keadaan baru dalam siklus hidup
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement dispose
    super.dispose();
  }

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
        //perhitungan untuk me responsive kan suatu page dengan perhitungan, statusbar, appBar, dan widgetnya itu sendiri
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
            //Pengkondisian Mode Landscape or Potrait, dan menggunakan scatter operator untuk mendefinisikan method tersebut berupa list
            //landscape kondisi
            if (isLandscape)
              ..._buildLandscape(mediaQuery, appBar, txListTransaksi),
            //Potrait kondisi
            if (!isLandscape)
              ..._buildPotrait(mediaQuery, appBar, txListTransaksi),

            /* Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(),
                    TextField(),
                  ],
                ),
              )
            ],
          ),*/
          ],
        ),
      ),

      //

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

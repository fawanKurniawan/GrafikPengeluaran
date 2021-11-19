import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormTransaksi extends StatefulWidget {
  //
  // PARAMETER KONSTRUKTOR DARI USERTRANSAKSI
  final tambahTransaksiBaru2;

  //DI KONSTRUKSI DI SINI
  FormTransaksi(this.tambahTransaksiBaru2) {
    print('Constructor FormTransaksi Widget');
  }

  @override
  _FormTransaksiState createState() {
    print('CreateState FormTransaksi Widget');
    return _FormTransaksiState();
  }
}

class _FormTransaksiState extends State<FormTransaksi> {
  //
  //Variabel wadah/penerima textfield
  final judulController = TextEditingController();

  final namaController = TextEditingController();

  final kategoriController = TextEditingController();

  final jumlahController = TextEditingController();

  final deskripsiController = TextEditingController();
  DateTime _valueTanggal;

  _FormTransaksiState() {
    print('Constructor FormTransaksi State');
  }

  void _submitValidation() {
    if (jumlahController.text.isEmpty) {
      return;
    }
    //
    //inisialisasi named var dari Var Penerima TexField diatas
    final vJudul = judulController.text;
    final vNama = namaController.text;
    final vKategori = kategoriController.text;
    final vDeskripsi = deskripsiController.text;
    final vJumlah = double.parse(jumlahController.text);
    final vTanggal = _valueTanggal;

    //Kondisi NOT NULL

    if (vJudul.isEmpty ||
        vNama.isEmpty ||
        vKategori.isEmpty ||
        vDeskripsi.isEmpty ||
        vDeskripsi.isEmpty ||
        vJumlah <= 0 ||
        vTanggal == null) {
      return;
    }

    //
    //Store KEMBALI KE USERTRANSAKSI()
    widget.tambahTransaksiBaru2(
      vJudul,
      vNama,
      vKategori,
      vDeskripsi,
      vJumlah,
      vTanggal,
    );

    //untuk menutup laya/page modal secara otomatis
    Navigator.of(context).pop();
  }

  //DatePicker untuk form tanggal
  void _pilihTanggal() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 6)),
      lastDate: DateTime.now(),
      //then (kemudian) diisi parameter value yaitu karna disini datepicker mengembalikan return Future, jadi diisi dengan .then()
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _valueTanggal = value;
      });
    });
  }

  @override
  void initState() {
    print('initState()');
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FormTransaksi oldWidget) {
    print('didUpdateWidget()');
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Class FormTransaksi()');
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          width: 200,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              top: 10,
              left: 10,
              right: 10),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Judul Pengeluaran :'),
                controller: judulController,
                onSubmitted: (_) => _submitValidation(),
                //  onChanged: (valJudul) => inputJudul = valJudul),
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Nama Pengeluaran :'),
                controller: namaController,
                onSubmitted: (_) => _submitValidation(),
                //onChanged: (valHarga) => inputHarga = valHarga,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Kategori :'),
                controller: kategoriController,
                onSubmitted: (_) => _submitValidation(),
                //onChanged: (valHarga) => inputHarga = valHarga,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Jumlah Pengeluaran :'),
                controller: jumlahController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitValidation(),
                //onChanged: (valHarga) => inputHarga = valHarga,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Deskripsi :'),
                controller: deskripsiController,
                onSubmitted: (_) => _submitValidation(),
                //onChanged: (valHarga) => inputHarga = valHarga,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _valueTanggal == null
                            ? 'Kamu Belum Memilih Tanggal'
                            : 'Tanggal: ${DateFormat('EEEE, d MMMM y').format(_valueTanggal)}',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    TextButton(
                      onPressed: _pilihTanggal,
                      child: Text(
                        'Pilih Tanggal Disini',
                        style: TextStyle(
                            fontWeight:
                                Theme.of(context).textTheme.button.fontWeight,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.button.fontSize),
                ),
                //textColor: Theme.of(context).textTheme.button.color,
                //color: Colors.lightGreen,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightGreen),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).textTheme.button.color)),
                onPressed: _submitValidation,
              )
            ],
          ),
        ),
      ),
    );
  }
}

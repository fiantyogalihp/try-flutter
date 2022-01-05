// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  //variable int number utuk menyimpan bilangan yg akan eribah ketika kita mengklik tombol
  void TekanTombol() {
    //jika function berisi lebih dari satu menggunakan '{}', jika function hanya satu lebih baik menggunakan '=>'.
    //'tekanTombol' adalah method yg harus dibuat agar Button berjalan dengan baik,
    setState(() {
      // setState(() {}); adalah perintah unruk merefresh tampilan stateful widget sesuai dengan kondsi yang ada saat itu juga
      number = number + 1; //ini adalah kondisi
    });
  }

  void Ulang() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Myapp'),
        ),
        body: Center(
          child: Container(
            decoration:
                BoxDecoration(gradient: LinearGradient(colors: Colors.accents)),
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(17),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[Colors.amber, Colors.blue],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    number.toString(),
                    style: TextStyle(fontSize: 10 + number.toDouble()),
                  ),
                  //disini var number berype data int. ketika ditampilkan harus dirubah ke dalam String
                  //style text, pada parameter fontsize, type data fontsize dalah double, jadi yang tadinya number=int harus diubah ke number.toDouble
                  //summary, ketika memanggil variable harus menyesuaikan kondisi dan tempatnya dari type datanya tersebut
                  RaisedButton(
                    //RaisedButton() adalah widget lama dar flutter
                    color: Colors.orange,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    onPressed: TekanTombol,
                    //onPressed adlah event handler, yaitu ketika buttton nya di klik akan menjalankan method apa
                    //yang memiliki nama method 'TekanTombol'
                    child: Text('Tambah bilangan'),
                  ),
                  ElevatedButton(
                    //ElevatedButton() adalah widget baru dari flutter
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onPressed: Ulang,
                    //onPressed adlah event handler, yaitu ketika buttton nya di klik akan menjalankan method apa
                    //yang memiliki nama method 'TekanTombol'
                    child: Text('Refresh Semula'),
                  ),
                  //can replace row,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  int counter = 1;
  List<Widget> widgets = [];
  //variable int number utuk menyimpan bilangan yg akan eribah ketika kita mengklik tombol
  void TombolTambah() {
    //jika function berisi lebih dari satu menggunakan '{}', jika function hanya satu lebih baik menggunakan '=>'.
    //'tekanTombol' adalah method yg harus dibuat agar Button berjalan dengan baik,
    setState(() {
      // setState(() {}); adalah perintah unruk merefresh tampilan stateful widget sesuai dengan kondsi yang ada saat itu juga
      //number = number + 1; ini adalah kondisi
      widgets.add(Text(
        'Data ke-' + counter.toString(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 35,
          fontStyle: FontStyle.italic,
        ),
      ));
      counter++;

      number.toString();
      number++;
    });
  }

  // void Ulang() {
  //   setState(() {
  //     number = 0;
  //   });
  // }
  //tidak menggunakan ini karena memakai Anonymous method

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Myapp',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: Colors.accents)),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(17),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: <Color>[Colors.amber, Colors.blue],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey,
                        ),
                        child: Text(
                          number.toString(),
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      //disini var number berype data int. ketika ditampilkan harus dirubah ke dalam String
                      //style text, pada parameter fontsize, type data fontsize dalah double, jadi yang tadinya number=int harus diubah ke number.toDouble
                      //summary, ketika memanggil variable harus menyesuaikan kondisi dan tempatnya dari type datanya tersebut
                      ElevatedButton(
                        //RaisedButton() adalah widget lama dari flutter
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onPressed: TombolTambah,
                        //onPressed adlah event handler, yaitu ketika buttton nya di klik akan menjalankan method apa
                        //yang memiliki nama method 'TekanTombol'
                        child: const Text('Tambah Data'),
                      ),
                      ElevatedButton(
                        //ElevatedButton() adalah widget baru dari flutter
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange, //background
                          onPrimary: Colors.white, //text color
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onPressed: () {
                          //"onPressed: () {}" diganti "Ulang," jika tidak menggunakan Anonymous method
                          setState(() {
                            widgets.removeLast();
                            counter--;
                            // number -= 1;
                            number--;
                          });
                        },
                        //ini adalah anonymous method, method yang tidak memiliki nama
                        //ini cocok digunakan jika method nya tidak pernah dipanggil di tempat lain
                        child: const Text('Hapus Data'),
                      ),
                      //can replace row,
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: widgets,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

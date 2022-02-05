import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _number = 0;
  int counter = 1;
  List<Widget> widgets = [];
  //variable int _number utuk menyimpan bilangan yg akan eribah ketika kita mengklik tombol
  void TombolTambah() {
    //jika function berisi lebih dari satu menggunakan '{}', jika function hanya satu lebih baik menggunakan '=>'.
    //'tekanTombol' adalah method yg harus dibuat agar Button berjalan dengan baik,
    setState(() {
      // setState(() {}); adalah perintah unruk merefresh tampilan stateful widget sesuai dengan kondsi yang ada saat itu juga
      //_number +=1; ini adalah kondisi
      widgets.add(Center(
          child: Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.pink,
              ),
              width: 210,
              height: 90,
              child: Text(
                'Data ke-' + counter.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ))));
      counter++;

      '$_number';
      _number++;
    });
  }

  // void Ulang() {
  //   setState(() {
  //     _number = 0;
  //   });
  // }
  //tidak menggunakan ini karena memakai Anonymous method

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Myapp',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(3),
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
                          '$_number',
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      //disini var _number berype data int. ketika ditampilkan harus dirubah ke dalam String
                      //style text, pada parameter fontsize, type data fontsize dalah double, jadi yang tadinya _number=int harus diubah ke _number.toDouble
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
                        onPressed: (widgets.isEmpty)
                            ? null
                            : () {
                                //"onPressed: () {}" diganti "Ulang," jika tidak menggunakan Anonymous method
                                setState(() {
                                  widgets.removeLast();
                                  counter--;
                                  // _number -= 1;
                                  _number--;
                                });
                              },
                        //ini adalah anonymous method, method yang tidak memiliki nama
                        //ini cocok digunakan jika method nya tidak pernah dipanggil di tempat lain
                        child: const Text('Hapus Data'),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            onPrimary: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: (widgets.isEmpty)
                              ? null
                              : () {
                                  setState(() {
                                    widgets.clear();
                                    _number = 0;
                                    counter = 1;
                                  });
                                },
                          child: Text('Refresh')),
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

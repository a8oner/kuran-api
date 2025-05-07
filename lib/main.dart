import 'package:a12_proje/pages/home_page.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuranApp',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


/*
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int secilenIndeks=0;
  var sayfaListesi=[HomePage(),SurahsVerses(surahName: null!, id: null!)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: sayfaListesi[secilenIndeks],
      drawer: Drawer(child: ListView(
        children: [
          DrawerHeader(
            child: Text('Başlık tasarımı',style: TextStyle(color: Colors.white,fontSize: 30),),
        decoration: BoxDecoration(color:Colors.deepPurple),
          ),
        ListTile(
          title: Text('Sayfa Bir'),
          onTap:(){
            setState(() {
              secilenIndeks=0;
            });
            Navigator.pop(context);
          },
        ),
          ListTile(
            title: Text('Sayfa İki',style: TextStyle(color: Colors.pink),),
            onTap:(){
              setState(() {
                secilenIndeks=1;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),),
    );
  }
}
 */


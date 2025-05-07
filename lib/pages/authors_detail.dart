import 'dart:convert';
import 'dart:io';


import 'package:a12_proje/constants/constant.dart';
import 'package:a12_proje/models/authors_detail_model.dart';
import 'package:a12_proje/models/data1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthorsDetail extends StatelessWidget {
  final int id;  //yazar id'si
  final String yazarName;

  final int sura_id;

  final int ayet_id;

  List<AuthorsDetailModel>authorsVerses=[];
  AuthorsDetail({Key? key, required this.id, required this.yazarName, required this.sura_id, required this.ayet_id,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;


    return Scaffold(appBar: AppBar(title: Text(yazarName),),
    body: FutureBuilder(
      
        future:getAuthorsDetail(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data=snapshot.data;
            if(data!=null){
              return  SizedBox(
                 height: ekranYuksekligi,
                  width: ekranGenisligi,
                  child: SingleChildScrollView(
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 15.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      color: Colors.greenAccent,child: Text(data.translation!.text.toString(),style: Constant.getTextStyle4(),),),
                  ));
            }else{
              return Center(child: Text('veri yok'),);
            }
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
    ),
    );

  }
  Future<Data>getAuthorsDetail()async{
    try {
      debugPrint('id: $id');
      var url = Uri.parse(
          'https://api.acikkuran.com/surah/$sura_id/verse/$ayet_id?author=$id');
      var response = await http.get(url);
      if (response.statusCode == HttpStatus.ok) {
        return AuthorsDetailModel.fromJson(jsonDecode(response.body)).data!;

      } else {
        return throw Exception();
      }
    } catch(e){
      debugPrint('getAuthorsVerses hata: $e');
      return throw Exception();
    }
  }
}

/*
import 'dart:convert';
import 'dart:io';

import 'package:a12_proje/models/authors_detail_model.dart';
import 'package:a12_proje/models/data1.dart';
import 'package:a12_proje/models/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthorsDetail extends StatelessWidget {
  final int id;  //yazar id'si
  final String yazarName;
//  final SurahsModel sura_id;   required this.sura_id
  List<AuthorsDetailModel>authorsVerses=[];
  AuthorsDetail({Key? key, required this.id, required this.yazarName,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(yazarName),),
    body: FutureBuilder(
        future:getAuthorsDetail(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data=snapshot.data;
            if(data!=null){
              return Text(data.translation!.text.toString());
            }else{
              return Center(child: Text('veri yok'),);
            }
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
    ),
    );

  }
  Future<Data>getAuthorsDetail()async{
    try {
      debugPrint('id: $id');
      var url = Uri.parse(
          'https://api.acikkuran.com/surah/6/verse/1?author=$id');
      var response = await http.get(
          url
      );
      if (response.statusCode == HttpStatus.ok) {
        return AuthorsDetailModel.fromJson(jsonDecode(response.body)).data!;

      } else {
        return throw Exception();
      }
    } catch(e){
      debugPrint('getAuthorsVerses hata: $e');
      return throw Exception();
    }
  }
}
 */

import 'dart:convert';

import 'package:a12_proje/constants/constant.dart';
import 'package:a12_proje/models/authors_model.dart';
import 'package:a12_proje/models/surah_model.dart';
import 'package:a12_proje/pages/authors_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Authors extends StatelessWidget {
  final int sura_id;
  
  final int ayet_id;
  
  List<AuthorsModel>authorsName=[];
   Authors({Key? key, required this.sura_id, required this.ayet_id,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Yazarlar'),),
  body: FutureBuilder(
  future:getAuthors(),
  builder: (context,snapshot){
    if(snapshot.hasData){
      var data=snapshot.data;
      if(data!.isNotEmpty){
        return ListView.builder(
          itemCount: data.length,
            itemBuilder: (context,index){
            var yazar=data[index];
            return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthorsDetail(id: yazar.id!, yazarName: yazar.name!, sura_id: sura_id, ayet_id: ayet_id,)));
                },
                child: ListTile(
                  tileColor: Colors.greenAccent,
                  title: Text(yazar.name!,style: Constant.getTextStyle3()),
                )
            );
            }
        );
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
  Future<List<AuthorsModel>>getAuthors()async{
  try{
    var url=Uri.parse('https://api.acikkuran.com/authors');
    var request=http.Request('GET',url);
    http.StreamedResponse response=await request.send();
    if(response.statusCode==200){
      var data=jsonDecode(await response.stream.bytesToString());
      debugPrint('gelen veri verses $data');
      for(var yazar in data['data']){
        var biryazar=AuthorsModel.fromJson(yazar);
        authorsName.add(biryazar);
      }
    }else{
      debugPrint('getAuthors() hata');
    }
    return authorsName;
  }catch(e){
    debugPrint('getAuthors hata: $e ');
    return [];
  }
  }
}




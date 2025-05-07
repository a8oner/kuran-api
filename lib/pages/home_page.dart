import 'dart:convert';

import 'package:a12_proje/constants/constant.dart';
import 'package:a12_proje/models/surah_model.dart';
import 'package:a12_proje/pages/surahs_verses.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;  //unutma

class HomePage extends StatelessWidget {

   HomePage({Key? key,}) : super(key: key);

   List<SurahsModel>sureler=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sureler'),),
      body: FutureBuilder<List<SurahsModel>>(
          future: getSurahs(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var data=snapshot.data;
              if(data!.isNotEmpty){
                return ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context,index){
                    var sure=data[index];
                    return GestureDetector(
                      onTap: (){


                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>SurahsVerses(surahName: sure.name!,id:sure.id!,)));


                      },
                        child: ListTile(tileColor: Colors.greenAccent,
                          title: Text(sure.name!,style: Constant.getTextStyle(),
                          ),
                    ));
                    }
                );
              }else{
                return Text('veri yok');
              }
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
  Future<List<SurahsModel>>getSurahs()async{
   try{
     var url=Uri.parse('https://api.acikkuran.com/surahs');
     var request = http.Request('GET',url);
     http.StreamedResponse response=await request.send();  //response isimlendirme
     if(response.statusCode==200){
       var data=jsonDecode(await response.stream.bytesToString());
    //   debugPrint('Gelen veri::: $data');
       for(var sure in data['data']){
         var birsure=SurahsModel.fromJson(sure);
         sureler.add(birsure);

       }
     }else{
       debugPrint('getSurahs() hata');
     }
     return sureler;
   }catch(e){
     debugPrint('getSurahs hata: $e');
     return [];
   }
  }
}

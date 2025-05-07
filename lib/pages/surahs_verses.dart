import 'dart:convert';

import 'package:a12_proje/constants/constant.dart';
import 'package:a12_proje/models/verses_model.dart';
import 'package:a12_proje/pages/authors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurahsVerses extends StatelessWidget {
  final String surahName;
  final int id; //sure id'si
  
 
  
  List<VersesModel>surahVerses=[];
   SurahsVerses({Key? key, required this.surahName, required this.id, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text(surahName),),
    body: FutureBuilder<List<VersesModel>>(
      future: getSurahsVerses(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var data=snapshot.data;
          if(data!.isNotEmpty){
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  var ayet=data[index];
                  return ListTile(tileColor: Colors.greenAccent,
                    title: Text(ayet.verse!,style: Constant.getTextStyle2(),),
                    subtitle: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>Authors(sura_id: id, ayet_id: ayet.verseNumber!,)
                        ));
                      },
                        child: Text(ayet.translation!.text!,style: Constant.getTextStyle3(),)
                    ),
                  );
                }
            );
          }else{
            return Center(child: Text('veri yok'),);
          }
        }else{
          return Center(child: CircularProgressIndicator(),); //Circul... veri gelene kadar döndür
        }
      },
    ),
    );

  }
  Future<List<VersesModel>>getSurahsVerses()async{
  //  debugPrint('id: $id');
   try{
     var url=Uri.parse('https://api.acikkuran.com/surah/$id'); //id yapılarak dinamikleşti id=1(fatiha)
     var request=http.Request('GET',url);
     http.StreamedResponse response=await request.send();
     if(response.statusCode==200){
       var data=jsonDecode(await response.stream.bytesToString());
       //   debugPrint('gelen veri verses $data');
       for(var ayet in data['data']['verses']){
         var birayet= VersesModel.fromJson(ayet);
         surahVerses.add(birayet);
     //    debugPrint('liste uzunluğu ${surahVerses.length}');
       }
     }else{
       debugPrint('getSurahVerses hata');
     }
     return surahVerses; //if'ten return yap hata vermesin. return yapmazsan bilgi gelmez
   }catch(e){
     debugPrint('getSurahVerses hata: $e}');
     return [];
   }

}
}

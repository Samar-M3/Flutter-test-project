import 'package:bannerr/core/static.dart';
import 'package:bannerr/model/news.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Apicall {
  //?q=apple
  // &sortBy=popularity

  static Future<news?>? getnewsdata() async{
    // uri
    try {
      var uri = Uri.https(
        StaticFile.baseurl,
        StaticFile.path,
        {
          'q': 'apple',
          'sortBy': 'popularity',
          'apikey': StaticFile.apikey,
        },
      );
      var response = await http.get(uri);
      if(response.statusCode.toString().contains("20")){
        var responsedata=convert.jsonDecode(response.body);
        var data=news.fromJson(responsedata);
        if(kDebugMode){
          print(data);
        }
        return data;
      }else{
        return null;
      }
    }catch(e){
      print(e);
      }
    }




    // http
    // response
    // parse
    // return


  }

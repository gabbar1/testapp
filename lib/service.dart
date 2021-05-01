import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'model/timeZoneModel.dart';
class APIService extends ChangeNotifier{


 Future<void> IndianTime({String url,timezone}) async{
   TimeZoneModel timeZoneModel ;
    var url = Uri.https('worldtimeapi.org', "/api/timezone/Asia/Kolkata", {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {

      timeZoneModel =  await TimeZoneModel.fromJson(convert.jsonDecode(response.body));
      return timeZoneModel.datetime;


    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  Future<void> USTime({String url,timezone}) async{
    TimeZoneModel timeZoneModel ;
    var url = Uri.https('worldtimeapi.org', "/api/timezone/America/New_York", {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {

      timeZoneModel =  await TimeZoneModel.fromJson(convert.jsonDecode(response.body));
      return timeZoneModel.datetime;


    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  Future<void> EuropeTime({String url,timezone}) async{
    TimeZoneModel timeZoneModel ;
    var url = Uri.https('worldtimeapi.org', '/api/timezone/Europe/Paris', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {

      timeZoneModel =  await TimeZoneModel.fromJson(convert.jsonDecode(response.body));
      print("TimeXOne0");
      print(timeZoneModel.timezone);
      return timeZoneModel.datetime;


    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }



}
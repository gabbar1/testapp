import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/timeZoneModel.dart';
import '../service.dart';

class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {


  MaterialColor color = Colors.amber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    }

  @override
  Widget build(BuildContext context) {

   var api= Provider.of<APIService>(context,listen: false);
    return Scaffold(
      backgroundColor:color ,
      appBar: AppBar(
        title: Text("TimeZone"),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [InkWell(onTap: (){
            setState(() {
            //  APIService().NetworkAPI();
              color = Colors.blue;
            });
          },child: Container(
            width: MediaQuery.of(context).size.width-100,
            height: 40,
            color: Colors.red,
            child: Center(child: StreamBuilder(stream:Stream.periodic(Duration(seconds: 1))
                .asyncMap((i) => api.IndianTime(timezone: '/api/timezone/Asia/Kolkata',url: 'worldtimeapi.org')),builder: (context,timeIndex){
              //    TimeZoneModel timeZone= TimeZoneModel.fromJson(timeIndex.data);
              if(timeIndex.hasData){
                return  Text(timeIndex.data);
              } else{
                return Text("Loading");
              }
            },),),
          )),InkWell(onTap: (){
            setState(() {
              color = Colors.grey;
            });
          },child: Container( width: MediaQuery.of(context).size.width-100,
            height: 40,
            color: Colors.white,child: Center(
            child: StreamBuilder(stream:Stream.periodic(Duration(seconds: 1))
                .asyncMap((i) => api.USTime(timezone: '/api/timezone/America/New_York',url: 'worldtimeapi.org')),builder: (context,timeIndex){
              //    TimeZoneModel timeZone= TimeZoneModel.fromJson(timeIndex.data);
              if(timeIndex.hasData){
                return  Text(timeIndex.data);
              } else{
                return Text("Loading");
              }
            },),
          ),)),InkWell(onTap: (){
            setState(() {

              color = Colors.purple;
            });
          },child: Container( width: MediaQuery.of(context).size.width-100,
        height: 40,
        color: Colors.green,child: Center(
            child: StreamBuilder(stream:Stream.periodic(Duration(seconds: 1))
                .asyncMap((i) => api.EuropeTime(timezone: '/api/timezone/Europe/Paris',url: 'worldtimeapi.org')),builder: (context,timeIndex){
              //    TimeZoneModel timeZone= TimeZoneModel.fromJson(timeIndex.data);
              if(timeIndex.hasData){
                return  Text(timeIndex.data);
              } else{
                return Text("Loading");
              }
            },),
          ),))],
        ),
      ),
    );
  }
}

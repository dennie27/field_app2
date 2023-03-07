import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
class BaseData extends StatefulWidget{
@override
State<BaseData> createState() => _BaseDataState();
}

class _BaseDataState extends State<BaseData> {
  void getData() async {

    String username = 'dennis+angaza@greenlightplanet.com';
    String password = 'sunking';
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var headers = {
      "Accept": "application/json",
      "method":"GET",
      "Authorization": '${basicAuth}',
      "account_qid" : "AC5156322",
    };
    final httpPackageUrl = Uri.https('payg.angazadesign.com', '/data/clients',{"account_qid" : "AC5156322"},
      );
    var uri = Uri.parse('https://payg.angazadesign.com/data/clients/CL7199608');
    var response = await http.get(uri, headers: headers);
    final httpPackageInfo = await http.read(httpPackageUrl,headers: headers);
    final info =  await http.read(httpPackageUrl,headers: headers);
    var data = json.decode(response.body);
    var dd = json.decode(response.body);
    print(data);
    //print(httpPackageUrl);
   // print(httpPackageInfo);
  }
  initState() {
    // at the beginning, all users are shown
    //data = items;
    print("object");
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
      title: Text("Dennis")
        ),
    body: Column(

    )
    );
  }
}
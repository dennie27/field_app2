import 'dart:convert';

import 'package:FieldApp/services/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;



getTotalUsers() {

}

class USerCallDetail{
  //to get number of calls
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  var user = FirebaseFirestore.instance.collection('Users');


  CollectionReference<Map<String, dynamic>> _calling =
  FirebaseFirestore.instance.collection('new_calling');
  //var uid = FirebaseFirestore.instance.collection("Users").where("UID",isEqualTo:currentUser);

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _calling.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.size;

    print("doc length $allData");
  }
   countDocuments(String value) async {

    QuerySnapshot querySnapshot = await _calling.where('Area', isEqualTo: value).get();
    int documentCount = await querySnapshot.docs.length;
    print("Number of documents in collection: $documentCount");
    return documentCount;
  }
  //get data by user area
  Future<int> CountDataByArea() async {
    // Get docs from collection reference
    var querySnapshot = await _calling.where('Area', isEqualTo: await UserDetail().getUserArea()).get();
    // Get data from docs and convert map to List
    int allData = querySnapshot.size;
    return allData;
  }
  Future<int> CountPending() async {
    // Get docs from collection reference
    var querySnapshot = await _calling.
    where('Area', isEqualTo: await UserDetail().getUserArea()).
    where('Status', isEqualTo: 'Pending').get();
    // Get data from docs and convert map to List
    int allData = querySnapshot.size;
    return allData;
  }
  Amount(String taskType)async{
    double total = 0.0;
    var querySnapshot = await _calling.
    where('Area', isEqualTo: await UserDetail().getUserArea()).
    where('Status', isEqualTo: 'Complete').
    where('Task Type',isEqualTo: taskType).get();
    // Get data from docs and convert map to List
    querySnapshot.docs.forEach((element) {
      var fieldValue = element.data()['Amount Collected'];
      total = total + fieldValue;
    });
    return total.toStringAsFixed(0);

  }
  AmountCollected(String value) async {
    int total = 0;
   var area = await UserDetail().getUserArea().then((areaValue){
    return areaValue;
   });
   var taskvalue = value;
   var dd = await _calling.
    where('Area', isEqualTo: area).
    where('Status', isEqualTo: 'Complete').
    where('Task Type',isEqualTo: value).get();
    dd.docs.forEach((element) {
      int fieldValue = element.data()['Amount Collected'];
      total = total + fieldValue;
    });
    // Get data from docs and convert map to List
    return total;
  }
  Future<int> CountComplete(String value) async {
    // Get docs from collection reference
    var querySnapshot = await _calling.
    where('Area', isEqualTo: await UserDetail().getUserArea()).
    where('Status', isEqualTo: 'Complete').
        where('Task Type',isEqualTo: value).get();
    // Get data from docs and convert map to List
    int allData = querySnapshot.size;
    return allData;
  }
  Future<int> CountSucceful(String value) async {
    // Get docs from collection reference
    var querySnapshot = await _calling.
    where('Area', isEqualTo: await UserDetail().getUserArea()).
    where('successfull', isEqualTo: 'Yes').
    where('Task Type',isEqualTo: value).get();
    // Get data from docs and convert map to List
    int allData = querySnapshot.size;
    return allData;
  }
  Future<String> CompleteRate(String value) async {

    int pending = await CountPending();
    int complete = await CountComplete(value);
    double rate  = (complete.toDouble()/(complete.toDouble()+pending.toDouble()))*100;
    return rate.toStringAsFixed(0)+"%";
  }
    Future getDataByArea() async {
    // Get docs from collection reference
    return await _calling.where('Area', isEqualTo: await UserDetail().getUserArea().snapshot());
    // Get data from docs and convert map to List
  }

}


GetAccountDetail() async{
  String username = 'dennis+angaza@greenlightplanet.com';
  String password = 'sunking';
  String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  var headers = {
    "Accept": "application/json",
    "method":"GET",
    "Authorization": '${basicAuth}',
    "account_qid" : "AC5156322",
  };
  var uri = Uri.parse('https://payg.angazadesign.com/data/accounts/AC7406321');
  var response = await http.get(uri, headers: headers);
  var data = json.decode(response.body);
  //print(data);
  return data["status"];
}

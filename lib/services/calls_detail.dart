import 'package:FieldApp/services/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



getTotalUsers() {

}

class USerCallDetail{
  //to get number of calls
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  var user = FirebaseFirestore.instance.collection('Users');

  CollectionReference<Map<String, dynamic>> _collectionRef =
  FirebaseFirestore.instance.collection('new_calling');
  CollectionReference<Map<String, dynamic>> _calling =
  FirebaseFirestore.instance.collection('new_calling');
  //var uid = FirebaseFirestore.instance.collection("Users").where("UID",isEqualTo:currentUser);

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _collectionRef.get();

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
    Future getDataByArea() async {
    // Get docs from collection reference
    return await _calling.where('Area', isEqualTo: await UserDetail().getUserArea().snapshot());
    // Get data from docs and convert map to List
  }

}

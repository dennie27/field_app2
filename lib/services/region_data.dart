

import 'package:FieldApp/services/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegionData{
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  var _region = FirebaseFirestore.instance.collection('TZ_region');
  Future<dynamic> getData() async {
   var query = await _region.where("Region", isEqualTo: UserDetail().getUserRegion()).get();
    var snapshot = query.docs[0];
    var data = snapshot.data();
    return data;

  }
}
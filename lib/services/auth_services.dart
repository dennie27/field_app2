

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
class GoogleAuth extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _guser;
  GoogleSignInAccount get user => _guser!;

  Future googleLogin() async {
    final googleUser  = await GoogleSignIn().signIn();
    if(googleUser == null) return;
    _guser = googleUser;
    final  googlerAuth = await googleUser.authentication;
    final credential  = GoogleAuthProvider.credential(
      accessToken: googlerAuth.accessToken,
      idToken: googlerAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

}
class AuthService{
  signInWithGoogle() async {
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await guser!.authentication;

    final credential  = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
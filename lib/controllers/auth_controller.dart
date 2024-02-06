import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<UserCredential?> userSignIn({email, pass}) async {
    UserCredential? user;

    try {
      user =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }

    return user;
  }

  Future<UserCredential?> userSignUp({email, pass}) async {
    UserCredential? user;

    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }

    return user;
  }

  storeUserData({email, pass, name}) async {
    database.collection('users').add({
      'name': name,
      'password': pass,
      'email': email,
      'uid': auth.currentUser!.uid
    });
  }
}

import 'package:cafegation/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? user;
  static final AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }
  AuthService._internal();

  //Extract needed information
  MyUser _userFromFirebaseUser(User? user){
    return user != null ? MyUser(uid: user.uid, email: user.email) : MyUser() ;
  }

  //Stream for FirbaseUser

  //Register With Email & Password
  Future<MyUser?> registerWithEmailAndPassword (String email, String pass) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass
      );
      user = _userFromFirebaseUser(userCredential.user);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Sign In With Email & Password
  Future<MyUser?> signInWithEmailAndPassword (String email, String pass) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass
      );
      user = _userFromFirebaseUser(userCredential.user);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  //Sign In Anonymously
  Future<MyUser?> signInAnon () async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      user = _userFromFirebaseUser(userCredential.user);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  //Sign Out
  Future signOut() async {
    try{
      await _auth.signOut();
      user = null;
    } on FirebaseAuthException catch (e) {
      print("Something went wrong in SignOut");
    }
  }
}
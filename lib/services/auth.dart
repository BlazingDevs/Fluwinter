import 'package:cafegation/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      MyUser user = _userFromFirebaseUser(userCredential.user);
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
      MyUser myUser = _userFromFirebaseUser(userCredential.user);
      return myUser;
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
  Future<bool> signInAnon () async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      MyUser user = _userFromFirebaseUser(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
    return true;
  }

  //Sign Out
  Future signOut() async {
    try{
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print("Something went wrong in SignOut");
    }
  }

  Stream<MyUser> get user {
    return _auth.authStateChanges()
      .map(_userFromFirebaseUser);
  }

}
import 'package:elavare/services/model/domain/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {

  FirebaseService();

  Future<bool> login(String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(cred.user?.uid);
      return (cred.user != null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print('Something else $e');
    }
    return false;
  }

  Future<User_?> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(cred.user!.uid);
      //Create user
      User_ user = User_(cred.user!.uid,cred.user!.email!,"","",[]);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print('Something else $e');
    }
    return null;
  }

  Future<bool> checkUserExists(String email) async {
    try {
      //tries to sign in with dummy password just ot check if user exists.
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: "password",
      );
      print(cred.user?.uid);
      return (cred.user != null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('[${e.code}] No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('[${e.code}]Wrong password provided for that user.');
        return true;
      }
      print('[${e.code}] ${e.message}');
    }
    return false;
  }


}

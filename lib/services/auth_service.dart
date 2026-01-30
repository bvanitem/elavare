import 'package:elavare/services/api_communicator.dart';
import 'package:elavare/services/model/net/request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class AuthService {
  AuthService();
  ApiCommunicator comm = ApiCommunicator();
  static final Logger _logger = Logger("authService");

  //Calls to api..
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

  Future<bool> register(
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
      print(cred.user?.uid);
      return (cred.user != null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print('Something else $e');
    }
    return false;
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

  //Call this method anywhere within the app to check the connection to the API
  Future<bool> health() async {
    _logger.info("testing api health");
    final response = await comm.getCallApi('health', null);
    return response.statusCode == 200;
  }
}

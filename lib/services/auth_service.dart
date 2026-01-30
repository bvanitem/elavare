import 'package:elavare/services/api_communicator.dart';
import 'package:elavare/services/firebase_service.dart';
import 'package:elavare/services/model/domain/user.dart';
import 'package:elavare/services/model/net/request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class AuthService {

  AuthService();
  FirebaseService firebaseService = FirebaseService();
  ApiCommunicator comm = ApiCommunicator();
  static final Logger _logger = Logger("authService");

  //Calls to api..
  Future<bool> login(String email, String password) async {
    return firebaseService.login(email, password);
  }

  Future<bool> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    User_? user = await firebaseService.register(email, password, firstName, lastName);
    if (user!=null){
      //Send user to API for registering in Firebase
      RegisterRequest request = RegisterRequest(user, 1); 
      comm.postCallApi('users/createUser', request.toJson(), "token");
    }
    return user!=null;
  }

  Future<bool> checkUserExists(String email) async {
   return firebaseService.checkUserExists(email);
  }

  //Call this method anywhere within the app to check the connection to the API
  Future<bool> health() async {
    _logger.info("testing api health");
    final response = await comm.getCallApi('health', null);
    return response.statusCode == 200;
  }
}

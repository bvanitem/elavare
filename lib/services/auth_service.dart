import 'package:elavare/services/api_communicator.dart';
import 'package:elavare/services/model/net/request.dart';
import 'package:logging/logging.dart';

class AuthService {
  AuthService();
  ApiCommunicator comm = ApiCommunicator();
  static final Logger _logger = Logger("authService");

  //Calls to api..
  Future<bool> login(String email, String password) async {
    
    LoginRequest loginRequest = LoginRequest(id:email);
    _logger.info("calling api communicator for loging user with email: $email");
    final response = await comm.postCallApi('users/login', loginRequest.toJson(), null);
    _logger.info("response ${response.toString()}");
    return (response.statusCode == 200);
  }
  
  Future<bool> health() async{
        _logger.info("testing api health");
    final response = await comm.getCallApi('health', null);

    return response.toString() != "";
  }

}

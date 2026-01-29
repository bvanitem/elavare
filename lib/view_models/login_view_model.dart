import 'package:elavare/services/auth_service.dart';
import 'package:logging/logging.dart';

class LoginViewModel {
  static final Logger _logger = Logger("LoginViewModel");
  const LoginViewModel();
  static final authService = AuthService();
  
  Future<bool> login(String username, String password) async {
    _logger.info("logging user $username with password: *****");
  
    bool result= await authService.login(username,password);
    if (!result){
      _logger.warning("couldn't log user $username");
      return false;
    }       
    _logger.info("User logged in $username");
    return true;

  }

  Future<bool> health() async {
    return await authService.health();
  }

}
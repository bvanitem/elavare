import 'package:elavare/services/auth_service.dart';

class LoginViewModel {

  const LoginViewModel();
  static final authService = AuthService();
  
  Future<bool> login(String username, String password) async {
    print("logging in with $username, $password");
  
    return await authService.login(username, password);;
  }
}
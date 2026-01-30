import 'package:elavare/services/auth_service.dart';
import 'package:logging/logging.dart';

class AuthViewModel {
  static final Logger _logger = Logger("AuthViewModel");
  const AuthViewModel();
  static final authService = AuthService();

  Future<bool> login(String email, String password) async {
    _logger.info("logging user $email with password: *****");
    bool result = await authService.login(email, password);
    if (!result) {
      print("couldn't log in user $email");
      return false;
    }
    print("User logged in $email");
    return true;
  }

  Future<bool> registerUser(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    bool result = await authService.register(
      email,
      password,
      firstName,
      lastName,
    );
    if (!result) {
      print("couldn't create user $email");
      return false;
    }
    print("User $email created");
    return true;
  }

  Future<bool> checkUserExists(String email) async {
    return await authService.checkUserExists(email);
  }

  Future<bool> health() async {
    return await authService.health();
  }
}

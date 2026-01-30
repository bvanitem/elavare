import 'package:elavare/services/model/domain/user.dart';

class Request {}

class LoginRequest implements Request {
  String id;
  // String password;
  LoginRequest({required this.id});

  Map<String, String> toJson() {
    return {"id": id};
  }
}

class RegisterRequest implements Request {

  User_ user;
  int token;
  RegisterRequest(this.user, this.token);

  Map<String, dynamic> toJson() {
    return {"user": user, "token":token};
  }
}

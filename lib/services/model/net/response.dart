class Response {}

class LoginResponse implements Response{
  String token;
  LoginResponse(this.token);
}

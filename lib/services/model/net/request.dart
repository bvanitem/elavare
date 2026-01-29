class Request{
}

class LoginRequest implements Request{
  String id;
  // String password;
  LoginRequest({ required this.id});

  Map<String,String> toJson(){
    return {"id":id};
  }
}


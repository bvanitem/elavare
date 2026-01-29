class User {
  
  String id;
  String email;
  String firstName;
  String lastName;
  List<String> responses;
  User(this.id, this.email, this.firstName, this.lastName, this.responses);

  factory User.fromDto(Map<String, dynamic> userDto) {
    return User(
      userDto['id'],
      userDto['email'],
      userDto['firstName'],
      userDto['lastName'],
      userDto['responses'],
    );
  }
}


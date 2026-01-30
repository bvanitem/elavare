class User_ {
  
  String id;
  String email;
  String firstName;
  String lastName;
  List<String> responses;
  User_(this.id, this.email, this.firstName, this.lastName, this.responses);

  factory User_.fromDto(Map<String, dynamic> userDto) {
    return User_(
      userDto['id'],
      userDto['email'],
      userDto['firstName'],
      userDto['lastName'],
      userDto['responses'],
    );
  }
}


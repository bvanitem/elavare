import './../data/dummy_data.dart';
import 'package:http/http.dart' as http;

class AuthService {
  AuthService();

  //Call to api..

  Future<bool> login(String email, String password) async {
    //Create login request
    //call login method
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    );
    print(response.body);
    return (response.body != "");
  }
}

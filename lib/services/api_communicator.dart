import 'dart:convert';
// import 'package:elavare/services/model/net/request.dart';
// import 'package:elavare/services/model/net/response.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class ApiCommunicator {
  final httpUrl = 'http://***'; //Insert your device's IP address
  final port = '3000'; //running port of the server
  static final Logger _logger = Logger("ApiCommunicator");

  ApiCommunicator();

  Future<http.Response> getCallApi(String path,String? token ) async {
    _logger.info("calling url $httpUrl with path $path");

    final uri = Uri.parse('$httpUrl:$port/$path');

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${ token ?? ""}",
      },
    );
    // print('${response.body}');
    return response;
  }

    Future<http.Response> postCallApi(String path, Map<String,String> request, String? token ) async {
    _logger.info("calling url $httpUrl with path $path");

    final uri = Uri.parse('$httpUrl:$port/$path');

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${ token ?? ""}",
      },
      body: jsonEncode(request),
    );
    if (response.statusCode != 200){
      // print("error calling api $path in");
    }
    // print('${response} ${response.statusCode}');
    return response;
  }
}

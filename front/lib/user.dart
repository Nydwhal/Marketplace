import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// Future main() async {
//   // To load the .env file contents into dotenv.
//   // NOTE: fileName defaults to .env and can be omitted in this case.
//   // Ensure that the filename corresponds to the path in step 1 and 2.
//   await dotenv.load(fileName: ".env");
//   //...runapp
// }

class User {
  String baseUrl = "http://192.168.56.1:8000/api/admin/user";
  // String baseUrl = "${dotenv.env['BASE_URL']}/admin/user";


  ///Get all users
  Future<List> getAllUsers() async{
    try {
      var url = Uri.parse(baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }else{
        return Future.error("Server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  ///Create new user
  Future<http.Response> postUser(name, email, password) async{
    try {
      var url = Uri.parse(baseUrl);
      return await http.post(url, body: jsonEncode(<String, String>{
        "name": name,
        "email": email,
        "password": password
      }));
    } catch (e) {
      return Future.error(e);
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesapp/src/constants/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider {
  Future<String> getToken(
      {required String username, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );

    try {
      if (res.statusCode == 200) {
        final String body = res.body;
        final bodyJson = json.decode(body);
        await prefs.setString('tokenPrefs', bodyJson['token']);
        // Navigator.pushReplacementNamed(context, Routes.home.name);
        globals.token = prefs.getString('tokenPrefs');
        return bodyJson['token'];
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Contraseña incorrecta. Inténtalo de nuevo.'),
        //     duration: Duration(seconds: 2),
        //   ),
        // );
        throw Exception('Error al ingresar la informacion');
      }
    } catch (e) {
      throw Exception('Error al ingresar la informacion');
    }
  }
}

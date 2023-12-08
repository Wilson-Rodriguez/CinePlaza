import 'package:flutter/material.dart';
import 'package:moviesapp/src/constants/my_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CinePlaza'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, colors: [
            Color(0xff1f005c),
            Color.fromARGB(255, 18, 0, 55),
          ]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const SizedBox(
              width: 120,
              height: 120,
              child: Image(image: AssetImage('lib/assets/white_half_moon.png')),
            ),
            const SizedBox(height: 20),
            const Text(
              "Tu lugar para encontrar tu pelicula favorita",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Usuario',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        final argum = {
                          'username': _usernameController.text,
                          'password': _passwordController.text
                        };
                        Navigator.pushReplacementNamed(
                            context, Routes.peticionT.name,
                            arguments: argum);
                      },
                      child: const Text('Iniciar sesión'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

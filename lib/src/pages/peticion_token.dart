import 'package:flutter/material.dart';
import 'package:moviesapp/src/widgets/movie_list.dart';
import 'package:moviesapp/src/constants/my_routes.dart';
import 'package:moviesapp/src/providers/token_provider.dart';
import 'package:moviesapp/src/constants/globals.dart' as globals;

class PeticionToken extends StatelessWidget {
  PeticionToken({super.key});

  final _provider = TokenProvider();

  @override
  Widget build(BuildContext context) {
    final info =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
      ),
      body: globals.token == null
          ? FutureBuilder(
              future: _provider.getToken(
                  username: info['username'].toString(),
                  password: info['password'].toString()),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.hasError) {
                  return ErrorWidget(message: snapshot.error.toString());
                }

                if (snapshot.hasData) {
                  return MovieList();
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : MovieList(),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, size: 150, color: Colors.red),
            const SizedBox(
              height: 20,
            ),
            Text(
              message,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, Routes.login.name),
                child: const Text("Regresar")),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:moviesapp/src/constants/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:moviesapp/src/models/actor_model.dart';

class ActorProvider {
  Future<List<Actor>> getActors(int movieid) async {
    final url =
        'https://api.themoviedb.org/3/movie/$movieid/credits?api_key=${globals.apiKey}';
    try {
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final String body = res.body;
        final bodyJson = json.decode(body);
        final actorsMap = bodyJson['cast'];

        final actors = List<Actor>.from(
          actorsMap.map((item) {
            final Actor newActor = Actor.fromJson(item);

            return newActor; // retornando el valor
          }), //? devuelve un Iterable, de Productos
        );

        return actors;
      } else {
        throw Exception("Error al realizar la peticion");
      }
    } catch (e) {
      // throw Exception('Error al obtener los productos');
      throw Exception('Error al obtener los actores: $e');
    }
  }
}

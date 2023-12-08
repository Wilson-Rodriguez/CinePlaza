import 'dart:convert';

import 'package:moviesapp/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieListProvider {
  final apiKey = "fb95c42bf1cdbfaf8fbe2e0c0b0c6ca1";

  Future<List<Movie>> getMovies() async {
    final url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
    try {
      final res = await http.get(
        Uri.parse(url),
      );

      if (res.statusCode == 200) {
        final body = res.body;
        final jsonBody = json.decode(body);
        final movieMap = jsonBody['results'];

        final movies = List<Movie>.from(
          movieMap.map((actual) {
            final Movie newMovie = Movie.fromJson(actual);

            return newMovie;
          }),
        );

        return movies;
      } else {
        throw Exception('Error al obtener los productos');
      }
    } catch (e) {
      throw Exception('Error al obtener los productos');
    }
  }
}

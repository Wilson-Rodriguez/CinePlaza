import 'package:flutter/material.dart';
import 'package:moviesapp/src/providers/movie_list_provider.dart';
import 'package:moviesapp/src/models/movie_model.dart';
import 'package:moviesapp/src/constants/my_routes.dart';

class MovieList extends StatelessWidget {
  MovieList({super.key});
  final MovieListProvider _provider = MovieListProvider();

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topRight, colors: [
          Color(0xff1f005c),
          Color.fromARGB(255, 18, 0, 55),
        ]),
      ),
      child: FutureBuilder(
          future: _provider.getMovies(),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasError) {
              return ErrorWidget(message: snapshot.error.toString());
            }

            if (snapshot.hasData) {
              final movies = snapshot.data!;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final Movie movie = movies[index];
                  return Container(
                    height: 100,
                    child: ListTile(
                      leading: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                      ),
                      title: Text(movie.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      subtitle: Text(
                        'Clasificación: ${movie.adult ? 'Adulto' : 'Familiar'}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.detail.name,
                            arguments: movie.toJson());
                      },
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
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
    return Center(
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
    );
  }
}

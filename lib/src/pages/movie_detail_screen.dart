import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/actor_model.dart';
import 'package:moviesapp/src/providers/actor_provider.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key});
  final ActorProvider _provider = ActorProvider();

  // Future<void> _fetchMovieDetails() async {
  @override
  Widget build(BuildContext context) {
    final info =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(info['title']),
        // backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, colors: [
            Color(0xff1f005c),
            Color.fromARGB(255, 18, 0, 55),
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Image.network(
                      'https://image.tmdb.org/t/p/w500/${info['poster_path']}',
                      width: 200,
                      height: 300,
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Calificación: ${info['vote_average']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(16.0),
                        //   child: Text(
                        //     'Géneros: ${_movieDetails!['genres'].map((genre) => genre['name']).join(', ')}',
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Clasificación: ${info['adult'] ? 'Adulto' : 'Familiar'}',
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            info['overview'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Actores:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: FutureBuilder(
                  future: _provider.getActors(info["id"]),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Actor>?> snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                          "Elemento no encontrado:  ${snapshot.error.toString()}");
                    }

                    if (snapshot.hasData) {
                      final actors = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: actors.length,
                        itemBuilder: (BuildContext context, int index) {
                          final actor = actors[index];
                          return Container(
                            width: 160,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: actor.profilePath != null
                                      ? NetworkImage(
                                          'https://image.tmdb.org/t/p/w200/${actor.profilePath}',
                                        )
                                      : null,
                                  child: actor.profilePath == null
                                      ? const Icon(
                                          Icons.person,
                                          size: 50,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  actor.name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  actor.character,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),

              /************************************************** */

              // if (_cast.isNotEmpty)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Padding(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text(
              //           'Actores:',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16,
              //           ),
              //         ),
              //       ),
              //     SingleChildScrollView(
              //       scrollDirection: Axis.horizontal,
              //       child: Row(
              //         children: _cast.map<Widget>((actor) {
              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Column(
              //               children: [
              //                 CircleAvatar(
              //                   radius: 40,
              //                   backgroundColor: Colors.grey,
              //                   backgroundImage: actor['profile_path'] != null
              //                       ? NetworkImage(
              //                           'https://image.tmdb.org/t/p/w200/${actor['profile_path']}',
              //                         )
              //                       : null,
              //                   child: actor['profile_path'] == null
              //                       ? const Icon(
              //                           Icons.person,
              //                           size: 50,
              //                           color: Colors.white,
              //                         )
              //                       : null,
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Text(
              //                   actor['name'],
              //                   textAlign: TextAlign.center,
              //                   maxLines: 2,
              //                 ),
              //                 Text(
              //                   '${actor['character']}',
              //                   textAlign: TextAlign.center,
              //                   style: const TextStyle(
              //                       fontSize: 12, color: Colors.grey),
              //                 ),
              //               ],
              //             ),
              //           );
              //         }).toList(),
              //       ),
              //     ),
              //   ],
              // ),
              /************************************************ */

              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  // style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('Volver'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

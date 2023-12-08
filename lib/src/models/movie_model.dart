class Movie {
  final String title;
  final int id;
  final bool adult;
  final String posterPath;
  final voteAverage;
  final String overview;

  Movie(
      {required this.title,
      required this.id,
      required this.adult,
      required this.posterPath,
      required this.voteAverage,
      required this.overview});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        id: json["id"],
        adult: json["adult"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"],
        overview: json["overview"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "adult": adult,
      "poster_path": posterPath,
      "vote_average": voteAverage,
      "overview": overview
    };
  }
}

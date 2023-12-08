class Actor {
  final String? profilePath;
  final String name;
  final String character;

  Actor({
    required this.profilePath,
    required this.name,
    required this.character,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      profilePath: json["profile_path"],
      name: json["name"],
      character: json["character"],
    );
  }
}

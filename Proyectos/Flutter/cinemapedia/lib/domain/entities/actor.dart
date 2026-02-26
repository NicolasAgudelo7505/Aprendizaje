class Actor {

  final int id;
  final String name;
  final String profilePath;
  final String? character;
  final String? gender;
  final String originalName;
  final String job;

  Actor({required this.id, required this.name, required this.profilePath, required this.character, this.gender, required this.originalName, required this.job});

}
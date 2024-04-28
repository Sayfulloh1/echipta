

class Team {
  final int id;
  final String name;
  final String image;

  Team({required this.id, required this.name, required this.image});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json['id'],
    name: json['name'],
    image: json['image'],
  );
}
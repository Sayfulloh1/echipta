class MatchCategory {
  final int id;
  final String title;
  final String image;

  MatchCategory({required this.id, required this.title, required this.image});

  factory MatchCategory.fromJson(Map<String, dynamic> json) => MatchCategory(
    id: json['id'] as int,
    title: json['title'] as String,
    image: json['image'] as String,
  );
}

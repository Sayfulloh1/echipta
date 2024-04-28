class SectorInfo {
  final String title;
  final String type;
  final String price;
  final int freeSeatsCount;

  SectorInfo({
    required this.title,
    required this.type,
    required this.price,
    required this.freeSeatsCount,
  });

  factory SectorInfo.fromJson(Map<String, dynamic> json) => SectorInfo(
    title: json['title'] as String,
    type: json['type'] as String,
    price: json['price'] as String,
    freeSeatsCount: json['free_seats_count'] as int,
  );
}

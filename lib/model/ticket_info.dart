class TicketInfo {
  final String sector;
  final String row;
  final String seat;
  final String type;
  final String price;
  final String panorama;

  TicketInfo({
    required this.sector,
    required this.row,
    required this.seat,
    required this.type,
    required this.price,
    required this.panorama,
  });

  factory TicketInfo.fromJson(Map<String, dynamic> json) => TicketInfo(
    sector: json['sector'] as String,
    row: json['row'] as String,
    seat: json['seat'] as String,
    type: json['type'] as String,
    price: json['price'] as String,
    panorama: json['panorama'] as String,
  );
}

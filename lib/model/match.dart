class Match {
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String stadium;

  const Match({
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.stadium,
  });
  factory Match.fromJson(Map<String, dynamic> json) => Match(
    team1: json['team']['home']['name'],
    team2: json['team']['away']['name'],
    date: json['date'],
    time: json['time'],
    stadium: 'To be confirmed', // Replace with stadium data from API if available
  );
}

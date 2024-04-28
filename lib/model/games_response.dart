import 'package:e_chipta/model/team.dart';

class   GamesResponse {
  final CurrentMatch? currentMatch;
  final List<CategoryMatch>? categoryMatches;

  GamesResponse({this.currentMatch, required this.categoryMatches});

  factory GamesResponse.fromJson(Map<String, dynamic> json) => GamesResponse(
    currentMatch: json['currentMatch'] != null ? CurrentMatch.fromJson(json['currentMatch']) : null,
    categoryMatches: (json['categoryMatches'] as List)
        .map((categoryMatch) => CategoryMatch.fromJson(categoryMatch))
        .toList(),
  );
}

class CurrentMatch {
  final int id;
  final String title;
  final String startDate;
  final Team mainTeam;
  final Team secondTeam;

  CurrentMatch({
    required this.id,
    required this.title,
    required this.startDate,
    required this.mainTeam,
    required this.secondTeam,
  });

  factory CurrentMatch.fromJson(Map<String, dynamic> json) => CurrentMatch(
    id: json['id'] as int,
    title: json['title'] as String,
    startDate: json['start_date'] as String,
    mainTeam: Team.fromJson(json['main_team']),
    secondTeam: Team.fromJson(json['second_team']),
  );
}
class CategoryMatch {
  final int id;
  final String title;
  final String image;
  final List<Match>? matches;

  CategoryMatch({required this.id, required this.title, required this.image, this.matches});

  factory CategoryMatch.fromJson(Map<String, dynamic> json) => CategoryMatch(
    id: json['id'] as int,
    title: json['title'] as String,
    image: json['image'] as String,
    matches: json['matches'] == null
        ? null
        : (json['matches'] as List).map((match) => Match.fromJson(match)).toList(),
  );
}

class Match {
  final int id;
  final String title;
  final String startDate;
  final Team mainTeam;
  final Team secondTeam;

  Match({
    required this.id,
    required this.title,
    required this.startDate,
    required this.mainTeam,
    required this.secondTeam,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: json['id'] as int,
    title: json['title'] as String,
    startDate: json['start_date'] as String,
    mainTeam: Team.fromJson(json['main_team']),
    secondTeam: Team.fromJson(json['second_team']),
  );
}



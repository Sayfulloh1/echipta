// match_data.dart
import 'package:flutter/material.dart';
import 'package:e_chipta/model/match.dart';

class MatchData extends ChangeNotifier {
  final List<Match> _matches = [
    const Match(
      team1: 'Neftchi',
      team2: 'Nasaf',
      date: '30-Mar-2024',
      time: '17:00',
      stadium: 'Bobur Arena',
    ),
    // Add more matches here
  ];

  List<Match> get matches => _matches.toList();

  void addMatch(Match match) {
    _matches.add(match);
    notifyListeners();
  }
}

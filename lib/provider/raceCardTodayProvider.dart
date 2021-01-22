import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mks_racing/model/raceCardToday.dart';

import 'package:http/http.dart' as http;

import '../apiURL.dart';

class RaceCardTodayProvider with ChangeNotifier {
  final String token;

  RaceCardTodayProvider(this.token);

  RaceCardToday raceCardToday;

  getTodayRaceCard() async {
    try {
      final response =
          await http.get(todayRaceCardURL, headers: {'ismobile': 'true'});
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        raceCardToday = RaceCardToday.fromJson(data);
        notifyListeners();
      } else {
        return;
      }
    } catch (e) {
      throw e;
    }
  }
}

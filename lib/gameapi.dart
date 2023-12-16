import 'dart:convert';
import 'package:gamepiul/model.dart';
import 'package:http/http.dart' as http;

class GameReq {
  final _baseurl = "https://www.freetogame.com/api/games";

  Future<List<GameApi>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<GameApi> games = it.map((e) => GameApi.fromJson(e)).toList();
        return games;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
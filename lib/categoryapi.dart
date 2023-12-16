import 'dart:convert';
import 'package:gamepiul/model.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  Future<List<GameApi>> fetchGamesByCategory(String category) async {
    final response = await http.get(Uri.parse('https://www.freetogame.com/api/games?category=$category'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<GameApi> games = jsonData.map((game) => GameApi.fromJson(game)).toList();
      return games;
    } else {
      throw Exception('Failed to fetch games: ${response.statusCode}');
    }
  }
}

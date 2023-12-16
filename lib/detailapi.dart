import 'dart:convert';
import 'package:gamepiul/model.dart';
import 'package:http/http.dart' as http;

class DetailReq {
  Future<GameApi> fetchDetail(int idGame) async {
    final response = await http.get(Uri.parse('https://www.freetogame.com/api/game?id=$idGame'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return GameApi.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch game details: ${response.statusCode}');
    }
  }
}

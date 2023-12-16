class GameApi {
  final int id;
  final String title;
  final String thumbnail;
  final String genre;
  final String description;
  final String release_date;
    final String game_url;


  const GameApi({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.genre,
    required this.description,
    required this.release_date,
        required this.game_url,

  });

  factory GameApi.fromJson(Map<String, dynamic> json) {
    return GameApi(
      id: json['id'] ?? 0, 
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      genre: json['genre'] ?? '',
      description: json['description'] ?? '',
      release_date: json['release_date'] ?? '',
            game_url: json['game_url'] ?? '',

    );
  }
}

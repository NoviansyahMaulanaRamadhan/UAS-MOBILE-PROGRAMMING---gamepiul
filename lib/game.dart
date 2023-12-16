class Game {
  final String title;
  final String description;
  final String imagePath;
  final double rating;
  final String detail;

  Game({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.detail,
  });
}

class GameData {
  static List<Game> games = [
    Game(
      title: 'Mobile Legends',
      description: 'Moonton',
      imagePath: 'assets/images/ml.jpg',
      rating: 3.5,
      detail: "Mobile Legends: Bang Bang adalah game online bergenre Multiplayer Online Battle Arena (MOBA) populer yang dikembangkan dan diterbitkan oleh Moonton. Game ini dirancang khusus untuk perangkat seluler seperti ponsel cerdas dan tablet. Mobile Legends menawarkan pertarungan tim 5 vs 5 di arena virtual. Setiap pemain memilih karakter pahlawan unik dengan kemampuan khusus untuk melawan tim lawan. Tujuan utama dari permainan ini adalah untuk menghancurkan Crystal atau Nexus lawan, yang merupakan struktur pusat dari markas musuh."
    ),
    Game(
      title: 'PUBG',
      description: 'Level Infinite',
      imagePath: 'assets/images/pubg.png',
      rating: 3.8,
      detail: "PUBG: Battlegrounds (sebelumnya dikenal sebagai PlayerUnknown's Battlegrounds) adalah sebuah permainan battle royale, di mana 100 orang sekaligus dapat bermain secara daring. Pemenang dari permainan ini adalah individu atau tim yang dapat bertahan hingga akhir. Pemain bisa bermain sendirian (solo), tim dengan dua orang (duo), dan tim dengan empat orang (squad). Pemain bisa mengundang teman di daftar teman (friend list) untuk bergabung ke dalam permainan sebagai sebuah tim."
    ),
    Game(
      title: 'Free Fire',
      description: 'Garena',
      imagePath: 'assets/images/ff.jpg',
      rating: 4.1,
      detail: "Garena Free Fire atau biasa disebut Free Fire adalah permainan battle royale yang dikembangkan oleh 111 Dots Studio dan diterbitkan oleh Garena untuk Android dan iOS. Permainan ini merupakan permainan tembak-tembakan secara online."
    ),
    Game(
      title: 'Free Fire',
      description: 'Garena',
      imagePath: 'assets/images/ff.jpg',
      rating: 4.1,
      detail: "Garena Free Fire atau biasa disebut Free Fire adalah permainan battle royale yang dikembangkan oleh 111 Dots Studio dan diterbitkan oleh Garena untuk Android dan iOS. Permainan ini merupakan permainan piranti genggam yan"
    ),
  ];
}

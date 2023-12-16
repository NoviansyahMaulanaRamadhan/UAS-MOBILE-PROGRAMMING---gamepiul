import 'package:flutter/material.dart';
import 'package:gamepiul/categorypage.dart';
import 'package:gamepiul/gameapi.dart';
import 'package:gamepiul/detail.dart';
import 'package:gamepiul/model.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryList(),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool isActionSelected = true;
  late List<GameApi> games = [];
  late List<GameApi> filteredGames = [];

  @override
  void initState() {
    super.initState();
    _fetchGameData();
  }

  void _fetchGameData() async {
    try {
      List<GameApi> data = await GameReq().getData();
      setState(() {
        games = data;
        filteredGames = data;
      });
    } catch (error) {
      print('Error fetching data from API: $error');
    }
  }

  void _filterGames(String keyword) {
    setState(() {
      filteredGames = games
          .where((game) =>
              game.title.toLowerCase().contains(keyword.toLowerCase()) ||
              game.genre.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: _filterGames,
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/pian.jpg'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                _buildCategoryCard("Shooter"),
                _buildCategoryCard("MMORPG"),
                _buildCategoryCard("Strategy"),
                _buildCategoryCard("Sports"),
                _buildCategoryCard("Racing"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredGames.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(apiGame: filteredGames[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.network(filteredGames[index].thumbnail),
                      title: Text(filteredGames[index].title),
                      subtitle: Text(filteredGames[index].genre, style: TextStyle(color: Colors.grey)),
                      trailing: Text('🗓️${filteredGames[index].release_date}', style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String category) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(category: category),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

}

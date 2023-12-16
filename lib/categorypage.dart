import 'package:flutter/material.dart';
import 'package:gamepiul/categoryapi.dart';
import 'package:gamepiul/detail.dart';
import 'package:gamepiul/model.dart';

class CategoryPage extends StatefulWidget {
  final String category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<GameApi> games = [];
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchGamesByCategory();
  }

  Future<void> _fetchGamesByCategory() async {
    try {
      List<GameApi> data =
          await CategoryApi().fetchGamesByCategory(widget.category);
      setState(() {
        games = data;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching data from API: $error');
      setState(() {
        isLoading = false;
      });
    }
  }
  
  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          _buildGameList(),
          if (isLoading) _buildLoadingIndicator(),
        ],
      ),
    );
  }

  Widget _buildGameList() {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        GameApi apiGame = games[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(apiGame: apiGame),
              ),
            );
          },
          child: Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
              
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      image: DecorationImage(
                        image: NetworkImage(apiGame.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            apiGame.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        apiGame.release_date,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

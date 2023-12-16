import 'package:flutter/material.dart';
import 'package:gamepiul/detailapi.dart';
import 'package:gamepiul/model.dart';


class DetailPage extends StatelessWidget {
  final GameApi apiGame;
  final DetailReq detailReq = DetailReq(); 

  DetailPage({Key? key, required this.apiGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detailReq.fetchDetail(apiGame.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); 
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          GameApi details = snapshot.data as GameApi;

          return Scaffold(
            appBar: AppBar(
              title: Text("Detail Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              backgroundColor: Colors.blue,
                iconTheme: IconThemeData(color: Colors.white), 

            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(details.thumbnail),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        details.title,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${details.genre}',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Release Date: ${details.release_date}',
                        style: TextStyle(fontSize: 14, color: Colors.lightBlueAccent),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${details.description}',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

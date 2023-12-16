import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/pian.jpg'),
          ),
          SizedBox(height: 16),
          Text(
            'Noviansyah Maulana Ramadhan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'piand041102@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 25),
          Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('210605110022'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Bekasi, Indonesia'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('+62 895 0204 1131'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Joined on November 4, 2022'),
            ),
          ),
        ],
      ),
    );
  }
}

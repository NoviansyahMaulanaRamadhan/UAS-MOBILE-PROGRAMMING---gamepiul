import 'package:flutter/material.dart';
import 'package:gamepiul/main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  "Game Mobile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/gm.png',
                ),
                const SizedBox(
                  child: Text("piul"),
                ),
                const Text(
                  "Isinya Tempat Orang Main Game",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8.0,
                        ),
                        primary: Colors.blue, 
                        onPrimary: Colors.white, 
                      ),
                      child:
                          const Text("Gass!!", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

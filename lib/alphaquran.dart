import 'package:flutter/material.dart';

class AlphaQuran extends StatefulWidget {
  const AlphaQuran({super.key});

  @override
  State<AlphaQuran> createState() => _AlphaQuranState();
}

class _AlphaQuranState extends State<AlphaQuran> {
  Color background = Color(0xFF003F38);
  Color fontGold = Color(0xFFFFDE93);
  Color white = Color(0xFFFFFFFF);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: background,
        child: Column(
          children: <Widget>[
            Padding(padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
            Container(
              width: double.infinity,
              height: 250,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/header.png"),
                  fit: BoxFit
                      .cover, // This ensures the image covers the screen
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Alphabetical Quran",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

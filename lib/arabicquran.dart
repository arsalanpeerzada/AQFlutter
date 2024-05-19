import 'dart:collection';

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


  // Sample data for the list
  Map<String, String> chapters = {
    "1": "The Opening",
    "2": "The Cow",
    "3": "The Family of Imran",
    // Add more chapters or verses as needed
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: white,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
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
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 30,
                        color: white),
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(// Use Expanded to fill the remaining space
                child: ListView(
                  children: chapters.entries.map((entry) {
                    return _buildCustomListItem({entry.key: entry.value});
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomListItem(Map<String, String> chapter) {
    // Assuming the map has only one entry: {'chapterName': 'description'}
    String chapterName = chapter.keys.first;
    String description = chapter.values.first;

    return Container(
      color: white,
      padding: EdgeInsets.all(8), // Added padding for better UI
      child: Row(
        children: [
          SizedBox(width: 10),
          Text(chapterName, style: TextStyle(color: Colors.black, fontSize: 18)),
          SizedBox(width: 10),
          Expanded(
            child: Text(description, style: TextStyle(color: Colors.grey, fontSize: 14)), // Optional: display description
          ),
          Icon(Icons.book, color: fontGold, size: 30),
        ],
      ),
    );
  }
}

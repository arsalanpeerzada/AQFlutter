import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'englishquranverse.dart';

class EnglishQuran extends StatefulWidget {
  const EnglishQuran({super.key});

  @override
  State<EnglishQuran> createState() => _AlphaQuranState();
}

class _AlphaQuranState extends State<EnglishQuran> {
  Color background = Color(0xFF003F38);
  Color fontGold = Color(0xFFFFDE93);
  Color white = Color(0xFFFFFFFF);


  // Sample data for the list
  // Map<String, String> chapters = {
  //   "1": "The Opening",
  //   "2": "The Cow",
  //   "3": "The Family of Imran",
  //   // Add more chapters or verses as needed
  // };
  List chapters = [];

  @override
  void initState() {
    super.initState();
    fetchChapters();
  }


  Future<void> fetchChapters() async {
    final response = await http.get(Uri.parse('https://api.quran.com/api/v4/chapters'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        chapters = data['chapters'];
      });
    } else {
      throw Exception('Failed to load chapters');
    }
  }


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
                child: chapters.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                  itemCount: chapters.length,
                  itemBuilder: (context, index) {
                    final chapter = chapters[index];
                    return _buildCustomListItem(chapter);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomListItem(chapter) {
    // Assuming the map has only one entry: {'chapterName': 'description'}
    dynamic chapterss = chapter[7];
    int chapteriid = chapter['id'];
    String chapterId = chapter['id'].toString();
    String ChapterName = chapter['name_simple'];
    String ArabicName = chapter['name_arabic'];
    String desc = chapter['translated_name']['name'];

    return InkWell(
      onTap: () {
        // Navigate to the next page and pass the chapterId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EnglishQuranVerses(chapterId: chapteriid),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            color: white,
            padding: EdgeInsets.all(8), // Added padding for better UI
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(chapterId, style: TextStyle(color: Colors.black, fontSize: 16)),
                SizedBox(width: 10),
                Expanded(
                  child: Text(ChapterName, style: TextStyle(color: Colors.black, fontSize: 16)), // Optional: display description
                ),
                Text(ArabicName, style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: 35),
              Text(desc, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: SizedBox(
              height: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

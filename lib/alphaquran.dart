import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:alphabeticalquran/QuranSearchPage.dart';
import 'package:alphabeticalquran/aboutQuran.dart';
import 'package:alphabeticalquran/aboutUs.dart';
import 'package:alphabeticalquran/alphaquranverse.dart';
import 'package:alphabeticalquran/privacyPolicy.dart';
import 'package:flutter/material.dart';

enum Options { privacyPolicy, aboutUs, aboutQuran }

class AlphaQuran extends StatefulWidget {
  const AlphaQuran({super.key});

  @override
  State<AlphaQuran> createState() => _AlphaQuranState();
}

class _AlphaQuranState extends State<AlphaQuran> {
  Color background = Color(0xFF003F38);
  Color fontGold = Color(0xFFFFDE93);
  Color white = Color(0xFFFFFFFF);

  List<dynamic> topicsList = [];

  @override
  void initState() {
    super.initState();
    readFileAndProcess();
  }

  Future<void> readFileAndProcess() async {
    try {
      final String response = await rootBundle.loadString('assets/topics_data.json');
      final data = await json.decode(response);
      setState(() {
        topicsList = data;
      });
    } catch (e) {
      print('Error reading file: $e');
    }
  }

  var _popupMenuItemIndex = 0;
  Color _changeColorAccordingToMenuItem = Colors.red;
  var appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: white,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/header.png"),
                      fit: BoxFit.cover, // This ensures the image covers the screen
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
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.3), // Full-width black background
                  padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                  // Add padding around the IconButton
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Align back button to left and menu to right
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.search_sharp, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuranSearchPage(),
                                ),
                              );
                            },
                          ),
                          PopupMenuButton(
                            icon: Icon(Icons.more_vert, color: Colors.white),
                            onSelected: (value) {
                              _onMenuItemSelected(value as int);
                            },
                            offset: Offset(0.0, appBarHeight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            itemBuilder: (ctx) => [
                              _buildPopupMenuItem(
                                  'Privacy Policy', Options.privacyPolicy.index),
                              _buildPopupMenuItem(
                                  'About Us', Options.aboutUs.index),
                              _buildPopupMenuItem(
                                  'About Quran', Options.aboutQuran.index),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded( // Use Expanded to fill the remaining space
              child: ListView.builder(
                itemCount: topicsList.length,
                itemBuilder: (context, index) {
                  return _buildCustomListItem(topicsList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position) {
    return PopupMenuItem(
      value: position,
      child: Text(title),
    );
  }

  // Function to handle the menu item selection
  void _onMenuItemSelected(int value) {
    switch (value) {
      case 0:
        // Handle Search action
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const privacyPolicy()),
        );
        break;
      case 1:
        // Handle Upload action
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => aboutUs()),
        );
        break;
      case 2:
        // Handle Copy action
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => aboutQuran()),
        );
        break;
    }
  }

  Widget _buildCustomListItem(dynamic topicData) {
    String chapterId = topicData['topicId'];
    String topicName = topicData['topicName'];
    List<dynamic> rawVerses = topicData['verses'];
    
    // Map raw verses to ModelPage list
    List<ModelPage> versesList = rawVerses.map((v) => ModelPage(
      verseID: v['id'],
      verse: v['text']
    )).toList();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlphaQuranVerse(
              chapterId: chapterId,
              chapterName: topicName,
              verses: versesList,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            color: white,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Text(topicName, style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'elmessiri')),
                ),
                Image.asset('images/book.png', width: 30, height: 30),
              ],
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

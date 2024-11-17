import 'dart:collection';
import 'dart:convert';

import 'package:alphabeticalquran/QuranSearchPage.dart';
import 'package:alphabeticalquran/aboutQuran.dart';
import 'package:alphabeticalquran/aboutUs.dart';
import 'package:alphabeticalquran/alphaquran.dart';
import 'package:alphabeticalquran/privacyPolicy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'QuranSearchPageE.dart';
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
  var appBarHeight = AppBar().preferredSize.height;
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
                                  builder: (context) => QuranSearchPageE(),
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
            Expanded(// Use Expanded to fill the remaining space
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
            builder: (context) => EnglishQuranVerses(chapterId: chapteriid,chapterName:ChapterName),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: white,
            padding: EdgeInsets.fromLTRB(10,0,30,0), // Added padding for better UI
            child: Row(
              children: [
                SizedBox(width: 5),
                SizedBox(
                    width: 30,
                    child: Text(chapterId, style: TextStyle(color: Colors.black, fontSize: 16))),
                SizedBox(width: 10),
                Expanded(
                  child: Text(ChapterName, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'elmessiri')), // Optional: display description
                ),
                Text(ArabicName, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'jnr')),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 55),
              Text(desc, style: TextStyle(color: Colors.grey, fontSize: 12,fontFamily: 'elmessiri')),
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

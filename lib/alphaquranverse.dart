import 'package:flutter/material.dart';

import 'Utils/FileReaderClass.dart';

class AlphaQuranVerse extends StatefulWidget {
  final String chapterId;
  final String chapterName;
  final String chapterLines;

  const AlphaQuranVerse({super.key, required this.chapterId, required this.chapterName, required this.chapterLines});

  @override
  State<AlphaQuranVerse> createState() => _AlphaQuranVerseState();
}

class _AlphaQuranVerseState extends State<AlphaQuranVerse> {
  Color background = Color(0xFF003F38);
  Color fontGold = Color(0xFFFFDE93);
  Color white = Color(0xFFFFFFFF);


  late Map<String, String> chapters;
  late FileReaderClass fileReaderClass;
  List<ModelPage> modelPageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chapters = {};
    fileReaderClass = FileReaderClass();

    String topicName = widget.chapterName;
    int  lines = int.parse(widget.chapterLines);
    extractVerses(topicName, lines);
  }

  Future<List<ModelPage>> extractVerses(String topicName, int lines) async {
    List<ModelPage> modelPageList = [];
    List<String> data = await fileReaderClass.readFile('topics.txt');
    for (int i = 0; i < data.length; i++) {
      String formattedTopicName = topicName.replaceAll('_', ' ');
      if (data[i] == formattedTopicName) {
        for (int k = 1; k <= lines; k++) {
          ModelPage modelPage = ModelPage(verse: "", verseID: "");
          try {
            String verseData = data[i + k];
            if (verseData.isNotEmpty) {
              List<String> Titles = verseData.split(RegExp(r'[\[\]]'));
              if (Titles.length > 1) {
                modelPage.verse = Titles[2];
                modelPage.verseID = Titles[1];
              }
            }
          } catch (e) {
            print("Error occurred: $e");
          }
          modelPageList.add(modelPage);
        }
        // Stop iteration after finding verses for the given topic
        break;
      }
    }

    return modelPageList;
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

    return Column(
      children: [
        Container(
          color: white,
          padding: EdgeInsets.all(8), // Added padding for better UI
          child: Row(
            children: [
              SizedBox(width: 10),
              Text(chapterName, style: TextStyle(color: Colors.black, fontSize: 16)),
              SizedBox(width: 10),
              Expanded(
                child: Text(description, style: TextStyle(color: Colors.black, fontSize: 14)), // Optional: display description
              ),
              Icon(Icons.book, color: fontGold, size: 30),
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
    );
  }
}

class ModelPage {
  String verse;
  String verseID;

  ModelPage({required this.verse, required this.verseID});
}

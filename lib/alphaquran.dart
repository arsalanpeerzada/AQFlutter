import 'package:alphabeticalquran/alphaquranverse.dart';
import 'package:flutter/material.dart';

import 'Utils/FileReaderClass.dart';

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
  // Map<String, String> chapters = {
  //   "1": "The Opening",
  //   "2": "The Cow",
  //   "3": "The Family of Imran",
  //   // Add more chapters or verses as needed
  // };

  late Map<String, String> chapters;

  late FileReaderClass fileReaderClass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chapters = {};
    fileReaderClass = FileReaderClass();
    readFileAndProcess();
  }

  Future<void> readFileAndProcess() async {
    List<String> data;
    try {
      data = await fileReaderClass.readFile('topics.txt');

      for (int i = 0; i < data.length; i++) {
          try {
              String num = (i + 1).toString();
              chapters[num] = data[i];

          } catch (e) {
            print('Error: $e');
            chapters[''] = ' ';
          }

      }

      setState(() {});
    } catch (e) {
      print('Error reading file: $e');
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

    List<String> titles = description.split(':');
    String _TopicName = titles[0];
    String lines = titles[1];
    String TopicName = _TopicName.replaceAll('_', ' ');
    return InkWell(
      onTap: () {
        // Navigate to the next page and pass the chapterId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlphaQuranVerse(chapterId: chapterName,chapterName:_TopicName, chapterLines: lines,),
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
                Text(chapterName, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'elmessiri')),
                SizedBox(width: 10),
                Expanded(
                  child: Text(TopicName, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'elmessiri')), // Optional: display description
                ),
                Image.asset('images/book.png',width: 30,height: 30,),
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

import 'package:alphabeticalquran/VerseDetail.dart';
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
    extractVerses(topicName, lines).then((value) {
      setState(() {
        modelPageList = value;
      });
    });

  }

  Future<List<ModelPage>> extractVerses(String topicName, int lines) async {
    List<ModelPage> modelPageList = [];
    List<String> data = await fileReaderClass.readFile('topicverse.txt');
    for (int i = 0; i < data.length; i++) {
      String formattedTopicName = topicName;
      if (data[i].contains(formattedTopicName)) {
        for (int k = 1; k <= lines; k++) {
          ModelPage modelPage = ModelPage(verse: "", verseID: "");
          try {
            String verseData = data[i + k];
            if (verseData.isNotEmpty) {
              List<String> titles = verseData.split(RegExp(r'[\[\]]'));
              if (titles.length > 1) {
                modelPage.verse = titles[2];
                modelPage.verseID = titles[1];
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
      appBar: AppBar(
        backgroundColor: Color(0xFF003F38),
        centerTitle: false,
        title: Text(widget.chapterName),
        titleTextStyle: TextStyle(fontFamily: 'elmessiri',color: Colors.white,fontSize: 23),
        iconTheme: IconThemeData(
          color: Colors.white, // Set your desired color for the back button here
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: white,
          child: Column(
            children: <Widget>[
              Expanded(// Use Expanded to fill the remaining space
                child: ListView.builder(
                  itemCount: modelPageList.length,
                  itemBuilder: (context, index) {
                    ModelPage modelPage = modelPageList[index];
                    return _buildCustomListItem(modelPage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomListItem(ModelPage modelPage) {
    return InkWell(
      onTap: () {
        // Navigate to the next page and pass the chapterId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerseDetail(),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10), // Added padding for better UI
            child: Row(
              children: [
                Text(modelPage.verseID, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'elmessiri')),
                SizedBox(width: 20),
                Expanded(
                  child: Text(modelPage.verse, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'elmessiri')), // Display the verse
                ),
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

class ModelPage {
  String verse;
  String verseID;

  ModelPage({required this.verse, required this.verseID});
}

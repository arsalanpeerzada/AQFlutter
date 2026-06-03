import 'package:alphabeticalquran/VerseDetail.dart';
import 'package:flutter/material.dart';
import 'Utils/FileReaderClass.dart';
import 'package:flutter/services.dart';

class AlphaQuranVerse extends StatefulWidget {
  final String chapterId;
  final String chapterName;
  final List<ModelPage> verses;

  const AlphaQuranVerse({super.key, required this.chapterId, required this.chapterName, required this.verses});

  @override
  State<AlphaQuranVerse> createState() => _AlphaQuranVerseState();
}

class _AlphaQuranVerseState extends State<AlphaQuranVerse> {
  Color background = Color(0xFF003F38);
  Color fontGold = Color(0xFFFFDE93);
  Color white = Color(0xFFFFFFFF);


  List<ModelPage> modelPageList = [];

  @override
  void initState() {
    super.initState();
    modelPageList = widget.verses;
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
      body: Container(
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
    );
  }

  Widget _buildCustomListItem(ModelPage modelPage) {
    return InkWell(
      onTap: () {
        // Navigate to the next page and pass the chapterId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerseDetail(verseID: modelPage.verseID),
          ),
        );
      },
      onLongPress: () {
        // Copy both verseID and verse to clipboard
        Clipboard.setData(
          ClipboardData(
            text: '${modelPage.verseID} - ${modelPage.verse}',
          ),
        );
        // Show a snackbar to notify the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Copied to clipboard!'),
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
                SizedBox(width:20),
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

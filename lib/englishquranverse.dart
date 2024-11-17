import 'package:alphabeticalquran/Models/VerseChapterModel.dart';
import 'package:flutter/material.dart';

import 'Remote/ApiService.dart';
import 'package:flutter/services.dart';

class EnglishQuranVerses extends StatefulWidget {
  final int chapterId;
  final String chapterName;

  const EnglishQuranVerses({super.key, required this.chapterId,required this.chapterName});

  @override
  State<EnglishQuranVerses> createState() => _EnglishQuranVersesState();
}

class _EnglishQuranVersesState extends State<EnglishQuranVerses> {

  final ApiService apiService = ApiService();
  late Future<VerseChapterModel> futureChapter;


  @override
  void initState() {
    super.initState();
    futureChapter = apiService.getEnglishVerses(widget.chapterId); // Example chapter number
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
      body: FutureBuilder<VerseChapterModel>(
        future: futureChapter,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.translations.length,
              itemBuilder: (context, index) {
                String data = snapshot.data!.translations[index].text.toString();
                String normalText = data.replaceAll(RegExp(r'<[^>]*>'), '');
                return _buildCustomListItem(normalText,index);
              },
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
  Widget _buildCustomListItem(chapter, int index) {
    String chapterId = (index + 1).toString();
    String ChapterName = chapter;

    return InkWell(
      onLongPress: () {
        // Copy both verseID and verse to clipboard
        Clipboard.setData(
          ClipboardData(
            text: '${chapterId} - ${ChapterName}',
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
            padding: EdgeInsets.all(8), // Added padding for better UI
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(chapterId, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'elmessiri')),
                SizedBox(width: 20),
                Expanded(
                  child: Text(ChapterName, style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'elmessiri')), // Optional: display description
                ),
                SizedBox(width: 20),
              ],
            ),
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




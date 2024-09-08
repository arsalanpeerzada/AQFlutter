import 'package:alphabeticalquran/Models/VerseChapterModel.dart';
import 'package:flutter/material.dart';

import 'Remote/ApiService.dart';

class UrduQuranVerse extends StatefulWidget {
  final int chapterId;
  final String chapterName;

  const UrduQuranVerse({super.key, required this.chapterId,required this.chapterName});

  @override
  State<UrduQuranVerse> createState() => _UrduQuranVerseState();
}

class _UrduQuranVerseState extends State<UrduQuranVerse> {

  final ApiService apiService = ApiService();
  late Future<VerseChapterModel> futureChapter;


  @override
  void initState() {
    super.initState();
    futureChapter = apiService.getUrduQuranVerse(widget.chapterId); // Example chapter number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF003F38),
          title: Text(' سورۃ ${widget.chapterName}'),
          iconTheme: IconThemeData(
            color: Colors.white, // Change the back button color
          ),
          titleTextStyle:
              TextStyle(fontFamily: 'jnr', color: Colors.white, fontSize: 25)),
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
                return _buildCustomListItem(snapshot.data!.translations[index].text,index);
              },
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}


Widget _buildCustomListItem(chapter , index) {
  String chapterId = (index + 1).toString();
  String ChapterName = chapter.replaceAll(RegExp(r'<[^>]*>'), '');
  //String urduText = originalText.replaceAll(RegExp(r'<[^>]*>'), '');

  return Column(
    children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(8), // Added padding for better UI
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(
              child: Text(ChapterName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "jnr")), // Optional: display description
            ),
            SizedBox(width: 15),
            Text(chapterId,
                style: TextStyle(color: Colors.black, fontSize: 20)),
            SizedBox(width: 15),
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
  );
}

import 'package:alphabeticalquran/Models/VerseChapterModel.dart';
import 'package:flutter/material.dart';

import 'Remote/ApiService.dart';

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
        title: Text('Surah ${widget.chapterName}'),
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
  String chapterId = index.toString();
   String ChapterName = chapter;

  return Column(
    children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(8), // Added padding for better UI
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(chapterId, style: TextStyle(color: Colors.black, fontSize: 16)),
            SizedBox(width: 15),
            Expanded(
              child: Text(ChapterName, style: TextStyle(color: Colors.black, fontSize: 16)), // Optional: display description
            ),
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

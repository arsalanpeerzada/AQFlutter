import 'package:flutter/material.dart';
import 'package:alphabeticalquran/Models/ChapterInfoModel.dart';
import 'package:alphabeticalquran/Models/VerseInfoModel.dart';
import 'package:alphabeticalquran/Models/VerseArabicModel.dart';
import 'Remote/ApiService.dart';


class VerseDetail extends StatefulWidget {
  const VerseDetail({super.key});

  @override
  State<VerseDetail> createState() => _VerseDetailState();
}

class _VerseDetailState extends State<VerseDetail> {
  final ApiService apiService = ApiService();

  ChapterInfoModel? chapterInfo;
  VerseInfoModel? verseInfo;
  VerseArabicModel? verseArabic;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      ChapterInfoModel chapterData = await apiService.getChapter(33); // example chapter id
      VerseInfoModel verseData =await apiService.getVerse('33:5'); // example verse key
      VerseArabicModel verseArabicData = await apiService.getVerseArabic('33:5'); // example verse key

      setState(() {
        chapterInfo = chapterData;
        verseInfo = verseData;
        verseArabic = verseArabicData;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003F38),
        centerTitle: false,
        title: Text(
          'Alphabetical Quran',
          style: TextStyle(
            fontFamily: 'elmessiri',
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Change the back button color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: 'Chapter Name:'),
              SectionContent(content: chapterInfo?.chapter.nameSimple ?? 'Loading...'),
              SectionTitle(title: 'Revelation Place:'),
              SectionContent(content: chapterInfo?.chapter.revelationPlace ?? 'Loading...'),
              SectionTitle(title: 'Verse:'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Text(
                  verseArabic?.verses[0].textIndopak ?? 'Loading...',
                  style: TextStyle(
                    fontFamily: 'jnr',
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SectionTitle(title: 'Translation:'),
              SectionContent(content: verseInfo?.verse.translations[1].text?? 'Loading...'),
              SectionTitle(title: 'Translation Urdu:'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Text(
                  verseInfo?.verse.translations[0].text ?? 'Loading...',
                  style: TextStyle(
                    fontFamily: 'jnr',
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF003F38),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'elmessiri',
        ),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  const SectionContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'elmessiri',
        ),
      ),
    );
  }
}

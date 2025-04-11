import 'package:flutter/material.dart';
import 'package:alphabeticalquran/Models/ChapterInfoModel.dart';
import 'package:alphabeticalquran/Models/VerseInfoModel.dart';
import 'package:alphabeticalquran/Models/VerseArabicModel.dart';
import 'package:flutter/services.dart';
import 'Remote/ApiService.dart';


class VerseDetail extends StatefulWidget {
  final String verseID;

  const VerseDetail({super.key, required this.verseID});

  @override
  State<VerseDetail> createState() => _VerseDetailState();
}

class _VerseDetailState extends State<VerseDetail> {
  final ApiService apiService = ApiService();

  ChapterInfoModel? chapterInfo;
  VerseInfoModel? verseInfo;
  VerseArabicModel? verseArabic;
  String _verseID = "1:1";
  int _verse = 1;
  String urdu = "";


  @override
  void initState() {
    super.initState();
    _fetchData();
    _verseID = widget.verseID;
    String zeroIndex = _verseID.split(":")[0];
    _verse = int.parse(zeroIndex);

  }

  Future<void> _fetchData() async {
    try {
      ChapterInfoModel chapterData = await apiService.getChapter(_verse); // example chapter id
      VerseInfoModel verseData =await apiService.getVerse(_verseID); // example verse key
      VerseArabicModel verseArabicData = await apiService.getVerseArabic(_verseID); // example verse key

      setState(() {
        chapterInfo = chapterData;
        verseInfo = verseData;
        verseArabic = verseArabicData;
        urdu =  verseInfo!.verse.translations[0].text.replaceAll(RegExp(r'<[^>]*>'), '');
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
              SectionContent2(content: verseArabic?.verses[0].textIndopak ?? 'Loading...'),
              SectionTitle(title: 'Translation:'),
              SectionContent(content: verseInfo?.verse.translations[1].text?? 'Loading...'),
              SectionTitle(title: 'Translation Urdu:'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Text(
                  urdu,
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

  const SectionContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: content));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Copied to clipboard')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'elmessiri',
          ),
        ),
      ),
    );
  }
}


class SectionContent2 extends StatelessWidget {
  final String content;

  const SectionContent2({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: content));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Copied to clipboard')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'scheherazae',
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

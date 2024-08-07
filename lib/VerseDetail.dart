import 'package:flutter/material.dart';

class VerseDetail extends StatefulWidget {
  const VerseDetail({super.key});

  @override
  State<VerseDetail> createState() => _VerseDetailState();
}

class _VerseDetailState extends State<VerseDetail> {
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: 'Chapter Name:'),
              SectionContent(content: 'Al-Ahzab, Al-\'Aĥzāb, الأحزاب'),
              SectionTitle(title: 'Revelation Place:'),
              SectionContent(content: 'madinah'),
              SectionTitle(title: 'Verse:'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'ٱدْعُوهُمْ لِءَابَآئِهِمْ هُوَ أَقْسَطُ عِندَ ٱللَّهِ فَإِن لَّمْ تَعْلَمُوٓا۟ ءَابَآءَهُمْ فَإِخْوَٰنُكُمْ فِى ٱلدِّينِ وَمَوَٰلِيكُمْ وَلَيْسَ عَلَيْكُمْ جُنَاحٌ فِيمَآ أَخْطَأْتُم بِهِۦ وَلَٰكِن مَّا تَعَمَّدَتْ قُلُوبُكُمْ ۚ وَكَانَ ٱللَّهُ غَفُورًۭا رَّحِيمًۭا',
                  style: TextStyle(
                    fontFamily: 'elmessiri',
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SectionTitle(title: 'Translation:'),
              SectionContent(
                content:
                'Mooh bole beton(adopted sons) ko unke baapon (fathers) ki nisbat se pukaro, yeh Allah ke nazdeek zyada munsifana (equitable) baat hai. Aur agar tumhein maloom na ho ke unke baap kaun hain to woh tumhare deeni bhai aur rafeeq hain. Na danishta jo baat tum kaho iske liye tumpar koi giraft(pakad) nahin hai, lekin us baat par zaroor giraft hai jiska tum dil se irada karo. Allah darguzar karne wala aur raheem hai',
              ),
              SectionTitle(title: 'Translation Urdu:'),
              SectionContent(
                content:
                'منہ بولے بیٹوں کو ان کے باپوں کی نسبت سے پکارو،یہ الله کے نزدیک زیادہ منصفانہ بات ہے۔\n1 اور اگر تمہیں معلوم نہ ہو کہ ان کے باپ کون ہے تو وہ تمہارے دینی بھائی اور رفیق ہیں۔\n2 نادانستہ جو بات تم کہو اس کے لیے تم پر کوئی گرفت نہیں ہے، لیکن اس بات پر ضرور گرفت ہے جس کا تم دل سے ارادہ کرو۔\n3 الله در گزر کرنے والا اور رحیم ہے۔\n4',
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
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'elmessiri',
        ),
      ),
    );
  }
}

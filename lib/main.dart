import 'package:alphabeticalquran/splach_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alphabetical Quran',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), //const MyHomePage(title: 'Alphabetical Quran'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    Color background = Color(0xFF003F38);
    Color fontGold = Color(0xFFFFDE93);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: background,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/headeredit.png"),
                    fit: BoxFit.cover,  // This ensures the image covers the screen
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Alphabetical Quran",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),

                    ),
                  ),
                ),
              ),

              Container(
                color: background,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
                  child: Text(
                    'World\'s First and only Alphabetical Quran (since 2005) where The ayahs of the Quran are arranged under major topics sorted alphabetically a handy tool for research. Explore & Search Quran Arranged Alphabetically By Topics of Interest.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14,color: Color(0xFFFFDE93)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Arabic Quran'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('English Quran'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Urdu Quran'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('About Quran'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {},
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.instagram),
                  //   onPressed: () {},
                  // ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Created By Syed Ammar Shah (author@jsdol.org)\nDeveloped by Teniqs.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

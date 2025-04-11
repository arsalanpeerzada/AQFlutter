import 'dart:convert'; // for using json.decode

import 'package:alphabeticalquran/aboutQuran.dart';
import 'package:alphabeticalquran/alphaquran.dart';
import 'package:alphabeticalquran/arabicquran.dart';
import 'package:alphabeticalquran/englishquran.dart';
import 'package:alphabeticalquran/splach_screen.dart';
import 'package:alphabeticalquran/urduquran.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF003D35)),
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
  String apiData = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      var data = await fetchDateConversion();
      setState(() {
        apiData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        // Optionally, handle the error more gracefully and inform the user
        //print('Failed to fetch data: $e');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color background = Color(0xFF003D35);
    Color fontGold = Color(0xFFFFDE93);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: background,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
              Container(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/headeredit.png"),
                    fit: BoxFit
                        .cover, // This ensures the image covers the screen
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Alphabetical Quran",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'elmessiri',
                          color: fontGold,
                          fontWeight: FontWeight.bold),
                    ),
                    Center(

                      child: FutureBuilder<String>(
                        future: fetchDateConversion(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('');
                          } else {
                            return Text('${snapshot.data}',style: TextStyle(color: fontGold),);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: background,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: Text(
                    'World\'s First and only Alphabetical Quran (since 2005) where The ayahs of the Quran are arranged under major topics sorted alphabetically a handy tool for research. Explore & Search Quran Arranged Alphabetically By Topics of Interest.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'elmessiri',
                        color: Color(0xFFFFDE93)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 1,
                child: Container(
                  color: fontGold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              IntrinsicHeight(
                child: InkWell(
                  onTap: () {
                    // Define the action to perform when the widget is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AlphaQuran()),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 5, // 20% of the space
                          child: SizedBox()),
                      Expanded(
                          flex: 20, // 20% of the space
                          child: Image.asset('images/prayer.png')),
                      Expanded(
                          flex: 5, // 20% of the space
                          child: SizedBox()),
                      Expanded(
                        flex: 60, // 80% of the space
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // Center the Column contents vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Alphabetical Quran',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: fontGold,
                                  fontFamily: 'elmessiri'),
                            ),
                            Text(
                              'Explore & Search Quran Arranged Alphabetically By Topics of Interest.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: fontGold,
                                  fontFamily: 'elmessiri'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 5, // 20% of the space
                          child: SizedBox()),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 1,
                child: Container(
                  color: fontGold,
                ),
              ),

              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ImageTextButton(
                      imagePath: 'images/qbook.png',
                      // Update with your image path
                      buttonText: 'Arabic Quran',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ArabicQuran()),
                        );
                      },
                    ),
                    SizedBox(width: 70),
                    Container(
                      width: 1,
                      color: Color(0xFFFFDE93),
                    ),
                    SizedBox(width: 70),
                    ImageTextButton(
                      imagePath: 'images/qbook.png',
                      // Update with your image path
                      buttonText: 'English Quran',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EnglishQuran()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
                child: Container(
                  color: fontGold,
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ImageTextButton(
                      imagePath: 'images/qbook.png',
                      // Update with your image path
                      buttonText: 'Urdu Quran',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const UrduQuran()),
                        );
                      },
                    ),
                    SizedBox(width: 73),
                    Container(
                      width: 1,
                      color: Color(0xFFFFDE93),
                    ),
                    SizedBox(width: 70),
                    ImageTextButton(
                      imagePath: 'images/qbook.png',
                      // Update with your image path
                      buttonText: 'About Quran',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => aboutQuran()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
                child: Container(
                  color: fontGold,
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ImageTextButton2(
                      imagePath: 'images/facebook.png',
                      // Update with your image path
                      buttonText: 'Facebook',
                      onTap: () async {
                        // https://www.facebook.com/alphabeticalquran
                        const url =
                            'https://www.facebook.com/alphabeticalquran';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    SizedBox(width: 88),
                    Container(
                      width: 1,
                      color: Color(0xFFFFDE93),
                    ),
                    SizedBox(width: 50),
                    ImageTextButton2(
                      imagePath: 'images/book.png',
                      // Update with your image path
                      buttonText: 'Buy the \n HoneyBee Book',
                      onTap: () async {
                        // https://www.instagram.com/alphabeticalquran

                        const url =
                            'https://thehoneybeebook.com/product/book/';
                        if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                        } else {
                        throw 'Could not launch $url';
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
                child: Container(
                  color: fontGold,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Created By Syed Ammar Shah (author@sdol.org)\nDeveloped by Teniqs.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: fontGold,fontFamily: 'elmessiri'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageTextButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onTap;

  Color background = Color(0xFF003F38);
  Color fontGold = Color(0xFFFFDE93);

  ImageTextButton({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 50, // Specify your image width
            height: 80, // Specify your image height
            fit: BoxFit.cover, // Cover the given space
          ),
          SizedBox(height: 2),
          SizedBox(
            height: 2,
            child: Container(
              color: fontGold,
            ),
          ),
          // Space between image and text
          Text(
            buttonText,
            style: TextStyle(
                fontSize: 14, // Font size for the text
                color: fontGold,
                fontFamily: 'elmessiri' // Font weight
                ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class ImageTextButton2 extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onTap;

  Color background = Color(0xFF003F38);
  Color fontGold = Color(0xFFFFDE93);

  ImageTextButton2({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Image.asset(
            imagePath,
            width: 50, // Specify your image width
            height: 50, // Specify your image height
            fit: BoxFit.cover, // Cover the given space
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 10,
            child: Container(
              color: fontGold,
            ),
          ),
          // Space between image and text
          Text(
            buttonText,
            textAlign:  TextAlign.center,
            style: TextStyle(
                fontSize: 14, // Font size for the text
                color: fontGold,
                fontFamily: 'elmessiri' // Font weight
                ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

Future<String> fetchDateConversion() async {
  // URL of the API
  String date = getCurrentDate();
  String url = 'http://api.aladhan.com/v1/gToH/$date';

  try {
    // Making GET request
    http.Response response = await http.get(Uri.parse(url));

    // Checking if the request was successful
    if (response.statusCode == 200) {
      // Decode the JSON data
      var jsonResponse = jsonDecode(response.body);
      // Navigate through the map to get the month in English from Gregorian part
      String monthEn = jsonResponse['data']['hijri']['month']['en'];
      String day = jsonResponse['data']['hijri']['day'];
      String year = jsonResponse['data']['hijri']['year'];
      String date = "$day, $monthEn, $year AH";

      return date;
    } else {
      // Handle the case when the server does not return a 200 OK response
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handling exceptions by throwing them
    print('Caught error: $e');
    throw Exception('Failed to load data due to an error: $e');
  }
}

String getCurrentDate() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(now);
}



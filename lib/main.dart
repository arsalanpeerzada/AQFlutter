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
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/headeredit.png"),
                    fit: BoxFit
                        .cover, // This ensures the image covers the screen
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Alphabetical Quran",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          color: fontGold,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                color: background,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: Text(
                    'World\'s First and only Alphabetical Quran (since 2005) where The ayahs of the Quran are arranged under major topics sorted alphabetically a handy tool for research. Explore & Search Quran Arranged Alphabetically By Topics of Interest.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Color(0xFFFFDE93)),
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
              IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2, // 20% of the space
                      child: Image.network(
                        'images/prayer',
                        fit: BoxFit.cover,  // Cover the area of the widget
                      ),
                    ),
                    Expanded(
                      flex: 8, // 80% of the space
                      child: Container(
                        padding: EdgeInsets.all(10),  // Optional padding
                        color: Colors.blue[100],  // Optional background color
                        child: Text(
                          'Here is some text that fills 80% of the row. This text can wrap over multiple lines as needed.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
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
                        print('Button Pressed!');
                      },
                    ),
                    SizedBox(width: 40),
                    Container(
                      width: 1,
                      color: Color(0xFFFFDE93),
                    ),
                    SizedBox(width: 40),
                    ImageTextButton(
                      imagePath: 'images/qbook.png',
                      // Update with your image path
                      buttonText: 'English Quran',
                      onTap: () {
                        print('Button Pressed!');
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
                      buttonText: 'Arabic Quran',
                      onTap: () {
                        print('Button Pressed!');
                      },
                    ),
                    SizedBox(width: 40),
                    Container(
                      width: 1,
                      color: Color(0xFFFFDE93),
                    ),
                    SizedBox(width: 40),
                    ImageTextButton(
                      imagePath: 'images/qbook.png',
                      // Update with your image path
                      buttonText: 'English Quran',
                      onTap: () {
                        print('Button Pressed!');
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
        mainAxisSize: MainAxisSize.min, // Use minimum space necessary
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 150, // Specify your image width
            height: 150, // Specify your image height
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
                fontSize: 20, // Font size for the text
                fontWeight: FontWeight.bold,
                color: fontGold // Font weight
                ),
          ),
        ],
      ),
    );
  }
}

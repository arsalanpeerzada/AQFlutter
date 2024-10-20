import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class aboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF003D35),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set your desired icon and color
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Bismillah Ir Rahman Ir Rahim\n"
                      "In the name of Allah, the Beneficent, the Merciful",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'ElMessiri',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "This application contains all the verses of the Holy Quran in a unique arrangement; alphabetically according to the relevant subject matter. The idea is to help you locate all the verses of Quran which speak on a certain subject. The table of contents is provided, for example you require reading about all that was revealed about Musa (AS) in the Quran, you can visit the appropriate section and read all the relevant verses. There might be some spill over on the subject matter in other sections as well as one verse of the Quran can speak about multiple subjects.\n\n"
                    "The translation used is that of Mohammed Habib Shakir, due to the simplicity of English language used for translation.\n\n"
                    "You are free to share/distribute this copy/application, however do give credit where it’s due, to its complier Syed Ammar Shah (author@sdol.org).\n\n"
                    "Spread the Light of Quran. I hold no responsibility for any typing error in the translations. I have just organized it in a desired way. A copy unique in its own way, I hope it is of great help to you in your research.\n\n"
                    "May Allah bless Prophet Muhammad (SAW) and his Progeny (AS) and may He bless the people who fought for revelation of the Quran, and people who fought for implementing the Quran’s rightful meaning and enforcing it.  With this, I also pray for all those who have accompanied me on my journey, inspired me to create my work, distribute it, compile it, create it and who will further spread this message.\n\n"
                    "1. Comprehensive Quranic Reference: Access the world's first alphabetical Quran application since 2005, featuring ayahs organized by major topics for convenient research and study.\n"
                    "2. Easy Topic Navigation: Seamlessly explore the Quranic verses sorted alphabetically under various categories, providing a user-friendly tool for in-depth analysis and understanding.\n"
                    "3. Research and Study Aid: Enhance your study sessions with this Android application, designed to assist users in quick referencing and cross-referencing of topics within the Quran.\n"
                    "4. Scholarly Resource: Whether you're a researcher, student, or a devout reader, this app offers a valuable resource for diving into the teachings of the Quran through an organized alphabetical structure.\n"
                    "5. Practical and Efficient Tool: Elevate your Quranic learning experience with this handy application that streamlines access to specific topics and verses, revolutionizing the way you engage with the holy text.\n\n"
                    "All Translation are from Quran.com\n"
                    "Translation: 831 = Abul Ala Maududi (Roman Urdu)\n"
                    "Translation: 97 = Tafheem e Qur'an (Urdu)\n"
                    "Translation: 95 = Tafheem e Qur'an (English)",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Contact Us your queries at author@sdol.org",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "by Syed Ammar Shah author@sdol.org",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Developed by Teniqs (PVT) LTD",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () async {
                    const url = 'https://teniqs.com';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    "https://teniqs.com",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Hyperlink color
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class aboutQuran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Quran"),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Bismillah Ir Rahman Ir Rahim \nIn the name of Allah, the Beneficent, the Merciful",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'elmessiri', // Ensure this font is added to pubspec.yaml
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _buildSection(
                  "1. A miracle which will withstand the test of time",
                  "Imam Ali Raza (AS) was asked why his forefather Prophet Muhammad (SAW) could not bring people to life like Isa (AS) could or do miracles like Musa (AS) could, if indeed Muhammad (SAW) was Imam ul Ambiya (lead of prophets). The Imam (AS) replied that Musa (AS) was sent at a time when magic was at its peak, and he was given miracles to answer that magic, Isa (AS) was sent at a time when disease was at its peak, and he was given miracles to answer that disease, Prophet Muhammad (SAW) was sent at a time when ignorance was at its peak, and he was given miracles (Quran) to answer that ignorance.",
                ),
                _buildSection(
                  "2. What does the Quran want us to do",
                  "If Quran is the word of Allah himself, which it is, then the first revelation to the greatest creation of all time, Prophet (SAW), by the creator himself, through his own words, was a commandment, an emphasis to read (the Quran);\n\n[96:13] Read in the name of your Lord Who created. He created man from a clot. Read and your Lord is Most Honorable.",
                ),
                _buildSection(
                  "3. Our opinions and beliefs do not matter without knowing what the Quran has to say",
                  "Quran is important because it is an act of worship, and brings sawab (reward). But the importance of the book is more deep rooted than we think. You and I have opinions about everything in life, from what we see, to what we believe in. All of these opinions are based on our criteria of right and wrong which varies from people to people. Mostly the criteria of our judgement is shaded by our nurturing, our society and how it dilutes our view and manipulates our opinions. The Question is a very basic one. How can you and I, have an opinion on anything in our life, right vs wrong, if we do not know what to base that opinion against?\n\nThe Quran is called the Furqan or criterion (between good and evil). We all are opinionated in our lives. We need to realize that all of our views, and faith itself, is merely our opinion and judgment. How can we expect to judge or have an opinion about any matter in our life we are clueless as to what is the control, the baseline, the fundamentals? How can we judge by what Allah has revealed, if we do not know what Allah has revealed?\n\n[4:105] Surely We have revealed the Book to you with the truth that you may judge between people by means of that which Allah has taught you; and be not an advocate on behalf of the treacherous.",
                ),
                _buildSection(
                  "4. Quran is not here to guide you, until you protect yourself",
                  "Do not expect the Quran to guide you. It is not a guide for you. The suicide bomber justifies himself through the Quran (without reading and comprehending it in totality). We fight in different sects, all evidencing their approach to their contradictory sects through the same Quran. Quran is meant for a guide, only for those protect themselves and abstain.\n\n[2:2] This Book, there is no doubt in it, is a guide to those who guard (against evil).\n\nWhy do we rely on others to understand what the Quran says without putting in our effort to read what was revealed to our Prophet (SAW) on his blessed and pure heart? What some one else has understood may not necessarily be the same what you may understand. The Quran will give you your unique message, based on your intellect and piety.",
                ),
                _buildSection(
                  "5. The Quran without the teachings of Prophet (SAW) and his Ahlulbayt (AS) is incomplete",
                  "It shall be unfair to this application and effort, to mention the Quran without mentioning of the Ahlulbayt (AS), for if there is a book, there must be a book keeper, a teacher of the book, an expert on the subject matter, a custodian of the book. For if the book was to be left for interpretations, confusions, conflicts, or without a guardian, what purpose did it serve for the revelations to be booked? If a book is the same book for all the students, but only the best understand the fundamentals of the book and champion the books true letter and spirit, then these best have an elevated intellect to absorb what the book offers to them. If the Quran is understood (like a book) based on the intellectual maturity and piety of a person, then who were closer to the Prophet (SAW) in their relation, privacy, wisdom, inheritance, intellectual excellence and peak of eloquence and piety than the Ahlulbayt (AS) of Prophet (SAW) themselves? No wonder the Prophet (SAW) did not leave behind the Book alone, without mentioning the Ahlulbayt (AS).\n\nSahih Muslim Book 031, Number 5920: … One day Allah's Messenger (may peace be upon him) stood up to deliver sermon at a watering place known as Khumm situated between Mecca and Medina. He praised Allah, extolled Him and delivered the sermon and exhorted (us) and said: Now to our purpose. O people, I am a human being. I am about to receive a messenger (the angel of death) from my Lord and I, in response to Allah's call, (would bid good-bye to you), but I am leaving among you two weighty things: the one being the Book of Allah in which there is right guidance and light, so hold fast to the Book of Allah and adhere to it. He exhorted (us) (to hold fast) to the Book of Allah and then said: The second are the members of my household I remind you (of your duties) to the members of my family. He (Husain) said to Zaid: Who are the members of his household? Aren't his wives the members of his family? Thereupon he said: His wives are the members of his family (but here) the members of his family are those for whom acceptance of Zakat is forbidden. And he said: Who are they? Thereupon he said: 'Ali and the offspring of 'Ali, 'Aqil and the offspring of 'Aqil and the offspring of Ja'far and the offspring of 'Abbas. Husain said: These are those for whom the acceptance of Zakat is forbidden. Zaid said: Yes.",
                ),
                _buildSection(
                  "6. The tragedy that moved us away from the Quran",
                  "You and I, as individuals, have a great role to play, in one of the biggest tragedies that Islam had to undergo, and a chain reaction of that tragedy has such a significant domino effect that it has harmed Islam and continues to do so in ways we may not be able to fully comprehend, the Tragedy of the perception that “the Quran is not for me but only for experts and scholars and molvis to understand and that the Quran is too complicated for me to understand and that the Quran is in arabic and therefore I can not clearly comprehend it till I learn arabic and that the Quran's translation has many versions so I can never know the truth”.\n\n[2:242] Allah thus makes clear to you His communications that you may understand\n\nYou need to read the Quran yourself to rise above this propaganda. How can Allah’s communication intended for you not be clear for you?\n\nAs Imam Ali (AS) said, when I want to speak to Allah, I perform Salat, when I want Allah to speak with me, I read the Quran.\n\nThe tragedy did not start when you and I refused to read the Quran and refused to refer our problems and confusions to the Quran and the Ahlulbayt (AS). The tragedy started when people like you and me refused to read the Quran and refused to refer their problems and confusions to the Quran and Ahlulbayt (AS).",
                ),
                _buildCardinalRules(),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Wasalaam\nSyed Ammar Shah\nauthor@sdol.org",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCardinalRules() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please keep these cardinal rules in mind while you are browsing through this app:",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "1. Quran is the only source of ultimate truth.\n"
              "2. Take a deep dive in Quran yourself and discover it firsthand, don't rely on others' interpretations.\n"
              "3. Seek guidance from Quran and the teachings of Prophet (SAW) and Ahlulbayt (AS).\n"
              "4. Avoid judging the Quran by any other criteria than what is revealed in it.",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

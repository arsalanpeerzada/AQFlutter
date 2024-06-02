import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class ArabicQuranView extends StatelessWidget {
  final int chapterId;
  final String chapterName;

  ArabicQuranView({required this.chapterId, required this.chapterName});

  Future<File> _loadPDFFile() async {
    // Example of loading a PDF from assets, you can adjust this to load from other sources
    String assetPath = 'assets/quran.pdf'; // Update this path
    var data = await rootBundle.load(assetPath);
    var bytes = data.buffer.asUint8List();
    var dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/quran.pdf');
    return file.writeAsBytes(bytes);
  }

  int getChapterNumber(int chapterId) {
    int finalChapterNumber = 0;

    if (chapterId == 1) finalChapterNumber = 4;
    else if (chapterId == 2) finalChapterNumber = 5;
    else if (chapterId == 3) finalChapterNumber = 70;
    else if (chapterId == 4) finalChapterNumber = 108;
    else if (chapterId == 5) finalChapterNumber = 149;
    else if (chapterId == 6) finalChapterNumber = 179;
    else if (chapterId == 7) finalChapterNumber = 211;
    else if (chapterId == 8) finalChapterNumber = 248;
    else if (chapterId == 9) finalChapterNumber = 262;
    else if (chapterId == 10) finalChapterNumber = 290;
    else if (chapterId == 11) finalChapterNumber = 310;
    else if (chapterId == 12) finalChapterNumber = 330;
    else if (chapterId == 13) finalChapterNumber = 348;
    else if (chapterId == 14) finalChapterNumber = 357;
    else if (chapterId == 15) finalChapterNumber = 366;
    else if (chapterId == 16) finalChapterNumber = 374;
    else if (chapterId == 17) finalChapterNumber = 395;
    else if (chapterId == 18) finalChapterNumber = 410;
    else if (chapterId == 19) finalChapterNumber = 427;
    else if (chapterId == 20) finalChapterNumber = 437;
    else if (chapterId == 21) finalChapterNumber = 451;
    else if (chapterId == 22) finalChapterNumber = 464;
    else if (chapterId == 23) finalChapterNumber = 479;
    else if (chapterId == 24) finalChapterNumber = 489;
    else if (chapterId == 25) finalChapterNumber = 503;
    else if (chapterId == 26) finalChapterNumber = 513;
    else if (chapterId == 27) finalChapterNumber = 527;
    else if (chapterId == 28) finalChapterNumber = 539;
    else if (chapterId == 29) finalChapterNumber = 554;
    else if (chapterId == 30) finalChapterNumber = 564;
    else if (chapterId == 31) finalChapterNumber = 573;
    else if (chapterId == 32) finalChapterNumber = 579;
    else if (chapterId == 33) finalChapterNumber = 583;
    else if (chapterId == 34) finalChapterNumber = 597;
    else if (chapterId == 35) finalChapterNumber = 605;
    else if (chapterId == 36) finalChapterNumber = 613;
    else if (chapterId == 37) finalChapterNumber = 620;
    else if (chapterId == 38) finalChapterNumber = 630;
    else if (chapterId == 39) finalChapterNumber = 637;
    else if (chapterId == 40) finalChapterNumber = 649;
    else if (chapterId == 41) finalChapterNumber = 661;
    else if (chapterId == 42) finalChapterNumber = 670;
    else if (chapterId == 43) finalChapterNumber = 679;
    else if (chapterId == 44) finalChapterNumber = 688;
    else if (chapterId == 45) finalChapterNumber = 693;
    else if (chapterId == 46) finalChapterNumber = 699;
    else if (chapterId == 47) finalChapterNumber = 706;
    else if (chapterId == 48) finalChapterNumber = 712;
    else if (chapterId == 49) finalChapterNumber = 718;
    else if (chapterId == 50) finalChapterNumber = 723;
    else if (chapterId == 51) finalChapterNumber = 727;
    else if (chapterId == 52) finalChapterNumber = 731;
    else if (chapterId == 53) finalChapterNumber = 734;
    else if (chapterId == 54) finalChapterNumber = 738;
    else if (chapterId == 55) finalChapterNumber = 742;
    else if (chapterId == 56) finalChapterNumber = 747;
    else if (chapterId == 57) finalChapterNumber = 752;
    else if (chapterId == 58) finalChapterNumber = 759;
    else if (chapterId == 59) finalChapterNumber = 763;
    else if (chapterId == 60) finalChapterNumber = 768;
    else if (chapterId == 61) finalChapterNumber = 772;
    else if (chapterId == 62) finalChapterNumber = 775;
    else if (chapterId == 63) finalChapterNumber = 777;
    else if (chapterId == 64) finalChapterNumber = 779;
    else if (chapterId == 65) finalChapterNumber = 782;
    else if (chapterId == 66) finalChapterNumber = 785;
    else if (chapterId == 67) finalChapterNumber = 789;
    else if (chapterId == 68) finalChapterNumber = 792;
    else if (chapterId == 69) finalChapterNumber = 796;
    else if (chapterId == 70) finalChapterNumber = 799;
    else if (chapterId == 71) finalChapterNumber = 802;
    else if (chapterId == 72) finalChapterNumber = 805;
    else if (chapterId == 73) finalChapterNumber = 808;
    else if (chapterId == 74) finalChapterNumber = 810;
    else if (chapterId == 75) finalChapterNumber = 813;
    else if (chapterId == 76) finalChapterNumber = 815;
    else if (chapterId == 77) finalChapterNumber = 818;
    else if (chapterId == 78) finalChapterNumber = 821;
    else if (chapterId == 79) finalChapterNumber = 822;
    else if (chapterId == 80) finalChapterNumber = 824;
    else if (chapterId == 81) finalChapterNumber = 826;
    else if (chapterId == 82) finalChapterNumber = 827;
    else if (chapterId == 83) finalChapterNumber = 828;
    else if (chapterId == 84) finalChapterNumber = 830;
    else if (chapterId == 85) finalChapterNumber = 831;
    else if (chapterId == 86) finalChapterNumber = 832;
    else if (chapterId == 87) finalChapterNumber = 833;
    else if (chapterId == 88) finalChapterNumber = 834;
    else if (chapterId == 89) finalChapterNumber = 835;
    else if (chapterId == 90) finalChapterNumber = 837;
    else if (chapterId == 91) finalChapterNumber = 838;
    else if (chapterId == 92) finalChapterNumber = 839;
    else if (chapterId == 93) finalChapterNumber = 840;
    else if (chapterId == 94) finalChapterNumber = 840;
    else if (chapterId == 95) finalChapterNumber = 841;
    else if (chapterId == 96) finalChapterNumber = 841;
    else if (chapterId == 97) finalChapterNumber = 842;
    else if (chapterId == 98) finalChapterNumber = 842;
    else if (chapterId == 99) finalChapterNumber = 843;
    else if (chapterId == 100) finalChapterNumber = 844;
    else if (chapterId == 101) finalChapterNumber = 845;
    else if (chapterId == 102) finalChapterNumber = 845;
    else if (chapterId == 103) finalChapterNumber = 846;
    else if (chapterId == 104) finalChapterNumber = 846;
    else if (chapterId == 105) finalChapterNumber = 846;
    else if (chapterId == 106) finalChapterNumber = 847;
    else if (chapterId == 107) finalChapterNumber = 847;
    else if (chapterId == 108) finalChapterNumber = 848;
    else if (chapterId == 109) finalChapterNumber = 848;
    else if (chapterId == 110) finalChapterNumber = 848;
    else if (chapterId == 111) finalChapterNumber = 849;
    else if (chapterId == 112) finalChapterNumber = 849;
    else if (chapterId == 113) finalChapterNumber = 849;
    else if (chapterId == 114) finalChapterNumber = 850;

    return finalChapterNumber;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapterName),
      ),
      body: FutureBuilder<File>(
        future: _loadPDFFile(), // Change this to load your PDF file
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error loading PDF"));
            }
            return PDFView(
              filePath: snapshot.data?.path,
              autoSpacing: true,
              pageFling: true,
              pageSnap: true,
              fitPolicy: FitPolicy.BOTH,
              defaultPage: getChapterNumber(chapterId) -1,
              // Set desired page number here
              onRender: (_pages) {
                print('PDF rendered with $_pages pages');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                // Perform additional setup if needed
              },
              onPageChanged: (int? page, int? total) {
                print('Page changed: $page of $total');
              },
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

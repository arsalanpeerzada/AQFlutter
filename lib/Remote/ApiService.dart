import 'dart:convert';
import 'package:alphabeticalquran/Models/VerseChapterModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.quran.com/api/v4';

  Future<VerseChapterModel> getEnglishVerses(int chapterNumber) async {
    final response = await http.get(
      Uri.parse('$baseUrl/quran/translations/95?chapter_number=$chapterNumber'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return VerseChapterModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<VerseChapterModel> getUrduQuranVerse(int chapterNumber) async {
    final response = await http.get(
      Uri.parse('$baseUrl/quran/translations/97?chapter_number=$chapterNumber'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return VerseChapterModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

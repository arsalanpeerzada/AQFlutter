import 'dart:convert';
import 'package:alphabeticalquran/Models/VerseChapterModel.dart';
import 'package:alphabeticalquran/Models/ChapterInfoModel.dart';
import 'package:alphabeticalquran/Models/VerseInfoModel.dart';
import 'package:alphabeticalquran/Models/VerseArabicModel.dart';
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

  Future<ChapterInfoModel> getChapter(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/chapters/$id'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ChapterInfoModel.fromJson(data);
    } else {
      throw Exception('Failed to load chapter info');
    }
  }

  Future<VerseInfoModel> getVerse(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/verses/by_key/$id?translations=831,97'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return VerseInfoModel.fromJson(data);
    } else {
      throw Exception('Failed to load verse info');
    }
  }

  Future<VerseArabicModel> getVerseArabic(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/quran/verses/indopak?verse_key=$id'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return VerseArabicModel.fromJson(data);
    } else {
      throw Exception('Failed to load Arabic verse');
    }
  }
}

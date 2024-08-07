class ChapterInfoModel {
  final Chapter chapter;

  ChapterInfoModel({
    required this.chapter,
  });

  factory ChapterInfoModel.fromJson(Map<String, dynamic> json) {
    return ChapterInfoModel(
      chapter: Chapter.fromJson(json['chapter']),
    );
  }
}

class Chapter {
  final int id;
  final String revelationPlace;
  final int revelationOrder;
  final bool bismillahPre;
  final String nameSimple;
  final String nameComplex;
  final String nameArabic;
  final int versesCount;
  final List<int> pages;
  final TranslatedName translatedName;

  Chapter({
    required this.id,
    required this.revelationPlace,
    required this.revelationOrder,
    required this.bismillahPre,
    required this.nameSimple,
    required this.nameComplex,
    required this.nameArabic,
    required this.versesCount,
    required this.pages,
    required this.translatedName,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    var pagesFromJson = json['pages'];
    List<int> pagesList = pagesFromJson != null ? List<int>.from(pagesFromJson) : [];

    return Chapter(
      id: json['id'],
      revelationPlace: json['revelation_place'],
      revelationOrder: json['revelation_order'],
      bismillahPre: json['bismillah_pre'],
      nameSimple: json['name_simple'],
      nameComplex: json['name_complex'],
      nameArabic: json['name_arabic'],
      versesCount: json['verses_count'],
      pages: pagesList,
      translatedName: TranslatedName.fromJson(json['translated_name']),
    );
  }
}

class TranslatedName {
  final String languageName;
  final String name;

  TranslatedName({
    required this.languageName,
    required this.name,
  });

  factory TranslatedName.fromJson(Map<String, dynamic> json) {
    return TranslatedName(
      languageName: json['language_name'],
      name: json['name'],
    );
  }
}

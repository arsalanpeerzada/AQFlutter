class VerseInfoModel {
  final Verse verse;

  VerseInfoModel({
    required this.verse,
  });

  factory VerseInfoModel.fromJson(Map<String, dynamic> json) {
    return VerseInfoModel(
      verse: Verse.fromJson(json['verse']),
    );
  }
}

class Verse {
  final int id;
  final int verseNumber;
  final String verseKey;
  final int hizbNumber;
  final int rubElHizbNumber;
  final int rukuNumber;
  final int manzilNumber;
  final int? sajdahNumber;
  final int pageNumber;
  final int juzNumber;
  final List<Translation> translations;

  Verse({
    required this.id,
    required this.verseNumber,
    required this.verseKey,
    required this.hizbNumber,
    required this.rubElHizbNumber,
    required this.rukuNumber,
    required this.manzilNumber,
    this.sajdahNumber,
    required this.pageNumber,
    required this.juzNumber,
    required this.translations,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    var translationsFromJson = json['translations'] as List;
    List<Translation> translationsList = translationsFromJson.map((i) => Translation.fromJson(i)).toList();

    return Verse(
      id: json['id'],
      verseNumber: json['verse_number'],
      verseKey: json['verse_key'],
      hizbNumber: json['hizb_number'],
      rubElHizbNumber: json['rub_el_hizb_number'],
      rukuNumber: json['ruku_number'],
      manzilNumber: json['manzil_number'],
      sajdahNumber: json['sajdah_number'],
      pageNumber: json['page_number'],
      juzNumber: json['juz_number'],
      translations: translationsList,
    );
  }
}

class Translation {
  final int id;
  final int resourceId;
  final String text;

  Translation({
    required this.id,
    required this.resourceId,
    required this.text,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      resourceId: json['resource_id'],
      text: json['text'],
    );
  }
}

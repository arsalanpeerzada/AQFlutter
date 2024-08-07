class VerseArabicModel {
  final List<Verse> verses;
  final Meta meta;

  VerseArabicModel({
    required this.verses,
    required this.meta,
  });

  factory VerseArabicModel.fromJson(Map<String, dynamic> json) {
    var versesFromJson = json['verses'] as List;
    List<Verse> versesList = versesFromJson.map((i) => Verse.fromJson(i)).toList();

    return VerseArabicModel(
      verses: versesList,
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Verse {
  final int id;
  final String verseKey;
  final String textIndopak;

  Verse({
    required this.id,
    required this.verseKey,
    required this.textIndopak,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      id: json['id'],
      verseKey: json['verse_key'],
      textIndopak: json['text_indopak'],
    );
  }
}

class Meta {
  final Filters filters;

  Meta({
    required this.filters,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      filters: Filters.fromJson(json['filters']),
    );
  }
}

class Filters {
  final String verseKey;

  Filters({
    required this.verseKey,
  });

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
      verseKey: json['verse_key'],
    );
  }
}

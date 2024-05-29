import 'dart:convert';

class VerseChapterModel {
  final List<Translation> translations;
  final Meta meta;

  VerseChapterModel({required this.translations, required this.meta});

  factory VerseChapterModel.fromJson(Map<String, dynamic> json) {
    return VerseChapterModel(
      translations: List<Translation>.from(json['translations'].map((x) => Translation.fromJson(x))),
      meta: Meta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'translations': List<dynamic>.from(translations.map((x) => x.toJson())),
      'meta': meta.toJson(),
    };
  }
}

class Translation {
  final int resourceId;
  final String text;

  Translation({required this.resourceId, required this.text});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      resourceId: json['resource_id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resource_id': resourceId,
      'text': text,
    };
  }
}

class Meta {
  final String translationName;
  final String authorName;
  final Filters filters;

  Meta({required this.translationName, required this.authorName, required this.filters});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      translationName: json['translation_name'],
      authorName: json['author_name'],
      filters: Filters.fromJson(json['filters']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'translation_name': translationName,
      'author_name': authorName,
      'filters': filters.toJson(),
    };
  }
}

class Filters {
  final int resourceId;
  final String chapterNumber;

  Filters({required this.resourceId, required this.chapterNumber});

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
      resourceId: json['resource_id'],
      chapterNumber: json['chapter_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resource_id': resourceId,
      'chapter_number': chapterNumber,
    };
  }
}

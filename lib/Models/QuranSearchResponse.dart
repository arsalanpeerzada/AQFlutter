class QuranSearchResponse {
  final String query;
  final int totalResults;
  final int currentPage;
  final int totalPages;
  final List<SearchResult> results;

  QuranSearchResponse({
    required this.query,
    required this.totalResults,
    required this.currentPage,
    required this.totalPages,
    required this.results,
  });

  factory QuranSearchResponse.fromJson(Map<String, dynamic> json) {
    return QuranSearchResponse(
      query: json['search']['query'],
      totalResults: json['search']['total_results'],
      currentPage: json['search']['current_page'],
      totalPages: json['search']['total_pages'],
      results: (json['search']['results'] as List)
          .map((result) => SearchResult.fromJson(result))
          .toList(),
    );
  }
}

class SearchResult {
  final String verseKey;
  final int verseId;
  final String text;
  final List<Word> words;
  final List<Translation> translations;

  SearchResult({
    required this.verseKey,
    required this.verseId,
    required this.text,
    required this.words,
    required this.translations,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      verseKey: json['verse_key'],
      verseId: json['verse_id'],
      text: json['text'],
      words: (json['words'] as List).map((word) => Word.fromJson(word)).toList(),
      translations: (json['translations'] as List)
          .map((translation) => Translation.fromJson(translation))
          .toList(),
    );
  }
}

class Word {
  final String charType;
  final String text;

  Word({
    required this.charType,
    required this.text,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      charType: json['char_type'],
      text: json['text'],
    );
  }
}

class Translation {
  final String text;
  final int resourceId;
  final String name;
  final String languageName;

  Translation({
    required this.text,
    required this.resourceId,
    required this.name,
    required this.languageName,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      text: json['text'],
      resourceId: json['resource_id'],
      name: json['name'],
      languageName: json['language_name'],
    );
  }
}

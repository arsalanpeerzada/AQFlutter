import 'package:facebook_app_events/facebook_app_events.dart';

class FacebookAnalyticsService {
  static final FacebookAnalyticsService _instance = FacebookAnalyticsService._internal();
  factory FacebookAnalyticsService() => _instance;
  FacebookAnalyticsService._internal();

  final FacebookAppEvents _facebookAppEvents = FacebookAppEvents();

  Future<void> initialize() async {
    try {
      // The plugin automatically initializes the SDK
      // You can optionally set additional configuration here
      await _facebookAppEvents.setAdvertiserTracking(enabled: true);
      print('Facebook App Events initialized successfully');
    } catch (e) {
      print('Failed to initialize Facebook App Events: $e');
    }
  }

  Future<void> logAppOpen() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'fb_mobile_activate_app',
      );
    } catch (e) {
      print('Failed to log app open: $e');
    }
  }

  Future<void> logViewAlphabeticalQuran() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'view_alphabetical_quran',
        parameters: {
          'content_type': 'quran_section',
          'section': 'alphabetical',
        },
      );
    } catch (e) {
      print('Failed to log Alphabetical Quran view: $e');
    }
  }

  Future<void> logViewArabicQuran() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'view_arabic_quran',
        parameters: {
          'content_type': 'quran_section',
          'section': 'arabic',
        },
      );
    } catch (e) {
      print('Failed to log Arabic Quran view: $e');
    }
  }

  Future<void> logViewEnglishQuran() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'view_english_quran',
        parameters: {
          'content_type': 'quran_section',
          'section': 'english',
        },
      );
    } catch (e) {
      print('Failed to log English Quran view: $e');
    }
  }

  Future<void> logViewUrduQuran() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'view_urdu_quran',
        parameters: {
          'content_type': 'quran_section',
          'section': 'urdu',
        },
      );
    } catch (e) {
      print('Failed to log Urdu Quran view: $e');
    }
  }

  /// Log when user reads a specific verse
  Future<void> logVerseRead({
    required String surahNumber,
    required String verseNumber,
    required String language,
  }) async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'verse_read',
        parameters: {
          'content_type': 'verse',
          'surah': surahNumber,
          'verse': verseNumber,
          'language': language,
        },
      );
    } catch (e) {
      print('Failed to log verse read: $e');
    }
  }

  /// Log search activity
  Future<void> logSearch({
    required String searchTerm,
    required String searchType,
  }) async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'fb_mobile_search',
        parameters: {
          'fb_search_string': searchTerm,
          'search_type': searchType,
        },
      );
    } catch (e) {
      print('Failed to log search: $e');
    }
  }

  Future<void> logFacebookLinkClick() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'social_link_click',
        parameters: {
          'platform': 'facebook',
          'destination': 'alphabeticalquran_page',
        },
      );
    } catch (e) {
      print('Failed to log Facebook link click: $e');
    }
  }

  Future<void> logHoneyBeeBookClick() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'external_link_click',
        parameters: {
          'link_type': 'book_purchase',
          'destination': 'honeybee_book',
        },
      );
    } catch (e) {
      print('Failed to log HoneyBee book click: $e');
    }
  }

  /// Log when user views About Quran section
  Future<void> logViewAboutQuran() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'view_about_quran',
        parameters: {
          'content_type': 'educational',
          'section': 'about',
        },
      );
    } catch (e) {
      print('Failed to log About Quran view: $e');
    }
  }

  /// Log custom event with parameters
  Future<void> logCustomEvent({
    required String eventName,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      await _facebookAppEvents.logEvent(
        name: eventName,
        parameters: parameters,
      );
    } catch (e) {
      print('Failed to log custom event: $e');
    }
  }

  Future<void> logPurchase({
    required double amount,
    required String currency,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      await _facebookAppEvents.logPurchase(
        amount: amount,
        currency: currency,
        parameters: parameters,
      );
    } catch (e) {
      print('Failed to log purchase: $e');
    }
  }

  Future<void> setUserId(String userId) async {
    try {
      await _facebookAppEvents.setUserID(userId);
    } catch (e) {
      print('Failed to set user ID: $e');
    }
  }

  Future<void> clearUserId() async {
    try {
      await _facebookAppEvents.clearUserID();
    } catch (e) {
      print('Failed to clear user ID: $e');
    }
  }

  Future<void> flush() async {
    try {
      await _facebookAppEvents.flush();
    } catch (e) {
      print('Failed to flush events: $e');
    }
  }
}


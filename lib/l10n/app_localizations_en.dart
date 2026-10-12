// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lab 7 - Localization';

  @override
  String get searchHint => 'Search city...';

  @override
  String get temperature => 'Temperature';

  @override
  String get windSpeed => 'Wind Speed';

  @override
  String get refresh => 'Pull down to refresh';

  @override
  String get startTyping => 'Start typing to search';

  @override
  String get liked => 'You liked';

  @override
  String get unliked => 'You unliked';
}

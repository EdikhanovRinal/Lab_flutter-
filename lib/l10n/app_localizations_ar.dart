// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'المختبر 7 - التعريب';

  @override
  String get searchHint => 'ابحث عن مدينة...';

  @override
  String get temperature => 'درجة الحرارة';

  @override
  String get windSpeed => 'سرعة الرياح';

  @override
  String get refresh => 'اسحب للأسفل للتحديث';

  @override
  String get startTyping => 'ابدأ الكتابة للبحث';

  @override
  String get liked => 'لقد أعجبك';

  @override
  String get unliked => 'لم يعجبك';
}

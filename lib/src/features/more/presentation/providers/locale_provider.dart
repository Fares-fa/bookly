import 'package:bookly/src/imports/imports.dart';

const _kLocaleCodeKey = 'locale_code';

/// The user's manually chosen app language, or `null` to follow the device
/// locale (the default until they pick one from the More screen).
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null) {
    _restore();
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_kLocaleCodeKey);
    if (code != null) state = Locale(code);
  }

  /// Pass `null` to go back to following the device locale.
  Future<void> setLocale(Locale? locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_kLocaleCodeKey);
    } else {
      await prefs.setString(_kLocaleCodeKey, locale.languageCode);
    }
  }
}

import 'dart:convert' show utf8;

class StringService {
  static String safeString(String string) {
    return utf8.decode(string.runes.toList());
  }
}

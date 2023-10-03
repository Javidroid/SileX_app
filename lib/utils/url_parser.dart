class UrlParserUtil {

  /// Tries to decode component. If error, returns raw string.
  static String tryDecodeUrl(String url) {
    try {
      return Uri.decodeComponent(url);
    } catch (e) {
      return url;
    }
  }
}

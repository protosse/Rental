extension StringExtension on String {
  String get transferred => replaceAll(r'\\n', '\n')
      .replaceAll(r'\n', '\n\n')
      .replaceAll(r'\r', '')
      .replaceAll(r"\'", "'");
}

class StringDecorator {
  final String string;

  StringDecorator(String this.string);

  StringDecorator toCamelCase() {
    if (string == null || string.isEmpty) {
      return StringDecorator(string);
    }

    var lowerCaseFirstLetter =
        (String s) => "${s[0].toLowerCase()}${s.substring(1)}";

    var upperCaseFirstLetterLowerCaseRest = (String s) =>
        s.isEmpty ? s : "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";

    String camelCasedString = string.splitMapJoin(RegExp("[\w_ ]+"),
        onMatch: (matchedSplitter) => "",
        onNonMatch: (nonMatch) => upperCaseFirstLetterLowerCaseRest(nonMatch));

    return StringDecorator(lowerCaseFirstLetter(camelCasedString));
  }

  @override
  String toString() => string;
}

main() {
  String capsString = "CAPS_STRING";
  StringDecorator camelCasedString = StringDecorator(capsString).toCamelCase();
  print("Converted $capsString into $camelCasedString");
}

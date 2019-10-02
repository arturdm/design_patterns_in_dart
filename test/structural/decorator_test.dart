import 'package:test_api/test_api.dart';

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

void main() {
  const testData = {
    null: null,
    "": "",
    "a": "a",
    "ALL_CAPS": "allCaps",
    " Mixed_case STRING": "mixedCaseString"
  };

  testData.forEach((input, expected) {
    test("should camel case '${input}' into '$expected'", () {
      StringDecorator decorator = StringDecorator(input);

      StringDecorator actual = decorator.toCamelCase();

      expect(actual.string, equals(expected));
    });
  });
}

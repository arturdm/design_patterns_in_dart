import 'package:design_patterns_in_dart/structural/decorator.dart';
import 'package:test_api/test_api.dart';

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

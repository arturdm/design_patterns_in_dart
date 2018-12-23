import 'package:design_patterns_in_dart/creational/factory_method.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("should create proper currency object", () {
    Currency currency = Currency.forCode("USD");
    expect(currency, TypeMatcher<Dollar>());
  });

  test("should throw if unsupported currency code provided", () {
    expect(() => Currency.forCode("EUR"), throwsArgumentError);
  });
}

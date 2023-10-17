import 'package:test/test.dart';

abstract class Currency {
  final String name;

  Currency._internal(String this.name);

  factory Currency.forCode(String code) {
    return switch (code) {
      "USD" => Dollar(),
      "CHF" => Frank(),
      _ => throw ArgumentError("Unsupported currency code provided: $code"),
    };
  }
}

class Dollar extends Currency {
  Dollar() : super._internal("US Dollar");
}

class Frank extends Currency {
  Frank() : super._internal("Swiss Frank");
}

void main() {
  test("should create proper currency object", () {
    Currency currency = Currency.forCode("USD");
    expect(currency, TypeMatcher<Dollar>());
  });

  test("should throw if unsupported currency code provided", () {
    expect(() => Currency.forCode("EUR"), throwsArgumentError);
  });
}

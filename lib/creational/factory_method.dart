abstract class Currency {
  final String name;

  Currency._internal(String this.name);

  factory Currency.forCode(String code) {
    switch (code) {
      case "USD":
        return Dollar();
      case "CHF":
        return Frank();
      default:
        throw ArgumentError("Unsupported currency code provided: $code");
    }
  }
}

class Dollar extends Currency {
  Dollar() : super._internal("US Dollar");
}

class Frank extends Currency {
  Frank() : super._internal("Swiss Frank");
}

void main() {
  Currency currency = Currency.forCode("USD");
  print("${currency.name} printed");
}

import 'package:test/test.dart';

class RegistrationNumber {
  String number;

  RegistrationNumber(String number) : number = number;

  RegistrationNumber.copy(RegistrationNumber other) : this(other.number);
}

void main() {
  group("copied registration", () {
    RegistrationNumber registration = RegistrationNumber("WA");

    RegistrationNumber copiedRegistration = RegistrationNumber.copy(registration);

    test("should have the same value", () {
      expect(copiedRegistration.number, equals(registration.number));
    });

    test("should be a different instance", () {
      expect(copiedRegistration, isNot(equals(registration)));
    });
  });
}

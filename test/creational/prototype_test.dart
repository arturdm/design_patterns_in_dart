import 'package:design_patterns_in_dart/creational/prototype.dart';
import 'package:test_api/test_api.dart';

void main() {
  group("copied registration", () {
    RegistrationNumber registration = RegistrationNumber("WA");

    RegistrationNumber copiedRegistration =
        RegistrationNumber.copy(registration);

    test("should have the same value", () {
      expect(copiedRegistration.number, equals(registration.number));
    });

    test("should be a different instance", () {
      expect(copiedRegistration, isNot(equals(registration)));
    });
  });
}

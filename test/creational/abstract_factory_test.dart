import 'package:design_patterns_in_dart/creational/abstract_factory.dart';
import 'package:test_api/test_api.dart';

void main() {
  group("petrol car factory", () {
    CarFactory factory = new PetrolCarFactory();

    test("should create a petrol car", () {
      Car car = factory.makeCar();

      expect(car, TypeMatcher<PetrolCar>());
    });
  });
}

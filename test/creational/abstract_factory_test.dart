import 'package:test/test.dart';

abstract class Car {}

class PetrolCar extends Car {}

class ElectricCar extends Car {}

abstract class CarFactory {
  Car makeCar();
}

class PetrolCarFactory extends CarFactory {
  @override
  Car makeCar() => PetrolCar();
}

class ElectricCarFactory extends CarFactory {
  @override
  Car makeCar() => ElectricCar();
}

void main() {
  group("petrol car factory", () {
    CarFactory factory = new PetrolCarFactory();

    test("should create a petrol car", () {
      Car car = factory.makeCar();

      expect(car, TypeMatcher<PetrolCar>());
    });
  });
}

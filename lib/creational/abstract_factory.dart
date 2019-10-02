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
  Car car = PetrolCarFactory().makeCar();
  print("Created a car of type ${car.runtimeType}");
}
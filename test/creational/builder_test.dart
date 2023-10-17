class Driver {
  final String? firstName;
  final String? lastName;

  Driver({this.firstName, this.lastName});

  @override
  String toString() => "$firstName $lastName";
}

// TODO Consider cascade (..) here
class DriverBuilder {
  String? _firstName;
  String? _lastName;

  DriverBuilder firstName(String firstName) {
    _firstName = firstName;
    return this;
  }

  DriverBuilder lastName(String lastName) {
    _lastName = lastName;
    return this;
  }

  Driver build() {
    return Driver(firstName: _firstName, lastName: _lastName);
  }
}

void main() {
  final driverBuilder = DriverBuilder().firstName("Robert").lastName("Kubica");

  print("${driverBuilder.build()}'s driver entry created");
}

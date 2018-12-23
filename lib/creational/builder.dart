class Driver {
  String firstName;
  String lastName;

  Driver({String this.firstName, String this.lastName});

  @override
  String toString() => "$firstName $lastName";
}

class DriverBuilder {
  String _firstName;
  String _lastName;

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
  DriverBuilder driverBuilder =
      DriverBuilder().firstName("Robert").lastName("Kubica");

  print("${driverBuilder.build()}'s driver entry created");
}

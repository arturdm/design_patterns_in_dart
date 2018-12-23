class RegistrationNumber {
  String number;

  RegistrationNumber(String number) : number = number;

  RegistrationNumber.copy(RegistrationNumber other) : this(other.number);
}

void main() {
  RegistrationNumber registration = RegistrationNumber("WF12345");
  RegistrationNumber copiedRegistration = RegistrationNumber.copy(registration);
  copiedRegistration.number = "WA98765";
  print("Original registration number is ${registration.number}");
  print("Copied registration number is ${copiedRegistration.number}");

  // TODO Find a way to print instance id
}

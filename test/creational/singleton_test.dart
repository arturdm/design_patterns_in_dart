import 'package:test/test.dart';

final Me me = Me._internal();

class Me {
  Me._internal() {
    print("I am being instantiated");
  }

  @override
  String toString() => "me";
}

void main() {
  print("I am not here yet, but");
  print("and now you can see $me.");

  test("should have access by global variable", () {
    expect(me, isNotNull);
    // Me._internal(); // not accessible
    // Me(); // no default constructor
  });
}

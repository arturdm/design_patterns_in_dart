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
}

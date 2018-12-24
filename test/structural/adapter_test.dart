import 'package:design_patterns_in_dart/structural/adapter.dart';
import 'package:test_api/test_api.dart';

void main() {
  Color color = Color.rgb(red: 0, green: 0, blue: 0);
  ColorName colorName = ColorNameAdapter(color);

  test("should return a reddish color name", () {
    color.red = 255;
    color.green = 0;
    color.blue = 0;

    expect(colorName.name(), equalsIgnoringCase("reddish"));
  });

  test("should return a greenish color is changed", () {
    color.red = 0;
    color.green = 255;
    color.blue = 0;

    expect(colorName.name(), equalsIgnoringCase("greenish"));
  });
}

class Color {
  int _red;
  int _green;
  int _blue;

  Color.rgb({int red, int green, int blue})
      : assert(0 <= red && red <= 255),
        assert(0 <= green && green <= 255),
        assert(0 <= blue && blue <= 255);

  int get red => _red;

  set red(int red) {
    _red = _assertInRange(red);
  }
  int get green => _green;

  set green(int green) {
    _green = _assertInRange(green);
  }
  int get blue => _blue;

  set blue(int blue) {
    _blue = _assertInRange(blue);
  }

  int _assertInRange(int color) {
    return 0 <= color && color <= 255 ? color : throw "color $color out of <0,255> range";
  }
}

abstract class ColorName {
  String name();
}

class ColorNameAdapter implements ColorName {
  Color color;

  ColorNameAdapter(this.color);

  @override
  String name() {
    if (color.red > color.blue && color.red > color.green) {
      return "reddish";
    } else if (color.green > color.red && color.green > color.blue) {
      return "greenish";
    } else if (color.blue > color.red && color.blue > color.green) {
      return "blueish";
    } else {
      return "greyish";
    }
  }
}

void printColorName(ColorName colorName) {
  print("The color is ${colorName.name()}.");
}

void main() {
  Color color = Color.rgb(red: 255, green: 0, blue: 0);
  ColorName colorName = ColorNameAdapter(color);
  printColorName(colorName); // The color is reddish.

  color.red = 0;
  color.blue = 255;
  printColorName(colorName); // The color is blueish.
}

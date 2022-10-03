import 'package:test/test.dart';

class TextField {
  int? backgroundColor;
  String? hint;
}

abstract class WebApplication {
  Theme theme;

  WebApplication(this.theme);

  TextField createLoginTextField();
}

class Blog extends WebApplication {
  Blog(Theme theme) : super(theme);

  @override
  TextField createLoginTextField() => TextField()
    ..backgroundColor = theme.backgroundColor()
    ..hint = "Please enter your blog login";
}

class NewsSite extends WebApplication {
  NewsSite(Theme theme) : super(theme);

  @override
  TextField createLoginTextField() => TextField()
    ..backgroundColor = theme.backgroundColor()
    ..hint = "Provide login to NewsSite";
}

abstract class Theme {
  int backgroundColor();
}

class LightTheme implements Theme {
  @override
  int backgroundColor() => 255;
}

class DarkTheme implements Theme {
  @override
  int backgroundColor() => 0;
}

typedef WebApplication AppGenerator(Theme theme);

class AppData {
  final String name;
  final AppGenerator appGenerator;
  final String expectedHint;

  AppData({required this.name, required this.appGenerator, required this.expectedHint});
}

class ThemeData {
  final String name;
  final Theme theme;
  final int expectedBackgroundColor;

  ThemeData({required this.name, required this.theme, required this.expectedBackgroundColor});
}

void main() {
  final appData = [
    AppData(
      name: "blog",
      appGenerator: ((Theme theme) => Blog(theme)),
      expectedHint: "Please enter your blog login",
    ),
    AppData(
      name: "news site",
      appGenerator: ((Theme theme) => NewsSite(theme)),
      expectedHint: "Provide login to NewsSite",
    ),
  ];

  final themeData = [
    ThemeData(
      name: "dark theme",
      theme: DarkTheme(),
      expectedBackgroundColor: 0,
    ),
    ThemeData(
      name: "light theme",
      theme: LightTheme(),
      expectedBackgroundColor: 255,
    ),
  ];

  appData.forEach((AppData appData) {
    group("login text field for ${appData.name}", () {
      themeData.forEach((ThemeData themeData) {
        group("and ${themeData.name}", () {
          WebApplication app = appData.appGenerator(themeData.theme);

          TextField field = app.createLoginTextField();

          test("should have proper color", () {
            expect(field.backgroundColor, equals(themeData.expectedBackgroundColor));
          });

          test("should have proper hint", () {
            expect(field.hint, equals(appData.expectedHint));
          });
        });
      });
    });
  });
}

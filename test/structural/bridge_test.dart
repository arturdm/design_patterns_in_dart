import 'package:design_patterns_in_dart/structural/bridge.dart';
import 'package:test_api/test_api.dart';

typedef WebApplication AppGenerator(Theme theme);

class AppData {
  String name;
  AppGenerator appGenerator;
  String expectedHint;
}

class ThemeData {
  String name;
  Theme theme;
  int expectedBackgroundColor;
}

void main() {
  var appData = [
    AppData()
      ..name = "blog"
      ..appGenerator = ((Theme theme) => Blog(theme))
      ..expectedHint = "Please enter your blog login",
    AppData()
      ..name = "news site"
      ..appGenerator = ((Theme theme) => NewsSite(theme))
      ..expectedHint = "Provide login to NewsSite"
  ];

  var themeData = [
    ThemeData()
      ..name = "dark theme"
      ..theme = DarkTheme()
      ..expectedBackgroundColor = 0,
    ThemeData()
      ..name = "light theme"
      ..theme = LightTheme()
      ..expectedBackgroundColor = 255
  ];

  appData.forEach((AppData appData) {
    group("login text field for ${appData.name}", () {
      themeData.forEach((ThemeData themeData) {
        group("and ${themeData.name}", () {
          WebApplication app = appData.appGenerator(themeData.theme);

          TextField field = app.createLoginTextField();

          test("should have proper color", () {
            expect(field.backgroundColor,
                equals(themeData.expectedBackgroundColor));
          });

          test("should have proper hint", () {
            expect(field.hint, equals(appData.expectedHint));
          });
        });
      });
    });
  });
}

class TextField {
  int backgroundColor;
  String hint;
}

abstract class WebApplication {
  Theme theme;

  WebApplication(Theme this.theme) : assert(theme != null);

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

main() {
  var blog = Blog(LightTheme());
  var field = blog.createLoginTextField();
  print(
      "blog created a field with '${field.hint}' hint and ${field.backgroundColor} color.");

  var darkBlog = Blog(DarkTheme());
  var darkField = darkBlog.createLoginTextField();

  print(
      "dark blog created a field with '${darkField.hint}' hint and ${darkField.backgroundColor} color.");
}

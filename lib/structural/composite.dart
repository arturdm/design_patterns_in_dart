abstract class Widget {}

class WidgetGroup implements Widget {
  final List<Widget> children;

  WidgetGroup({List<Widget> this.children});

  @override
  String toString() {
    String shiftedChildrenString = children.join("\n").replaceAll("\n", "\n\t");
    return "WidgetGroup\n\t${shiftedChildrenString}";
  }
}

class TextWidget implements Widget {
  final String text;

  const TextWidget(String this.text);

  @override
  String toString() => "TextWidget('$text')";
}

main() {
  Widget widget = WidgetGroup(children: [
    TextWidget("some text"),
    WidgetGroup(children: [TextWidget("more"), TextWidget("text")])
  ]);

  print(widget);
}

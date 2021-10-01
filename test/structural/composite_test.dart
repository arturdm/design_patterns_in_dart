import 'package:test/test.dart';

abstract class Widget {}

class WidgetGroup implements Widget {
  final List<Widget> children;

  const WidgetGroup({required this.children});

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

WidgetGroup createWidgetTree() => WidgetGroup(children: [
      TextWidget("some text"),
      WidgetGroup(children: [TextWidget("more"), TextWidget("text")])
    ]);

void main() {
  group("widget tree", () {
    test("should get a node", () {
      WidgetGroup tree = createWidgetTree();

      Widget first = tree.children.first;

      expect((first as TextWidget).text, equals("some text"));
    });

    test("should remove a node", () {
      WidgetGroup tree = createWidgetTree();

      tree.children.removeAt(0);

      expect(tree.children.length, equals(1));
    });

    test("should add a node", () {
      WidgetGroup tree = createWidgetTree();

      tree.children.add(TextWidget("footer text"));

      expect(tree.children.length, equals(3));
    });
  });
}

import 'package:design_patterns_in_dart/structural/composite.dart';
import 'package:test_api/test_api.dart';

Widget createWidgetTree() =>
    WidgetGroup(
        children: [
          TextWidget("some text"),
          WidgetGroup(
              children: [
                TextWidget("more"),
                TextWidget("text")
              ]
          )
        ]
    );

void main() {
  group("widget tree", () {
    test("should get a node", () {
      WidgetGroup tree = createWidgetTree();

      TextWidget first = tree.children.first;

      expect(first.text, equals("some text"));
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

import 'package:design_patterns_in_dart/behavioural/chain_of_responsibility.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api/test_api.dart';

class MockEventHandler extends Mock implements EventHandler {}

void main() {
  Widget tree;
  Event event = Event.move();
  EventHandler parentHandler;
  EventHandler childHandler;

  setUp(() {
    parentHandler = MockEventHandler();
    childHandler = MockEventHandler();
    tree = Widget(
        name: "parent",
        handler: parentHandler,
        child: Widget(name: "child", handler: childHandler));
  });

  test("should handle event by parent", () {
    // given
    when(parentHandler.handle(any, any)).thenReturn(true);
    when(childHandler.handle(any, any)).thenReturn(true);

    // when
    tree.handle(event);

    // then
    verify(parentHandler.handle(any, any)).called(equals(1));
    verifyNoMoreInteractions(childHandler);
  });

  test("should pass event to child", () {
    // given
    when(parentHandler.handle(any, any)).thenReturn(false);
    when(childHandler.handle(any, any)).thenReturn(true);

    // when
    tree.handle(event);

    // then
    verify(parentHandler.handle(any, any)).called(equals(1));
    verify(childHandler.handle(any, any)).called(equals(1));
  });
}

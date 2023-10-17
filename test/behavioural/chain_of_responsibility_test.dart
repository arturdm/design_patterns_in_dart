import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class Event {
  final EventType type;

  Event.click() : this(EventType.CLICK);

  Event.move() : this(EventType.MOVE);

  Event(this.type);

  @override
  String toString() => "${type}";
}

enum EventType { CLICK, MOVE }

abstract class EventHandler {
  bool handle(Widget widget, Event event);
}

class _DoNothingEventHandler implements EventHandler {
  @override
  bool handle(Widget widget, Event event) => false;
}

final EventHandler doNothingEventHandler = _DoNothingEventHandler();

class Widget {
  final String name;
  final Widget? child;
  final EventHandler handler;

  Widget({
    required this.name,
    this.child,
    EventHandler? handler,
  }) : this.handler = handler ?? doNothingEventHandler;

  /**
   * Handles [event].
   *
   * Returns [true] if event was handled and [false] otherwise.
   */
  bool handle(Event event) {
    bool wasHandled = handler.handle(this, event);
    return wasHandled || (child?.handle(event) ?? false);
  }

  @override
  String toString() => "$runtimeType(name: $name)";
}

class MockEventHandler extends Mock implements EventHandler {}

void main() {
  late Widget tree;
  Event event = Event.move();
  late EventHandler parentHandler;
  late EventHandler childHandler;

  setUp(() {
    parentHandler = MockEventHandler();
    childHandler = MockEventHandler();
    tree = Widget(
      name: "parent",
      handler: parentHandler,
      child: Widget(name: "child", handler: childHandler),
    );
    registerFallbackValue(tree);
    registerFallbackValue(event);
  });

  test("should handle event by parent", () {
    // given
    when(() => parentHandler.handle(any(), any())).thenReturn(true);
    when(() => childHandler.handle(any(), any())).thenReturn(true);

    // when
    tree.handle(event);

    // then
    verify(() => parentHandler.handle(any(), any())).called(equals(1));
    verifyNoMoreInteractions(childHandler);
  });

  test("should pass event to child", () {
    // given
    when(() => parentHandler.handle(any(), any())).thenReturn(false);
    when(() => childHandler.handle(any(), any())).thenReturn(true);

    // when
    tree.handle(event);

    // then
    verify(() => parentHandler.handle(any(), any())).called(equals(1));
    verify(() => childHandler.handle(any(), any())).called(equals(1));
  });
}

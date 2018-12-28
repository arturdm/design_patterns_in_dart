import 'package:meta/meta.dart';

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
  final Widget child;
  final EventHandler handler;

  Widget({@required this.name, this.child, EventHandler handler})
      : this.handler = handler ?? doNothingEventHandler;

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

bool printAndPass(Widget widget, Event event) {
  print("$widget did not handle $event");
  return false;
}

bool printAndHandle(Widget widget, Event event) {
  print("$widget handled $event");
  return true;
}

class FunctionEventHandler implements EventHandler {
  final Function handler;

  FunctionEventHandler(this.handler) : assert(handler != null);

  @override
  bool handle(Widget widget, Event event) => handler(widget, event);
}

main() {
  Widget tree = Widget(
      name: "parent",
      handler: FunctionEventHandler(printAndPass),
      child: Widget(
          name: "child",
          handler: FunctionEventHandler(printAndHandle),
          child: Widget(
              name: "leaf", handler: FunctionEventHandler(printAndHandle))));

  final event = Event.click();
  tree.handle(event); // the event is passed to parent and child but not to leaf
}

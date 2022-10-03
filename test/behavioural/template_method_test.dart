import 'package:meta/meta.dart';

enum LifecycleEvent {
  mouseClick,
  keyPress,
  stop,
}

abstract class AppLifecycle {
  @nonVirtual
  void run(List<LifecycleEvent> events) {
    init();
    for (final event in events) {
      final shouldStop = !processLifecycleEventsWhileTrue(event);
      if (shouldStop) {
        break;
      }
    }
    dispose();
  }

  @mustCallSuper
  void init() {
    // empty default implementation
  }

  bool processLifecycleEventsWhileTrue(LifecycleEvent lifecycleEvent);

  @mustCallSuper
  void dispose() {
    // empty default implementation
  }
}

class InstantlyClosingApp extends AppLifecycle {
  @override
  bool processLifecycleEventsWhileTrue(LifecycleEvent lifecycleEvent) {
    return false;
  }
}

class ProperApp extends AppLifecycle {
  @override
  void init() {
    super.init();
    print('Initializing proper app');
  }

  @override
  bool processLifecycleEventsWhileTrue(LifecycleEvent lifecycleEvent) {
    print('Processing lifecycle event $lifecycleEvent');
    if (lifecycleEvent == LifecycleEvent.stop) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    print('Disposing proper app');
    super.dispose();
  }
}

void main() {
  const events = [
    LifecycleEvent.keyPress,
    LifecycleEvent.stop,
    LifecycleEvent.mouseClick,
  ];

  final AppLifecycle instantlyClosingApp = InstantlyClosingApp();
  instantlyClosingApp.run(events);

  final AppLifecycle properApp = ProperApp();
  properApp.run(events);
}

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

abstract class Observer {
  void notify(String topic);
}

abstract class Subject {
  void notifyObservers(String topic);

  void addObserver(Observer observer);
}

class YoutubeChannel implements Subject {
  final Set<Observer> _observers = {};

  @override
  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void notifyObservers(String topic) {
    _observers.forEach((observer) {
      observer.notify(topic);
    });
  }
}

class Subscriber extends Mock implements Observer {}

void main() {
  test('should notify subscribers about a new video', () {
    // given
    final youtubeChannel = YoutubeChannel();
    final subscriber = Subscriber();
    youtubeChannel.addObserver(subscriber);

    // when
    youtubeChannel.notifyObservers('watch our new video!');

    // then
    verify(() => subscriber.notify('watch our new video!')).called(equals(1));
  });
}

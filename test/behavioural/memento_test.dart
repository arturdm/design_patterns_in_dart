import 'package:test/test.dart';

class Snapshot {
  final String text;

  const Snapshot(this.text);
}

class Document {
  String text = '';

  Snapshot save() => Snapshot(text);

  void restore(Snapshot snapshot) {
    text = snapshot.text;
  }
}

class Editor {
  final Document _document;
  List<Snapshot> _history = [];

  Editor(this._document);

  void appendText(String text) {
    final snapshot = _document.save();
    _history.add(snapshot);
    _document.text += text;
  }

  void undo() {
    if (_history.isEmpty) {
      return;
    }
    final snapshot = _history.removeLast();
    _document.text = snapshot.text;
  }
}

void main() {
  test('should save and restore text from snapshot', () {
    // given
    final document = Document();
    final editor = Editor(document);

    // expect
    expect(document.text, isEmpty);
    editor.appendText('First paragraph');
    expect(document.text, equals('First paragraph'));
    editor.appendText('\nSecond paragraph');
    expect(document.text, equals('First paragraph\nSecond paragraph'));
    editor.undo();
    expect(document.text, equals('First paragraph'));
    editor.undo();
    expect(document.text, isEmpty);
  });

  test('should do nothing if cannot undo', () {
    // given
    final document = Document();
    final editor = Editor(document);

    // expect
    expect(document.text, isEmpty);
    editor.undo();
    expect(document.text, isEmpty);
  });
}

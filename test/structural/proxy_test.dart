import 'dart:mirrors';

import 'package:test/test.dart';

class UnmodifiableSet<E> implements Set<E> {
  static final unsupported =
      UnsupportedError("This method is not supported on unmodifiable set");

  final InstanceMirror _delegateMirror;

  UnmodifiableSet.unmodifiable(Set<E> set) : _delegateMirror = reflect(set);

  @override
  bool add(E value) => throw unsupported;

  @override
  void clear() => throw unsupported;

  @override
  void retainWhere(bool test(E element)) => throw unsupported;

  @override
  void removeWhere(bool test(E element)) => throw unsupported;

  @override
  void retainAll(Iterable<Object?> elements) => throw unsupported;

  @override
  void removeAll(Iterable<Object?> elements) => throw unsupported;

  @override
  bool remove(Object? value) => throw unsupported;

  @override
  void addAll(Iterable<E> elements) => throw unsupported;

  @override
  String toString() => _delegateMirror.reflectee.toString();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return _delegateMirror.delegate(invocation);
  }
}

void main() {
  late Set<int> unmodifiableSet;

  setUp(() {
    Set<int> mutableSet = Set.of([1, 2, 3]);
    unmodifiableSet = UnmodifiableSet.unmodifiable(mutableSet);
  });

  test("should contain value", () {
    expect(unmodifiableSet.contains(1), isTrue);
  });

  test("should calculate difference", () {
    expect(unmodifiableSet.difference(Set.of([2, 3, 4])), equals(Set.of([1])));
  });

  test("should throw when adding", () {
    expect(() => unmodifiableSet.add(4), throwsUnsupportedError);
  });

  test("should throw when clearing", () {
    expect(() => unmodifiableSet.clear(), throwsUnsupportedError);
  });
}

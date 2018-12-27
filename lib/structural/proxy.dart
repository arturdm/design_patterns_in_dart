import 'dart:mirrors';

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
  void retainAll(Iterable<Object> elements) => throw unsupported;

  @override
  void removeAll(Iterable<Object> elements) => throw unsupported;

  @override
  bool remove(Object value) => throw unsupported;

  @override
  void addAll(Iterable<E> elements) => throw unsupported;

  @override
  String toString() => _delegateMirror.reflectee.toString();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return _delegateMirror.delegate(invocation);
  }
}

main() {
  Set<int> set = Set.of([1, 2, 3]);
  Set<int> unmodifiableSet = UnmodifiableSet.unmodifiable(set);

  print("unmodifiableSet has '${unmodifiableSet.elementAt(0)}' at index 0");

  try {
    unmodifiableSet.add(1);
  } catch (e) {
    print("${e.runtimeType} thrown while trying to add to ${unmodifiableSet}");
  }
}

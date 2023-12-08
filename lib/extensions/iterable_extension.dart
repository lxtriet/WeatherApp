extension IndexedIterable<E> on Iterable<E>? {
  E? firstOrDefault([bool Function(E element)? test]) {
    if (this == null) return null;
    if (test == null) {
      Iterator<E> it = this!.iterator;
      if (!it.moveNext()) {
        return null;
      }
      return it.current;
    }
    for (E element in this!) {
      if (test(element)) return element;
    }
    return null;
  }
}

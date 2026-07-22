extension ListExtensions<T> on List<T> {
  ///Use this method to get index with list where method
  Iterable<T> whereWithIndex(bool test(T element, int index)) {
    final List<T> result = [];
    for (var i = 0; i < this.length; i++) {
      if (test(this[i], i)) {
        result.add(this[i]);
      }
    }
    return result;
  }
}

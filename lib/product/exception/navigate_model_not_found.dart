class NavigateException<T> implements Exception {
  final dynamic model;

  NavigateException(this.model);
  @override
  String toString() {
    return "This model variable does not found in root $model and  $T";
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String firstCharUppcase() {
    return this[0].toUpperCase();
  }

  bool toBoolean() {
    if (toLowerCase() == true.toString()) {
      return true;
    } else {
      if (this == 1.toString()) {
        return true;
      }
    }

    //defaulted case
    return false;
  }
}

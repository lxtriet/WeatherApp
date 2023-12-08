extension StringExtensions on String? {
  String capitalizeByWord() {
    if (this == null || this!.isEmpty) return '';
    return this!
        .split(' ')
        .map((element) =>
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(" ");
  }
}

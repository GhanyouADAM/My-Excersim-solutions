class AtbashCipher {
String encode(String words) {
  final lowCase = words.toLowerCase();
  final regex = RegExp(r'[^a-z0-9]');
  final brutText = lowCase.replaceAll(regex, '');
  final letters = brutText.split('');
  final List<String> newList = [];

  //the actual encoder
  for (var letter in letters) {
    if (int.tryParse(letter) != null) {
      newList.add(letter);
    } else {
      final newCodeUnit =
          ('a'.codeUnitAt(0) + ('z'.codeUnitAt(0) - letter.codeUnitAt(0)));
      letter = String.fromCharCode(newCodeUnit);
      newList.add(letter);
    }
  }

  //grouping in five
  final lettersByFive = Iterable.generate((newList.length / 5).ceil(), (index) {
    return newList
        .sublist(
          index * 5,
          ((index * 5) + 5 > newList.length) ? newList.length : (index * 5) + 5,
        )
        .join("");
  }).toList().join(" ");

  return lettersByFive;
}

String decode(String code) {
  final regex = RegExp(r' ');
  final spacesRemovedCode = code.replaceAll(regex, '').split('');
  final newList = [];

  //the actual encoder
  for (var letter in spacesRemovedCode) {
    if (int.tryParse(letter) != null) {
      newList.add(letter);
    } else {
      final newCodeUnit =
          ('a'.codeUnitAt(0) + ('z'.codeUnitAt(0) - letter.codeUnitAt(0)));
      letter = String.fromCharCode(newCodeUnit);
      newList.add(letter);
    }
  }
  final result = newList.join('');

  return result;
}
}

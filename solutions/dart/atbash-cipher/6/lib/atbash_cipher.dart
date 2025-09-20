class AtbashCipher {
  /// This function applies the Atbash cipher transformation to a list of characters.
  List<String> atbashKey(List<String> letters) {
    List<String> newList = [];

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

    return newList;
  }

  // group letters by five
  String groupByFive(List<String> separatedLetters) {
    final lettersByFive = Iterable.generate(
      (separatedLetters.length / 5).ceil(),
      (index) {
        return separatedLetters
            .sublist(
              index * 5,
              ((index * 5) + 5 > separatedLetters.length)
                  ? separatedLetters.length
                  : (index * 5) + 5,
            )
            .join("");
      },
    ).toList().join(" ");

    return lettersByFive;
  }

  String encode(String words) {
    final lowCase = words.toLowerCase();
    final regex = RegExp(r'[^a-z0-9]');
    final letters = lowCase.replaceAll(regex, '').split('');

    // the actual encoder
    final newList = atbashKey(letters);

    // grouping in five
    final lettersByFive = groupByFive(newList);

    return lettersByFive;
  }

  String decode(String code) {
    final regex =  RegExp(r'[^a-z0-9]'); //<----- apply same regex as encode
    final spacesRemovedCode = code.replaceAll(regex, '').split('');

    // the actual encoder
    final newList = atbashKey(spacesRemovedCode);

    final result = newList.join('');

    return result;
  }
}

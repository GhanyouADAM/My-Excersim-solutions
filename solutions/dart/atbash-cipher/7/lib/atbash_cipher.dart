class AtbashCipher {
  /// This function applies the Atbash cipher transformation to a list of characters.
  List<String> atbashKey(String letters) {
    final lowCase = letters.toLowerCase();
    final regex = RegExp(r'[^a-z0-9]');
    final splitLetters = lowCase.replaceAll(regex, '').split('');
    List<String> newList = [];

    for (var letter in splitLetters) {
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

  String encode(String words) => groupByFive(atbashKey(words));
  String decode(String code) => atbashKey(code).join('');
}

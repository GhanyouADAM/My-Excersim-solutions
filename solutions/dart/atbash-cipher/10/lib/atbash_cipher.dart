class AtbashCipher {
  // a function to apply the core method of atbash cipher
  String atbashCore(String letter) => String.fromCharCode(
    ('a'.codeUnitAt(0) + ('z'.codeUnitAt(0) - letter.codeUnitAt(0))),
  );

  /// This function applies the Atbash cipher transformation to a list of characters.
  List<String> atbashKey(String letters) => letters
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9]'), '')
      .split('')
      .map(
        (letter) => int.tryParse(letter) != null ? letter : atbashCore(letter),
      )
      .toList();

  // group letters by five
  String groupByFive(List<String> separatedLetters) => Iterable.generate(
    (separatedLetters.length / 5).ceil(),
    (index) => separatedLetters
        .sublist(
          index * 5,
          ((index * 5) + 5 > separatedLetters.length)
              ? separatedLetters.length
              : (index * 5) + 5,
        )
        .join(""),
  ).toList().join(" "); //<--- same refactoring on this method

  String encode(String words) => groupByFive(atbashKey(words));
  String decode(String code) => atbashKey(code).join('');
}

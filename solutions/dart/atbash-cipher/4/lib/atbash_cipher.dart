class AtbashCipher {
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

  String encode(String words) {
    final lowCase = words.toLowerCase();
    final regex = RegExp(r'[^a-z0-9]');
    final letters = lowCase
        .replaceAll(regex, '')
        .split(''); // <---- previously brutText becomes lettes

    //the actual encoder
    final newList = atbashKey(letters); //<---- refactoring here

    //grouping in five
    final lettersByFive = Iterable.generate((newList.length / 5).ceil(), (
      index,
    ) {
      return newList
          .sublist(
            index * 5,
            ((index * 5) + 5 > newList.length)
                ? newList.length
                : (index * 5) + 5,
          )
          .join(""); //<---- changing here in iteration 2
    }).toList().join(" "); // <----changing here too in iteration 2

    return lettersByFive;
  }

  String decode(String code) {
    final regex = RegExp(r' ');
    final spacesRemovedCode = code.replaceAll(regex, '').split('');

    //the actual encoder
    final newList = atbashKey(spacesRemovedCode); //<----- refactoring here too

    final result = newList.join('');

    return result;
  }
}


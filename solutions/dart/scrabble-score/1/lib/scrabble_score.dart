final List<String> one = ['a', 'e', 'l', 'o', 'u', 'i', 'n', 'r', 's', 't'];
final List<String> two = ['d', 'g'];
final List<String> three = ['b', 'c', 'm', 'p' ];
final List<String> four = ['f', 'h', 'v', 'w', 'y'];
final List<String> eight = ['j', 'x'];
final List<String> ten = ['q', 'z'];

int scoreGenerator(String letter){
    if (one.contains(letter)) {
      return 1;
    }else if(two.contains(letter)){
      return 2;
    }else if(three.contains(letter)){
      return 3;
    }else if(four.contains(letter)){
      return 4;
    }else if(letter == 'k'){
      return 5;
    }else if(eight.contains(letter)) {
      return 8;
    }else if(ten.contains(letter)){
      return 10;
    }else{
      return 0;
    }

}

int score(String word) {
  List<String> split = word.toLowerCase().split('');
  final List<int> scores = [];
  int sum = 0;
  for(var test in split){
    scores.add(scoreGenerator(test));
  }

 for (var s in scores) {
   sum += s;
 }
 return sum;
}



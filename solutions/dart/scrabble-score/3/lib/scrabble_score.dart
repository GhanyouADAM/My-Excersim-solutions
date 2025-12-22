
//we got rid of all the list for a dedicated collection which serve as the score table
final Map<List<String>, int> scoreTable = {
 ['a', 'e', 'l', 'o', 'u', 'i', 'n', 'r', 's', 't']  : 1,
 ['d', 'g'] : 2,
  ['b', 'c', 'm', 'p' ] : 3,
  ['f', 'h', 'v', 'w', 'y'] : 4,
  ['k'] : 5,
  ['j', 'x'] : 8,
  ['q', 'z'] : 10
};

int scoreGenerator(String letter){
  int letterScore = 0;

  //now we iterate once and have to use only one condition since we already know the point of each letter !
    for(final letters in scoreTable.keys){
      if (letters.contains(letter)) {
         letterScore = scoreTable[letters]!;
         break;
      }
    }
     return letterScore;
}
  
  //nothing change here...
int score(String word) {
  List<String> split = word.toLowerCase().split('');
  int sum = 0;
  for(var test in split){
    sum += scoreGenerator(test);
  }
 return sum;
}


void main(){
  final result = score('quirky');
  print('$result');
}
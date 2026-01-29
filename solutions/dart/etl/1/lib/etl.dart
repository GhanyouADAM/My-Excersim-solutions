class Etl {
  Map<String, int> transform(Map<String, List<String>> oldCollection){
  Map<String, int> scoreCollection = {
};
  for(var entries in oldCollection.entries){
   for(final letter in entries.value){
      scoreCollection[letter.toLowerCase()] = int.parse(entries.key);
    }
  }
  return scoreCollection;
}

}

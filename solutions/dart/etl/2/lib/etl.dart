class Etl {
  Map<String, int> transform(Map<String, List<String>> oldCollection){
  Map<String, int> newCollection = {};
    
  for(final entries in oldCollection.entries){
   for(final letter in entries.value){
      newCollection[letter.toLowerCase()] = int.parse(entries.key);
    }
  }
  return newCollection;
}

}

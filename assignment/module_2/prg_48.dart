// Create a program using Map

void main() {
  // Creating a map with key-value pairs
  Map<String, int> ageMap = {
    'Aesha': 30,
    'Khushi': 25,
    'Nikita': 35,
    'Sapana':65,
  };

  // Accessing values using keys
  print('Aesha\'s age is ${ageMap['Aesha']}');
  print('Khushi\'s age is ${ageMap['Khushi']}');

  // Adding a new key-value pair
  ageMap['Madhuri'] = 40;

  // Iterating over the map
  ageMap.forEach((key, value) {
    print('$key is $value years old');
  });

  // Checking if a key exists in the map
  if (ageMap.containsKey('Aesha')) {
    print('Aesha is in the map');
  }

  // Removing a key-value pair
  ageMap.remove('Sapana');

  // Checking the length of the map
  print('Number of people in the map: ${ageMap.length}');
}

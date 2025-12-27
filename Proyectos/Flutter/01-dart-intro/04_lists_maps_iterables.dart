void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 6, 7, 7];
  print('list original $numbers');
  print('length ${numbers.length}');
  print('index 0 ${numbers[0]}');
  print('first: ${numbers.first}');
  print('Reversed ${numbers.reversed}');

  final reversedNumbers = numbers.reversed;
  print('iterable: $reversedNumbers');
  print('iterable: ${reversedNumbers.toList()}');
  print('iterable: ${reversedNumbers.toSet()}');

  final numbersGreaterThan5 = numbers.where((int num) {
    return num > 5; //true
  });

  print('>5: $numbersGreaterThan5');
  print('>5: ${numbersGreaterThan5.toSet()}');
}

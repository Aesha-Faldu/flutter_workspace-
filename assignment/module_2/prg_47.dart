// 47. Create a program using Set
void main(){

  Set<int> numbers = Set.from([22,10,27,5]);
  print("$numbers");

  numbers.addAll([20,04,18]);
  print("adding value in number set:$numbers");

  numbers.remove([5]);
  print("Removing value in number set:$numbers");

  numbers.isEmpty;
  print("number list is empty");

}

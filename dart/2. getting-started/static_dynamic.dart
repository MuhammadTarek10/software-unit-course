int multiplyStatic(int a, int b) {
  return a * b;
}

dynamic multiplyDynamic(int a, int b) {
  return a * b;
}

void main() {
  int number1 = 2;
  int number2 = 5;

  int staticNumber = multiplyStatic(number1, number2);
  int dynamicNumber = multiplyDynamic(number1, number2);

  print("Static Number: $staticNumber | Type: ${staticNumber.runtimeType}");
  print("Dynamic Number: $dynamicNumber | Type: ${dynamicNumber.runtimeType}");
}

import 'dart:io';

void main() {
  stdout.write("Enter one number: ");
  final number1 = stdin.readLineSync();
  stdout.write("Enter another number: ");
  final number2 = stdin.readLineSync();
  stdout.write("Enter operator: ");
  final operator = stdin.readLineSync();

  if (operator == "+") {
    print(add(
        double.parse(number1.toString()), double.parse(number2.toString())));
  } else if (operator == "-") {
    print(subtract(
        double.parse(number1.toString()), double.parse(number2.toString())));
  } else if (operator == "*") {
    print(multiply(
        double.parse(number1.toString()), double.parse(number2.toString())));
  } else if (operator == "/") {
    print(divide(
        double.parse(number1.toString()), double.parse(number2.toString())));
  } else if (operator == "/") {
    print(divide(
        double.parse(number1.toString()), double.parse(number2.toString())));
  } else
    print("Invalid Operator");
}

double add(double num1, double num2) {
  return num1 + num2;
}

double subtract(double num1, double num2) {
  return num1 - num2;
}

double multiply(double num1, double num2) {
  return num1 * num2;
}

double divide(double num1, double num2) {
  return num1 / num2;
}

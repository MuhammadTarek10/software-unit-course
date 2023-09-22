class Stack<T> {
  Stack() : _storage = <T>[];
  final List<T> _storage;

  T pop() {
    if (_storage.isEmpty) {
      print("Stack Empty");
    }
    return _storage.removeLast();
  }

  void push(T value) {
    _storage.add(value);
  }

  @override
  String toString() {
    return _storage.toString();
  }
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> reversed = [];
  print("Array: $arr");

  Stack<int> stack = Stack<int>();
  for (int i = 0; i < arr.length; i++) {
    stack.push(arr[i]);
  }
  print("Stack After Push: ${stack.toString()}");

  for (int i = 0; i < arr.length; i++) {
    reversed.add(stack.pop());
  }

  print("Stack After Pop: ${stack.toString()}");
  print("Reversed Array: $reversed");
}

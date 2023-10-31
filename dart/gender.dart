import 'dart:io';

void choose(List gender, int index) {
  for (int i = 0; i < gender.length; i++) {
    gender[i] = false;
  }
  gender[index] = true;
  stdout.write(gender);
}

void main() {
  // * Male / Female
  List gender = [true, true, true, false];
  choose(gender, 3);
}

import 'dart:io';

void main() => performTasks();

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task1 data';
  print('Task 1 complete');
}

void task2() {
  Duration threeSeconds = Duration(seconds: 3);
  sleep(threeSeconds);
  String result = 'task2 data';
  print('Task 2 complete');
}

void task3() {
  String result = 'task3 data';
  print('Task 3 complete');
}

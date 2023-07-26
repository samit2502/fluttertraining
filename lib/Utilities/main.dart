import 'dart:io';
import 'overtime_salary.dart';

void main() {
  var finalPayment = 0;
  var os = OvertimeSalary();
  print("Enter the number of hours worked per day: ");
  int? hours = int.parse(stdin.readLineSync()!);
  print("Enter the number of days: ");
  int? days = int.parse(stdin.readLineSync()!);
  var totalPayment = os.getOverTime(hours, days);
  if(totalPayment > 100000){
    finalPayment = totalPayment - 10000;
    print("Final Payment after tax is $finalPayment");
  } else {
    print("Final Payment is $finalPayment");
  }
}
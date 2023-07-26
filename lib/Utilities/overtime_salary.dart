import 'dart:io';

class OvertimeSalary{
  getOverTime(int? hours, int? days) {
    var totalHours = 176;
    var finalPayment = 0;
    int? perHourPayment = 1500;
    int? totalPayment = 0;
    var totalHoursWorked = hours! * days!;
    if(totalHoursWorked > totalHours) {
      var diffHours = totalHoursWorked - totalHours;
      var extraPayment = diffHours * 1600;
      totalPayment = (8 * 22 * perHourPayment) + extraPayment;
    } else {
      totalPayment = hours! * days! * perHourPayment;
    }
    return totalPayment;
  }
}
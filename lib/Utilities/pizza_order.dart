import 'dart:io';

pizzaOrder() {
  print("Enter the Size of Pizza from S, M & L: ");
  String? size = stdin.readLineSync();
  print("The Size Selected is $size");
  print("Enter the Quantity: ");
  int qty = int.parse(stdin.readLineSync()!);
  print("The quantity selected is $qty");
  var totalPrice = 0;
  switch(size?.toLowerCase()){
    case "l": {
      totalPrice = qty * 10;
    }
    break;
    case "m": {
      totalPrice = qty * 5;
    }
    break;
    case "s": {
      totalPrice = qty * 2;
    }
    break;
    default: {
      totalPrice = 0;
    }
    break;
  }
  print("The total price is $totalPrice");
}

void main(){
  pizzaOrder();
}
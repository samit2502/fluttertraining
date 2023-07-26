Future<String> getData() {
  return Future.delayed(const Duration(seconds: 5), () {
    throw "Server not responded";
  });
}

void main() {
  print("main fun");
  getData().then((value) {
    print(value);
  });
  print("other part of the program is executing");
}

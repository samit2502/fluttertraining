class Tiger {
  Tiger(String city) {
    print("tiger city is $city");
  }
  Tiger.customCon(int id, String country) {
    print("tiger id is $id and country is $country");
  }

  Tiger.customCon1(int num, String state) {
    print("tiger id is $num and country is $state");
  }
  var name = "TIGER";
  var age = 22;

  eating() {
    print("tiger eating");
  }
}

// void main() {
//   var tiger = Tiger("blore");
//   var tig = Tiger.customCon(101, "INDIA");
// }

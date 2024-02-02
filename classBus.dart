import 'dart:io';

import 'main.dart';

abstract class Bus {
   String busName = "";
   String busType = "";
//-------------------------------------------------

//Crate bus ---------------------------------------
  List<String> createBus() {
    print("Please enter your bus name: ");
    print("0 -> exit");
    String? bus_name = stdin.readLineSync();
    bus_name = bus_name!.trim();
    while (bus_name == "") {
      print("You entered a wrong name\nPlease enter your bus name:\n0 -> Exit");
      bus_name = stdin.readLineSync();
      bus_name = bus_name!.trim();
    }

    if (bus_name != "0") {
      print("Please enter your bus type:\n0 -> exit\n1)Normal\n2)VIP");
      String? num = stdin.readLineSync();
      if (num == "0") {
        main();
      }
      else if (num == "1") {
        busName = bus_name!;
        busType = "Normal";
      }
      else if (num == "2") {
        busName = bus_name!;
        busType = "VIP";
      }
      else {
        while (num != "0" && num != "1" && num != "2") {
          print("You entered a wrong number\nPlease enter your bus type:\n0 -> exit\n1)Normal\n2)VIP");
          num = stdin.readLineSync();
        }
        if (num == "0") {
          main();
        }
        else if (num == "1") {
          busName = bus_name!;
          busType = "Normal";
        }
        else if (num == "2") {
          busName = bus_name!;
          busType = "VIP";
        }
      }
    }
    return [busName, busType];
  }
}

import 'dart:io';

import 'classBus.dart';

class Trip extends Bus {
  List<String> busNames = [];//Exp:"Bus Name"

  List<String> busTypes = [];//Exp:"Bus Type"

  List<String> bus = [];//Exp:"Bus Name"

  List<String> trips = [];//Exp:"Type^BusName^Mabda^Mahsad^Gheymat"

  List<String> ticket = [];//Exp:"Type^BusName^Mabda^Maghsad^Gheymat^ShomareSandali^Order"

  List<String> reservedSeats = [];//Exp:"BusName^Type^shomareSandali"

  List<String> boughtSeats = [];//Exp:"BusName^Type^shomareSandali"

  List<String> cancelBought = [];

  List <String> cancelReserved = [];

  String bname = "";//Exp:"Bus Name"


  void addBus(String bn, String bt) {

    busNames.add(bn);
    busTypes.add(bt);
    print("Your bus added successfully ");
  }

  String checkSeat(String type, String name, int s) {
    String seat = "";
    for (int c = 0; c < reservedSeats.length; c++) {

      if ((reservedSeats[c].split('-')[1] == type && reservedSeats[c].split('-')[0] == name)) {
        if ("$s" == reservedSeats[c].split('-')[2]) {
          seat = "rr";
        }
      }
    }
    for (int c = 0; c < boughtSeats.length; c++) {
      if ((boughtSeats[c].split('-')[1] == type && boughtSeats[c].split('-')[0] == name)) {
        if ("$s" == boughtSeats[c].split('-')[2]) {
          seat = "bb";
        }
      }
    }
    return seat;
  }

  String checkCancelSeat(String type, String name, int s) {
    String seat = "";
    for (int c = 0; c < reservedSeats.length; c++) {

      if ((reservedSeats[c].split('-')[1] == type && reservedSeats[c].split('-')[0] == name)) {
        if ("rr" == reservedSeats[c].split('-')[2]) {
          seat = "$s";
        }
      }
    }
    for (int c = 0; c < boughtSeats.length; c++) {
      if ((boughtSeats[c].split('-')[1] == type && boughtSeats[c].split('-')[0] == name)) {
        if ("bb" == boughtSeats[c].split('-')[2]) {
          seat = "$s";
        }
      }
    }
    return seat;
  }

  void normalDisplay() {
    int s = 1;
    for (int j = 0; j < 3; j++) {
      if (j % 2 == 0) {
        for (int i = 0; i < 5; i++) {
          for (int x = 0; x < 2; x++) {
            for (int z = 0; z < 2; z++) {
              String seat = checkSeat("Normal", bname, s);
              if (seat == "") {
                if (s < 10) {
                  stdout.write("0$s ");
                  s++;
                } else {
                  stdout.write("$s ");
                  s++;
                }
              } else {
                stdout.write("$seat ");
                s++;
              }
            }
            stdout.write(" ");
          }
          if (i != 4) {
            stdout.write("\n");
          }
        }
      } else {
        for (int i = 0; i < 2; i++) {
          stdout.write("\n");
          for (int x = 0; x < 2; x++) {
            String seat = checkSeat("Normal", bname, s);
            if (seat == "") {
              stdout.write("$s ");
              s++;
            } else {
              stdout.write("$seat ");
              s++;
            }
          }
        }
        stdout.write("\n");
      }
    }
    stdout.write("\n");
  }

  void vipDisplay() {
    int s = 1;
    for (int j = 0; j < 3; j++) {
      if (j == 0) {
        for (int i = 0; i < 5; i++) {
          for (int x = 0; x < 2; x++) {
            if (x == 0) {
              String seat = checkSeat("VIP", bname, s);
              if (seat == "") {
                if (s < 10) {
                  stdout.write("0$s ");
                  s++;
                } else {
                  stdout.write("$s ");
                  s++;
                }
              } else {
                stdout.write("$seat ");
                s++;
              }
            } else {
              for (int z = 0; z < 2; z++) {
                String seat = checkSeat("VIP", bname, s);
                if (seat == "") {
                  if (s < 10) {
                    stdout.write("0$s ");
                    s++;
                  } else {
                    stdout.write("$s ");
                    s++;
                  }
                } else {
                  stdout.write("$seat ");
                  s++;
                }
              }
            }
          }
          stdout.write(" ");
          if (i != 4) {
            stdout.write("\n");
          }
        }
      } else if (j == 1) {
        for (int i = 0; i < 3; i++) {
          String seat = checkSeat("VIP", bname, s);
          if (seat == "") {
            stdout.write("\n$s");
            s++;
          } else {
            stdout.write("\n$seat");
            s++;
          }
        }
        stdout.write("\n");
      } else {
        for (int i = 0; i < 4; i++) {
          for (int x = 0; x < 2; x++) {
            if (x == 0) {
              String seat = checkSeat("VIP", bname, s);
              if (seat == "") {
                if (s < 10) {
                  stdout.write("0$s ");
                  s++;
                } else {
                  stdout.write("$s ");
                  s++;
                }
              } else {
                stdout.write("$seat ");
                s++;
              }
            } else {
              for (int z = 0; z < 2; z++) {
                String seat = checkSeat("VIP", bname, s);
                if (seat == "") {
                  if (s < 10) {
                    stdout.write("0$s ");
                    s++;
                  } else {
                    stdout.write("$s ");
                    s++;
                  }
                } else {
                  stdout.write("$seat ");
                  s++;
                }
              }
            }
          }
          stdout.write(" ");
          if (i != 4) {
            stdout.write("\n");
          }
        }
      }
    }
    stdout.write("\n");
  }

  void createTrip() {

    if (busNames.isEmpty) {
      print("The bus has not been registered yet!");
      return;
    }
    String trip = "";
    print("Enter the bus type:\n0 -> exit\n1: Normal\n2: VIP");
    String? temp = stdin.readLineSync();
    int flag = 1;

    if (temp == "0") {
      return;
    } else if (temp == "1") {
      int flag4 = 0;
      for (int i = 0; i < busTypes.length; i++){
        if(busTypes[i] == "Normal"){
          flag4 =1;
        }
      }
      if(flag4 == 0){
        print("There is no Normal bus available ");
        return;
      }
      trip += "Normal^";

      for (int i = 0; i < busTypes.length; i++) {
        if (busTypes[i] == "Normal") {
          bus.add(busNames[i]);
          print("$flag - ${busNames[i]}");
          flag++;
        }
      }
    } else if (temp == "2") {
      int flag4 = 0;
      for (int i = 0; i < busTypes.length; i++){
        if(busTypes[i] == "VIP"){
          flag4 =1;
        }
      }
      if(flag4 == 0){
        print("There is no VIP bus available ");
        return;
      }
      trip += "VIP^";
      for (int i = 0; i < busTypes.length; i++) {
        if (busTypes[i] == "VIP") {
          bus.add(busNames[i]);
          print("$flag- ${busNames[i]}");
          flag++;
        }
      }
    } else {
      while (temp != "0" && temp != "1" && temp != "2") {
        print(
            "Invalid value\nEnter the bus type:\n0 -> exit\n1: Normal\n2: VIP");
        temp = stdin.readLineSync();
      }
    }

    print("Enter your desired bus number: 0 -> exit");
    temp = stdin.readLineSync();

    if (temp == "0") {
      return;
    } else {
      flag = 0;
      while (flag != 1) {
        if (temp == "0") {
          return;
        }
        for (int i = 1; i <= bus.length; i++) {
          if (temp == "$i") {
            trip += "${bus[i - 1]}^";
            flag = 1;
          }
        }
        if (flag == 1) {
          break;
        } else {
          print("Invalid value\nEnter your desired bus number: 0 -> exit");
          for (int i = 0; i < bus.length; i++) {
            print("${i + 1}- ${bus[i]}");
          }
          temp = stdin.readLineSync();
        }
      }
    }
    print("Please enter your start point: 0 -> exit");
    temp = stdin.readLineSync();
    if (temp == "0") {
      return;
    } else {
      trip += "$temp^";
    }
    print("Please enter your destination: 0 -> exit");
    temp = stdin.readLineSync();
    if (temp == "0") {
      return;
    } else {
      trip += "$temp^";
    }
    print("Please enter the price: 0 -> exit");
    temp = stdin.readLineSync();

    while(int.tryParse(temp!) == null || int.parse(temp) < 0 ){
      print("Invalid price , Please try again: ");
      temp = stdin.readLineSync();
    }
    if (temp == "0") {
      return;
    } else {
      trip += temp;
    }

    trips.add(trip);
    print("Your trip added successfully ");
  }

  void tripsDisplay() {
    if(trips.isEmpty){
      print("There is no trip available");
      return;
    }
    List<String> temp = [];
    for (int i = 0; i < trips.length; i++) {
      temp = trips[i].split('^');
      print(
          "${i + 1} - ${temp[0]} - ${temp[1]} - ${temp[2]} - ${temp[3]} - ${temp[4]} Toman");
    }
  }

  void ticketDisplay() {
    List<String> temp = [];
    for (int i = 0; i < ticket.length; i++) {
      temp = ticket[i].split('^');
      print(
          "${i +
              1}- ${temp[0]} - ${temp[1]} - ${temp[2]} - ${temp[3]} - ${temp[4]} - ${temp[5]} Toman - ${temp[6]}");
    }
  }

  void deleteFromTicket(String bn ,String seat ){
    for(int i = 0 ;i < ticket.length;i++){
      List<String> temp = ticket[i].split("^");
      if(temp[1] == bn && temp[5] == seat){
        if (temp[temp.length - 1] == "Bought"){
          int temp2 = (int.parse((temp[4])) * 90) ~/ 100 ;
          print("You successfully canceled your ticket");
          print("You paid 10% of trip price and you have back $temp2 Toman");
          cancelBought.add(temp[1]);
          ticket.removeAt(i);
        }
        else{
          int temp2 = (int.parse((temp[4])) * 80) ~/ 100;
          print("You successfully canceled your ticket");
          print("You paid 20% of trip price and you have back $temp2 Toman");
          cancelReserved.add(temp[1]);
          ticket.removeAt(i);
        }
      }
    }
  }

  void buyTicket() {
    print("List of trips:");
    tripsDisplay();
    print("Please enter your trip number: 0 -> exit");
    String? temp = stdin.readLineSync();
    if (temp == "0") {
      return;
    } else {
      int flag = 0;
      while (flag != 1) {
        for (int i = 1; i <= trips.length; i++) {
          if (temp == "$i") {
            if (trips[i - 1].split('^')[0] == "Normal") {
              bname = trips[i - 1].split('^')[1];
              print("Please enter your seat number: ");
              normalDisplay();
              String? userTemp2 = stdin.readLineSync();
              int temp2 = int.parse(userTemp2!);
              while(temp2 > 44 || temp2 < 1 || checkSeat("Normal", bname, temp2) != ""){
                print("Invalid seat number , Please try another seat number");
                 userTemp2 = stdin.readLineSync();
                 temp2 = int.parse(userTemp2!);
              }
              if (temp2 == 0) {
                return;
              } else if (temp2 < 45 &&
                  temp2 > 0 &&
                  checkSeat("Normal", bname, temp2) == "") {
                boughtSeats.add("$bname-Normal-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Bought");
              } else {
                while (checkSeat("Normal", bname, temp2) == "") {
                  print(
                      "The seat you choose is already bought or reserved \nPlease choose another seat: ");
                  userTemp2 = stdin.readLineSync();
                  temp2 = int.parse(userTemp2!);
                }
                boughtSeats.add("$bname-Normal-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Bought");
              }
            } else {
              bname = trips[i - 1].split('^')[1];
              print("Please enter your seat number: ");
              vipDisplay();
              String? userTemp2 = stdin.readLineSync();
              int temp2 = int.parse(userTemp2!);
              while(temp2 > 30 || temp2 < 1 ||  checkSeat("Normal", bname, temp2) != ""){
                print("Invalid seat number , Please try another seat number");
                userTemp2 = stdin.readLineSync();
                temp2 = int.parse(userTemp2!);
              }
              if (temp2 == 0) {
                return;
              } else if (temp2 < 45 &&
                  temp2 > 0 &&
                  checkSeat("VIP", bname, temp2) == "") {
                boughtSeats.add("$bname-VIP-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Bought");
              } else {
                while (checkSeat("VIP", bname, temp2) == "") {
                  print(
                      "The seat you choose is already bought or reserved \nPlease choose another seat: ");
                  userTemp2 = stdin.readLineSync();
                  temp2 = int.parse(userTemp2!);
                }
                boughtSeats.add("$bname-VIP-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Bought");
              }
            }
            flag = 1;
          }
        }
        if (flag == 1) {
          print("You successfully buy a ticket");
          print("You paid ${ticket[ticket.length - 1].split('^')[4]} toman ");
          break;
        } else {
          print("Invalid input\nPlease enter your trip number: 0 -> exit");
          tripsDisplay();
          temp = stdin.readLineSync();
        }
      }
    }
  }

  void reserveTicket() {
    print("List of trips:");
    tripsDisplay();
    print("Please enter your trip number: 0 -> exit");
    String? temp = stdin.readLineSync();
    if (temp == "0") {
      return;
    } else {
      int flag = 0;
      while (flag != 1) {
        for (int i = 1; i <= trips.length; i++) {
          if (temp == "$i") {
            if (trips[i - 1].split('^')[0] == "Normal") {
              bname = trips[i - 1].split('^')[1];
              print("Please enter your seat number: ");
              normalDisplay();
              String? userTemp2 = stdin.readLineSync();
              int temp2 = int.parse(userTemp2!);
              while(temp2 > 44 || temp2 < 1 ||  checkSeat("Normal", bname, temp2) != ""){
                print("Invalid seat number , Please try another seat number");
                userTemp2 = stdin.readLineSync();
                temp2 = int.parse(userTemp2!);
              }
              if (temp2 == 0) {
                return;
              } else if (temp2 < 45 &&
                  temp2 > 0 &&
                  checkSeat("Normal", bname, temp2) == "") {
                reservedSeats.add("$bname-Normal-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Reserved");
              } else {
                while (checkSeat("Normal", bname, temp2) == "") {
                  print(
                      "The seat you choose is already bought or reserved \nPlease choose another seat: ");
                  userTemp2 = stdin.readLineSync();
                  temp2 = int.parse(userTemp2!);
                }
                reservedSeats.add("$bname-Normal-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Reserved");
              }
            } else {
              bname = trips[i - 1].split('^')[1];
              print("Please enter your seat number: ");
              vipDisplay();
              String? userTemp2 = stdin.readLineSync();
              int temp2 = int.parse(userTemp2!);
              while(temp2 > 30 || temp2 < 1 ||  checkSeat("Normal", bname, temp2) != ""){
                print("Invalid seat number , Please try another seat number");
                userTemp2 = stdin.readLineSync();
                temp2 = int.parse(userTemp2!);
              }
              if (temp2 == 0) {
                return;
              } else if (temp2 < 45 &&
                  temp2 > 0 &&
                  checkSeat("VIP", bname, temp2) == "") {
                reservedSeats.add("$bname-VIP-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Reserved");
              } else {
                while (checkSeat("VIP", bname, temp2) == "") {
                  print(
                      "The seat you choose is already bought or reserved \nPlease choose another seat: ");
                  userTemp2 = stdin.readLineSync();
                  temp2 = int.parse(userTemp2!);
                }
                reservedSeats.add("$bname-VIP-$temp2");
                ticket.add("${trips[i-1]}^$temp2^Reserved");
              }
            }
            flag = 1;
          }
        }
        if (flag == 1) {
          List<String> temp3 =ticket[ticket.length - 1].split('^');
          int s = (int.parse(temp3[4]) * 30) ~/ 100;
          temp3[4] = "$s";
          print("You successfully reserve a ticket");
          print("You paid 30% of price: ${temp3[4]} ");
          String temp4 = "";
          for(int i = 0 ; i <temp3.length; i++){
            if (i == temp3.length - 1)
            {
              temp4 += temp3[i];
            }
            else
            {
              temp4 += "${temp3[i]}^";
            }
          }
          ticket.removeAt(ticket.length - 1);
          ticket.add(temp4);

          break;
        } else {
          print("Invalid input\nPlease enter your trip number: 0 -> exit");
          tripsDisplay();
          temp = stdin.readLineSync();
        }
      }
    }
  }

  void cancelTicket() {
    print("List of trips:");
    tripsDisplay();
    print("Please enter your trip number: 0 -> exit");
    String? temp = stdin.readLineSync();
    if (temp == "0") {
      return;
    } else {
      int flag = 0;
      while (flag != 1) {
        for (int i = 1; i <= trips.length; i++) {
          if (temp == "$i") {
            if (trips[i - 1].split('^')[0] == "Normal") {
              bname = trips[i - 1].split('^')[1];
              print("Please enter your seat number: ");
              normalDisplay();
              String? userTemp2 = stdin.readLineSync();
              int temp2 = int.parse(userTemp2!);
              while(temp2 > 44 || temp2 < 1 ||  checkSeat("Normal", bname, temp2) != ""){
                print("Invalid seat number , Please try another seat number");
                userTemp2 = stdin.readLineSync();
                temp2 = int.parse(userTemp2!);
              }
              if (temp2 == 0) {
                return;
              } else if (temp2 < 45 &&
                  temp2 > 0 &&
                  checkCancelSeat("Normal", bname, temp2) == "") {
                reservedSeats.remove("$bname-Normal-$temp2");
                boughtSeats.remove("$bname-Normal-$temp2");
                deleteFromTicket(bname, "$temp2");
                ticket.remove("${trips[i-1]}^$temp2^Reserved");
                ticket.remove("${trips[i-1]}^$temp2^Bought");
              } else {
                while (checkCancelSeat("Normal", bname, temp2) == "") {
                  print(
                      "The seat you choose is already bought or reserved \nPlease choose another seat: ");
                  userTemp2 = stdin.readLineSync();
                  temp2 = int.parse(userTemp2!);
                }
                reservedSeats.remove("$bname-Normal-$temp2");
                boughtSeats.remove("$bname-Normal-$temp2");
                deleteFromTicket(bname, "$temp2");
                ticket.remove("${trips[i-1]}^$temp2^Reserved");
                ticket.remove("${trips[i-1]}^$temp2^Bought");
              }
            } else {
              bname = trips[i - 1].split('^')[1];
              print("Please enter your seat number: ");
              vipDisplay();
              String? userTemp2 = stdin.readLineSync();
              int temp2 = int.parse(userTemp2!);
              while(temp2 > 30 || temp2 < 1 ||  checkSeat("Normal", bname, temp2) != ""){
                print("Invalid seat number , Please try another seat number");
                userTemp2 = stdin.readLineSync();
                temp2 = int.parse(userTemp2!);
              }
              if (temp2 == 0) {
                return;
              } else if (temp2 < 45 &&
                  temp2 > 0 &&
                  checkCancelSeat("VIP", bname, temp2) == "") {
                reservedSeats.remove("$bname-VIP-$temp2");
                boughtSeats.remove("$bname-VIP-$temp2");
                deleteFromTicket(bname, "$temp2");
                ticket.remove("${trips[i-1]}^$temp2^Reserved");
                ticket.remove("${trips[i-1]}^$temp2^Bought");
              } else {
                while (checkCancelSeat("VIP", bname, temp2) == "") {
                  print(
                      "The seat you choose is already bought or reserved \nPlease choose another seat: ");
                  userTemp2 = stdin.readLineSync();
                  temp2 = int.parse(userTemp2!);
                }
                reservedSeats.remove("$bname-VIP-$temp2");
                boughtSeats.remove("$bname-VIP-$temp2");
                deleteFromTicket(bname, "$temp2");
                ticket.remove("${trips[i-1]}^$temp2^Reserved");
                ticket.remove("${trips[i-1]}^$temp2^Bought");
              }
            }
            flag = 1;
          }
        }
        if (flag == 1) {
          break;
        } else {
          print("Invalid input\nPlease enter your trip number: 0 -> exit");
          tripsDisplay();
          temp = stdin.readLineSync();
        }
      }
    }
  }

  void tripReport(){
    tripsDisplay();
    print("Enter your trip number: ");
    String? inputTemp = stdin.readLineSync();
    int temp = int.parse(inputTemp!);
    bname = trips[temp - 1].split('^')[1];
    String btype = trips[temp - 1].split('^')[0];
    int income= 0;
    for (int i = 0; i < trips.length; i++)
    {
      if (trips[i].split('^')[1] == bname)
      {
        for (int k = 0; k < ticket.length; k++)
        {
          if (ticket[k].split('^')[1] == bname)
          {
            income += int.parse(ticket[k].split('^')[4]);
          }
        }
      }
    }
    List<String> seats =[];
    for (int i = 0;i < ticket.length; i++)
    {
      if (ticket[i].split('^')[1] == bname)
      {
        seats.add(ticket[i].split('^')[5]);
      }
    }
    int rc = 0;
    for (int i = 0; i < cancelReserved.length; i++)
    {
      if (cancelReserved[i] == bname)
      {
        rc++;
      }
    }

    int bc = 0;
    for (int i = 0; i < cancelBought.length; i++)
    {
      if (cancelBought[i] == bname)
      {
        bc++;
      }
    }
    if (btype == "Normal")
    {
      print("income: $income Toman\nAvailable free seats: ${44 - seats.length}\nReserved cancels: $rc\nBought cancels: $bc");
    }
    else
    {
      print("income: $income Toman\nAvailable free seats: ${30 - seats.length}\nReserved cancels: $rc\nBought cancels: $bc");
    }
  }

}



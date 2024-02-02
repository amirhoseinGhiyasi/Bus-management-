
import 'dart:io';

import 'classTrip.dart';

void main() {
  Trip trip = Trip();
  while (true) {
    print("***Menu***");
    print("1: Create bus   2: Create trip   3: Display trips   4: Reserve ticket   5: Buy ticket    6: Cancel ticket   7: Trip report   8: Exit ");
    String? num = stdin.readLineSync();
    switch (num) {
      case "1":
        List<String> bus = trip.createBus();
        for(int i = 0 ; i < trip.busNames.length ; i++){
          while(trip.busNames[i] == bus[0]){
            print("A bus with this name has already been registered , Try another name :  ");
            bus[0] = stdin.readLineSync()!;
          }

        }
        trip.addBus(bus[0], bus[1]);

        break;
      case "2":
        trip.createTrip();
        break;

      case "3":
        trip.tripsDisplay();
        break;

      case "4":
        trip.reserveTicket();
        break;

      case "5":
        trip.buyTicket();
        break;

      case "6":
        trip.cancelTicket();
        break;

      case "7":
        trip.tripReport();
        break;

      case "8":
        return;

      default:
        print("Invalid input, Please try again");
        break;
    }
  }
}
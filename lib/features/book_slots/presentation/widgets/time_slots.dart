import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slotbooking/features/book_slots/domain/booking_provider.dart';

class TimeSlots extends StatelessWidget {
  final int index;
  final Size size;
  final String source;

  const TimeSlots(
      {@required this.index, @required this.size, @required this.source});

  @override
  Widget build(BuildContext context) {
    final bookingProv = Provider.of<BookingProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            bookingProv.timeSlots[index].time <= 12
                ? "${bookingProv.timeSlots[index].time}:00 "
                : "${bookingProv.timeSlots[index].time - 12}:00 ",
            style: TextStyle(
                fontSize: size.height * 0.021,
                color: source == "home_screen"
                    ? bookingProv.timeSlots[index].isBooked == false
                        ? Colors.blue
                        : Colors.white70
                    : Colors.blue,
                fontFamily: "AirbnbCereal",
                fontWeight: FontWeight.w700)),
        Text(bookingProv.timeSlots[index].time < 12 ? "am" : "pm",
            style: TextStyle(
                fontSize: size.height * 0.021,
                color: source == "home_screen"
                    ? bookingProv.timeSlots[index].isBooked == false
                        ? Colors.blue
                        : Colors.white70
                    : Colors.blue,
                fontFamily: "AirbnbCereal",
                fontWeight: FontWeight.w700)),
        Text(" - ",
            style: TextStyle(
                fontSize: size.height * 0.021,
                color: source == "home_screen"
                    ? bookingProv.timeSlots[index].isBooked == false
                        ? Colors.blue
                        : Colors.white70
                    : Colors.blue,
                fontFamily: "AirbnbCereal",
                fontWeight: FontWeight.w700)),
        Text(
            bookingProv.timeSlots[index + 1].time <= 12
                ? "${bookingProv.timeSlots[index + 1].time}:00 "
                : "${bookingProv.timeSlots[index + 1].time - 12}:00 ",
            style: TextStyle(
                fontSize: size.height * 0.021,
                color: source == "home_screen"
                    ? bookingProv.timeSlots[index].isBooked == false
                        ? Colors.blue
                        : Colors.white70
                    : Colors.blue,
                fontFamily: "AirbnbCereal",
                fontWeight: FontWeight.w700)),
        Text(bookingProv.timeSlots[index + 1].time < 12 ? "am" : "pm",
            style: TextStyle(
                fontSize: size.height * 0.021,
                color: source == "home_screen"
                    ? bookingProv.timeSlots[index].isBooked == false
                        ? Colors.blue
                        : Colors.white70
                    : Colors.blue,
                fontFamily: "AirbnbCereal",
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slotbooking/features/book_slots/domain/booking_provider.dart';
import 'package:slotbooking/features/book_slots/presentation/widgets/time_slots.dart';

import 'slot_booking_details_enter_screen.dart';

class SlotsHomeScreen extends StatefulWidget {
  @override
  _SlotsHomeScreenState createState() => _SlotsHomeScreenState();
}

class _SlotsHomeScreenState extends State<SlotsHomeScreen> {
  @override
  void initState() {
    Provider.of<BookingProvider>(context, listen: false).populateTimeSlots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = Provider.of<BookingProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "SlotBooking",
                style: TextStyle(
                    fontSize: size.height * 0.04,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Text(
                "Available Time Slots",
                style: TextStyle(
                    fontSize: size.height * 0.023,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: ListView.builder(
                  itemCount: prov.timeSlots.length - 1,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.024),
                      child: InkWell(
                        splashColor: Colors.blue.withOpacity(0.1),
                        highlightColor: Colors.blue.withOpacity(0.2),
                        onTap: () {
                          Navigator.of(context)
                              .push(new MaterialPageRoute(
                            builder: (context) => SlotBookingDetailsEnterScreen(
                              index: index,
                              bookingProv: prov,
                            ),
                          ))
                              .then((value) {
                            setState(() {});
                          });
                        },
                        child: Container(
                          width: size.width,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                              color: prov.timeSlots[index].isBooked == false
                                  ? Colors.transparent
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(5),
                              border: prov.timeSlots[index].isBooked == false
                                  ? Border.all(
                                      color: Colors.blue,
                                      width: size.width * 0.004)
                                  : null),
                          child: Center(
                            child: TimeSlots(
                              index: index,
                              size: size,
                              source: "home_screen",
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

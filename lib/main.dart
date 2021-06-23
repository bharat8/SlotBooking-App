import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slotbooking/features/book_slots/domain/booking_provider.dart';
import 'package:slotbooking/features/book_slots/domain/user_provider.dart';

import 'features/book_slots/presentation/screens/slots_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookingProvider>(
          create: (context) => BookingProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(primarySwatch: Colors.blue, fontFamily: "AirbnbCereal"),
          home: SlotsHomeScreen()),
    );
  }
}

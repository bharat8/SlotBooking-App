import 'package:flutter/foundation.dart';
import 'package:slotbooking/features/book_slots/data/models/user_model.dart';

class BookingModel {
  final int time;
  bool isBooked;
  UserModel user;

  BookingModel(
      {@required this.time, @required this.isBooked, @required this.user});
}

import 'package:flutter/cupertino.dart';
import 'package:slotbooking/features/book_slots/data/models/booking_model.dart';
import 'package:slotbooking/features/book_slots/data/models/user_model.dart';

class BookingProvider extends ChangeNotifier {
  List<BookingModel> _timeSlots = [];
  int _start = 9;
  int _end = 17;

  List<BookingModel> get timeSlots => _timeSlots;

  void populateTimeSlots() {
    if (_start < _end) {
      for (var i = _start; i <= _end; i++) {
        _timeSlots.add(BookingModel(
            time: i,
            isBooked: false,
            user: UserModel(firstName: "", lastName: "", phoneNumber: "")));
      }
    } else {
      for (var i = _end; i <= _start; i--) {
        if (i < 0) {
          _timeSlots.add(BookingModel(
              time: 24 + i,
              isBooked: false,
              user: UserModel(firstName: "", lastName: "", phoneNumber: "")));
        } else {
          _timeSlots.add(BookingModel(
              time: i,
              isBooked: false,
              user: UserModel(firstName: "", lastName: "", phoneNumber: "")));
        }

        if (_start - i == 24) {
          break;
        }
      }
      _timeSlots = _timeSlots.reversed.toList();
    }
  }

  select(int index) {
    timeSlots[index].isBooked = true;
    notifyListeners();
  }
}

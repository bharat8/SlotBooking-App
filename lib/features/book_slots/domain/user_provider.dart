import 'package:flutter/material.dart';
import 'package:slotbooking/features/book_slots/data/models/user_model.dart';
import 'package:slotbooking/features/book_slots/domain/booking_provider.dart';

class UserProvider extends ChangeNotifier {
  String _firstName;
  String _lastName;
  String _phoneNumber;

  String _firstNameErrorText;
  String _lastNameErrorText;
  String _phoneNumberErrorText;

  String get firstNameErrorText => _firstNameErrorText;
  String get lastNameErrorText => _lastNameErrorText;
  String get phoneNumberErrorText => _phoneNumberErrorText;

  set setFirstName(String val) => _firstName = val;
  set setLastName(String val) => _lastName = val;
  set setPhoneNumber(String val) => _phoneNumber = val;

  void validateFirstName(String val) {
    _firstName = val;
    if (val.length == 0 || val.isEmpty) {
      _firstNameErrorText = "You didn't entered first name";
    } else {
      _firstNameErrorText = null;
    }
    notifyListeners();
  }

  void validateLastName(String val) {
    _lastName = val;
    if (val.length == 0 || val.isEmpty) {
      _lastNameErrorText = "You didn't entered last name";
    } else {
      _lastNameErrorText = null;
    }
    notifyListeners();
  }

  void validatePhoneNumber(String val) {
    _phoneNumber = val;
    if (val.isEmpty || val.length == 0) {
      _phoneNumberErrorText = "You didn't entered phone number";
    } else if (_phoneNumber.length != 10 ||
        RegExp(r"\+?\d[\d -]{8,12}\d").hasMatch(val) == false) {
      _phoneNumberErrorText = "Please enter a valid phone number";
    } else {
      _phoneNumberErrorText = null;
    }
    notifyListeners();
  }

  void validateAllDetails(
      BuildContext context, int slotIndex, BookingProvider prov) {
    if (_firstName == null) {
      _firstNameErrorText = "You didn't entered first name";
    } else {
      if (_firstName.isEmpty || _firstName.length == 0) {
        _firstNameErrorText = "You didn't entered first name";
      }
    }

    if (_lastName == null) {
      _lastNameErrorText = "You didn't entered last name";
    } else {
      if (_lastName.isEmpty || _lastName.length == 0) {
        _lastNameErrorText = "You didn't entered last name";
      }
    }

    if (_phoneNumber == null) {
      _phoneNumberErrorText = "You didn't entered phone number";
    } else {
      if (_phoneNumber.isEmpty || _phoneNumber.length == 0) {
        _phoneNumberErrorText = "You didn't entered phone number";
      } else if (_phoneNumber.length != 10) {
        _phoneNumberErrorText = "Please enter a valid phone number";
      }
    }
    notifyListeners();

    print("Booking Details");
    print("First Name ======> $_firstName");
    print("Last Name ======> $_lastName");
    print("Phone Number ======> $_phoneNumber");

    if (_firstName != null &&
        _lastName != null &&
        _phoneNumber != null &&
        _firstName.length != 0 &&
        _lastName.length != 0 &&
        _phoneNumber.length != 0 &&
        _phoneNumber.length == 10) {
      prov.timeSlots[slotIndex].isBooked = true;
      prov.timeSlots[slotIndex].user = UserModel(
          firstName: _firstName,
          lastName: _lastName,
          phoneNumber: _phoneNumber);
      notifyListeners();
      Navigator.of(context).pop();
    }
  }

  void resetProvData() {
    _firstName = null;
    _lastName = null;
    _phoneNumber = null;
    _firstNameErrorText = null;
    _lastNameErrorText = null;
    _phoneNumberErrorText = null;
  }
}

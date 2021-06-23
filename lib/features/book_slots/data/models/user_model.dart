import 'package:flutter/foundation.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserModel(
      {@required this.firstName,
      @required this.lastName,
      @required this.phoneNumber});
}

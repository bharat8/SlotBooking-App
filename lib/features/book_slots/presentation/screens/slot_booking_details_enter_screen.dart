import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:slotbooking/features/book_slots/domain/booking_provider.dart';
import 'package:slotbooking/features/book_slots/domain/user_provider.dart';
import 'package:slotbooking/features/book_slots/presentation/widgets/time_slots.dart';

class SlotBookingDetailsEnterScreen extends StatefulWidget {
  final int index;
  final BookingProvider bookingProv;
  const SlotBookingDetailsEnterScreen(
      {@required this.index, @required this.bookingProv});
  @override
  _SlotBookingDetailsEnterScreenState createState() =>
      _SlotBookingDetailsEnterScreenState();
}

class _SlotBookingDetailsEnterScreenState
    extends State<SlotBookingDetailsEnterScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    checkIfBooked();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void checkIfBooked() {
    final bookingProv = Provider.of<BookingProvider>(context, listen: false);
    final userProv = Provider.of<UserProvider>(context, listen: false);
    if (bookingProv.timeSlots[widget.index].isBooked == true) {
      _firstNameController.text =
          bookingProv.timeSlots[widget.index].user.firstName.toString();
      _lastNameController.text =
          bookingProv.timeSlots[widget.index].user.lastName.toString();
      _phoneNumberController.text =
          bookingProv.timeSlots[widget.index].user.phoneNumber.toString();
      userProv.setFirstName =
          bookingProv.timeSlots[widget.index].user.firstName.toString();
      userProv.setLastName =
          bookingProv.timeSlots[widget.index].user.lastName.toString();
      userProv.setPhoneNumber =
          bookingProv.timeSlots[widget.index].user.phoneNumber.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userProv = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Text(
                    "Details for booking",
                    style: TextStyle(
                        fontSize: size.height * 0.035,
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Slot Timings : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: size.height * 0.022,
                            fontWeight: FontWeight.w700)),
                    TimeSlots(
                      index: widget.index,
                      size: size,
                      source: "booking_details_screen",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: size.height * 0.024),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.015),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue.withOpacity(0.14),
                        ),
                        padding: EdgeInsets.only(left: size.width * 0.04),
                        alignment: Alignment.center,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _firstNameController,
                          style: TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration.collapsed(
                              hintText: "Ex. David",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.w500)),
                          onChanged: (val) => userProv.validateFirstName(val),
                        ),
                      ),
                    ),
                    if (userProv.firstNameErrorText != null)
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.007),
                        child: Text(
                          userProv.firstNameErrorText.toString(),
                          style: TextStyle(
                              color: Colors.red[700],
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.018),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.024),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.015),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue.withOpacity(0.14),
                        ),
                        padding: EdgeInsets.only(left: size.width * 0.04),
                        alignment: Alignment.center,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _lastNameController,
                          style: TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration.collapsed(
                              hintText: "Ex. Beckham",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.w500)),
                          onChanged: (val) => userProv.validateLastName(val),
                        ),
                      ),
                    ),
                    if (userProv.lastNameErrorText != null)
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.007),
                        child: Text(
                          userProv.lastNameErrorText.toString(),
                          style: TextStyle(
                              color: Colors.red[700],
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.018),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.024),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.015),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue.withOpacity(0.14),
                        ),
                        padding: EdgeInsets.only(left: size.width * 0.04),
                        alignment: Alignment.center,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneNumberController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          style: TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration.collapsed(
                              hintText: "Ex. 9876543210",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.w500)),
                          onChanged: (val) => userProv.validatePhoneNumber(val),
                        ),
                      ),
                    ),
                    if (userProv.phoneNumberErrorText != null)
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.007),
                        child: Text(
                          userProv.phoneNumberErrorText.toString(),
                          style: TextStyle(
                              color: Colors.red[700],
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.018),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              userProv.resetProvData();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.024),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              userProv.validateAllDetails(
                                  context, widget.index, widget.bookingProv);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.06,
                                    right: size.width * 0.06,
                                    top: size.height * 0.01,
                                    bottom: size.height * 0.014),
                                child: Text(
                                  "Save",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.height * 0.024),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

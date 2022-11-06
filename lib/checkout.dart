import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'homestay.dart';
import 'homestaydetail.dart';
import 'input.dart';

class CheckoutPage extends StatefulWidget {
  final Homestay homestay;
  final String fullName;
  final String dateDeparture;
  final String dateCheckin;
  final String numGuest;
  const CheckoutPage(
      {Key? key,
      required this.homestay,
      required this.fullName,
      required this.dateCheckin,
      required this.dateDeparture,
      required this.numGuest})
      : super(key: key);
  @override
  _CheckoutPageState createState() {
    return _CheckoutPageState();
  }
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _sliderVal = 1;
  int finalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: SizedBox(
            width: 40,
            child: Image.asset('assets/loading.png'),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.zero,
            child: Text(
              "Check Out",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5)),
          ),
          backgroundColor: Colors.white,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(widget.homestay.thumbnailUrl),
                    height: 130,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Homestay Details",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'GoogleFonts.lato()',
                      decoration: TextDecoration.underline),
                ),
                Text(
                  widget.homestay.listingName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                Text(
                  widget.homestay.listingAddress,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                Text(
                  'Type of property: ${widget.homestay.typeOfProperty}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                Text(
                  'Capacity: ${widget.homestay.capacity}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                Text(
                  'Check in: ${widget.dateCheckin}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                Text(
                  'Check out: ${widget.dateDeparture}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                Text(
                  'Pick number of nights',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                Slider(
                  min: 1,
                  max: 10,
                  divisions: 10,
                  label: '$_sliderVal night(s)',
                  value: _sliderVal.toDouble(),
                  onChanged: (newValue) {
                    setState(() {
                      _sliderVal = newValue.round();
                      finalPrice = newValue.round();
                    });
                  },
                ),
                Text(
                  'RM ${widget.homestay.listingPrice * _sliderVal} Per Night',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),

                Text(
                  'Price after discount: RM ${(finalPrice * widget.homestay.listingPrice) * 0.5}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'GoogleFonts.lato()',
                  ),
                ),
                // TextField(
                //   controller: Discount,
                //   decoration: InputDecoration(
                //     labelText: "Enter Discount Code",
                //     errorText: _errorText,
                //     border: UnderlineInputBorder(
                //         borderRadius: BorderRadius.circular(5.0)),
                //   ),
                // )
                // Form(
                //   child: TextFormField(
                //       controller: Discount,
                //       decoration: InputDecoration(
                //         labelText: "Insert Discount Code",
                //         border: UnderlineInputBorder(
                //           borderRadius: BorderRadius.circular(5.0),
                //         ),
                //       )),
                // ),
              ],
            ),
          ],
        ));
  }
}

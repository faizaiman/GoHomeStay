import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'checkout.dart';
import 'homestay.dart';

class UserInput extends StatefulWidget {
  final Homestay homestay;
  const UserInput({Key? key, required this.homestay}) : super(key: key);
  @override
  _UserInput createState() => _UserInput();
}

class _UserInput extends State<UserInput> {
  var currentSelectedValue;
  List listItem = ['House', 'Flat', 'Guest House', 'Hotel'];
  final _formKey = GlobalKey<FormState>();
  final FullName = TextEditingController();
  final numGuest = TextEditingController();
  TextEditingController dateCheckin = TextEditingController();
  TextEditingController dateDepature = TextEditingController();

  @override
  void initState() {
    dateCheckin.text = ""; //set the initial value of text field
    dateDepature.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Container(
          width: 40,
          child: Image.asset("assets/loading.png"),
        ),
        bottom: PreferredSize(
          child: Text(
            "Personal Information",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          preferredSize: Size.zero,
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Your Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: FullName,
                    decoration: new InputDecoration(
                      labelText: "Name",
                      hintText: "Arifin Nurain Bin Iz",
                      icon: Icon(Icons.people),
                      border: UnderlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (val) => val!.isEmpty ? "Required" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Chaah, Johor",
                      labelText: "Address",
                      icon: Icon(Icons.pin_drop),
                      border: UnderlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (val) => val!.isEmpty ? "Required" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                      hintText: "01234567884",
                      labelText: "Phone Number",
                      icon: Icon(Icons.phone),
                      border: UnderlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? "Required" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                      hintText: "Aerif@gmail.com",
                      labelText: "Email",
                      icon: Icon(Icons.email),
                      border: UnderlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? "Required" : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Homestay Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: numGuest,
                    decoration: new InputDecoration(
                      hintText: "10",
                      labelText: "Number of Guest",
                      icon: Icon(Icons.person),
                      border: UnderlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (val) => val!.isEmpty ? "Required" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MMM, yyyy',
                    controller: dateCheckin,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: "Departure Date",
                    timeLabelText: "Departure Time",
                    onChanged: (val) => print(val),
                    validator: (val) => val!.isEmpty ? "Required" : null,
                    onSaved: (val) => print(val),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MMM, yyyy',
                    controller: dateDepature,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: "Departure Date",
                    timeLabelText: "Departure Time",
                    onChanged: (val) => print(val),
                    validator: (val) => val!.isEmpty ? "Required" : null,
                    onSaved: (val) => print(val),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Error")));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CheckoutPage(
                          homestay: widget.homestay,
                          fullName: FullName.text,
                          dateCheckin: dateCheckin.text,
                          dateDeparture: dateDepature.text,
                          numGuest: numGuest.text,
                        );
                      }));
                    }
<<<<<<< HEAD
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CheckoutPage(
                        homestay: widget.homestay,
                        fullName: FullName.text,
                        dateCheckin: dateCheckin.text,
                        dateDeparture: dateDepature.text,
                        numGuest: numGuest.text,
                      );
                    }));
=======
>>>>>>> origin/test
                  },
                  style: ElevatedButton.styleFrom
                  (
                      backgroundColor: Color(0xFF78ffd6)
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //end of scaffold
  }
}

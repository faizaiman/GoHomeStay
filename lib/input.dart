import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class UserInput extends StatefulWidget {
  @override
  _UserInput createState() => _UserInput();
}

class _UserInput extends State<UserInput> {
  final _formKey = GlobalKey<FormState>();
  final FullName = TextEditingController();
  final dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
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
          width: 50,
          child: Image.asset("assets/loading.png"),
        ),
        bottom: PreferredSize(
          child: Text(
            "Personal Information",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: FullName,
                    decoration: new InputDecoration(
                      labelText: "Name",
                      hintText: "Example: Arifin Nurain Bin Iz",
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
                      hintText:
                          "12,jalan labu, Kampung Kompang, 80300 Johor Bahru,Johor",
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
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Error")));
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //end of scaffold
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'homestay.dart';
import 'input.dart';
import 'package:flutter/src/material/colors.dart';

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
  final int ANIMATED_BODY_MS = 500;
  int _sliderVal = 1;
  double discount = 0.5;
  String inputDiscount = "";
  TextEditingController textController = TextEditingController();

  double stackHeight = 300;
  bool showBody = false;
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        showBody = true;
      });
    });
  }

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
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
        ),
        backgroundColor: Colors.white,
      ),
      body: animatedBody(),
      floatingActionButton: getButtons(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  getStack() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: stackHeight,
      child: Stack(
        children:
            // <Widget>
            [
          Image(
            image: AssetImage(widget.homestay.thumbnailUrl),
          )
        ],
      ),
    );
  }

  getInfoHead() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.homestay.listingName,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "RM" + widget.homestay.listingPrice.toString(),
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFe6b56c),
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: Colors.grey,
              size: 13,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              widget.homestay.listingAddress,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Spacer(),
            Text(
              "per night",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 15,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              widget.homestay.ratings,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        )
      ],
    );
  } //end of info head

  getBody() {
    DateTime dt1 = DateTime.parse(widget.dateCheckin);
    DateTime dt2 = DateTime.parse(widget.dateDeparture);
    Duration diff = dt2.difference(dt1);
    int days = diff.inDays.toInt();

    double finalPrice = 0;
    inputDiscount == widget.homestay.discountCode
        ? (finalPrice = widget.homestay.listingPrice * discount)
        : (finalPrice = widget.homestay.listingPrice);

    return ListView(
      children: [
        Column(
          children: [
            getStack(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: getInfoHead()),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Booking Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'GoogleFonts.lato()',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Type of property: ${widget.homestay.typeOfProperty}',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Check in: ${widget.dateCheckin}',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Check-Out: ${widget.dateDeparture}',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Number of Day:' + diff.inDays.toString(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Number of people: ${(widget.homestay.capacity).toString()}',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'RM ${widget.homestay.listingPrice * days} Per Night',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 15, height: 1.0, color: Colors.black),
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: "Enter Discount Code",
                      fillColor: Colors.white,
                      filled: true,
                      hoverColor: Colors.blue,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(
                        () {
                          inputDiscount = value;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Total Price: RM${finalPrice * days}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ],
    );
  } //end of getBody

  getButtons() {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 300,
                child: Center(
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      if (kDebugMode) {
                        print(rating);
                      }
                    },
                  ),
                ),
              );
            });
      },
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF78ffd6)),
      child: const Text(
        "Confirm Booking",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  animatedBody() {
    return AnimatedCrossFade(
      firstChild: getBody(),
      secondChild: Container(),
      crossFadeState:
          showBody ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 500),
    );
  }
}

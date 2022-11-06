import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gohomestay/input.dart';
import 'homestay.dart';

class HomeDetail extends StatefulWidget {
  final Homestay homestay;
  // ignore: constant_identifier_names
  const HomeDetail({Key? key, required this.homestay}) : super(key: key);
  @override
  _HomeDetailState createState() {
    return _HomeDetailState();
  }
}

class _HomeDetailState extends State<HomeDetail> {
  CarouselController buttonCarouselController = CarouselController();
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
              "Homestay Detail",
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
        body: SafeArea(
            child: Column(
          children:
              // <Widget>
              [
            Text(
              widget.homestay.listingName,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'GoogleFonts.lato()',
              ),
            ),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(height: 300),
              items: [
                Image(image: AssetImage(widget.homestay.images[0]), height: 50),
                Image(image: AssetImage(widget.homestay.images[1]), height: 50),
              ],
            ),
            Text(
              'Type of property: ${widget.homestay.typeOfProperty}',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'GoogleFonts.lato()',
              ),
            ),
            Text(
              'Capacity: ${(widget.homestay.capacity).toString()}',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'GoogleFonts.lato()',
              ),
            ),
            Text(
              widget.homestay.listingAddress,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'GoogleFonts.lato()',
              ),
            ),
            Text(
              'RM ${widget.homestay.listingPrice}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'GoogleFonts.lato()',
              ),
            ),
            Text(
              'Enter discount code: ${widget.homestay.discountCode}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'GoogleFonts.lato()',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserInput(homestay: widget.homestay);
                }));
              },
              child: const Text('Next'),
            ),
          ],
        )));
  }
}

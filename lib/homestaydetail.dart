import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gohomestay/input.dart';
import 'homestay.dart';
import 'package:coupon_uikit/coupon_uikit.dart';

class HomeDetail extends StatefulWidget {
  final Homestay homestay;
  final int ANIMATED_BODY_MS = 500;

  // ignore: constant_identifier_names
  const HomeDetail({Key? key, required this.homestay}) : super(key: key);
  @override
  _HomeDetailState createState() {
    return _HomeDetailState();
  }
}

class _HomeDetailState extends State<HomeDetail> {
  CarouselController buttonCarouselController = CarouselController();
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
            "Homestay Detail",
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
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(height: 300),
            items: [
              Image(image: AssetImage(widget.homestay.images[0]), height: 50),
              Image(image: AssetImage(widget.homestay.images[1]), height: 50),
            ],
          ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: getCoupon(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "What they offer",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                getFaci(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    widget.homestay.description,
                    style: TextStyle(height: 1.5, color: Color(0xFF8A8989)),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  } //end of getBody

  getFaci() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bed_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.homestay.noRoom,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Icon(
                    Icons.wifi,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Free Wifi",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Icon(
                    Icons.pool,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Swimming Pool",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  getCoupon() {
    return CouponCard(
      height: 90,
      backgroundColor: Color(0xffcbf3f0),
      curveAxis: Axis.vertical,
      firstChild: Container(
        decoration: BoxDecoration(
          color: Color(0xff368f8b),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      '50%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.black, height: 0),
            const Expanded(
              child: Center(
                child: Text(
                  'HOLIDAY IS\nCOMING',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      secondChild: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Coupon Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.homestay.discountCode,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff368f8b),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Text(
              'Valid Till - 30 Dec 2022',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getButtons() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserInput(homestay: widget.homestay);
        }));
      },
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF78ffd6)),
      child: const Text(
        "Book Now",
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

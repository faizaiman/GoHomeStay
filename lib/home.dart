import 'package:flutter/material.dart';
import 'package:gohomestay/homestaydetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homestay.dart';
import 'homestaydetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();

  final double width = 320;
  final double height = 300;
}

class _HomePageState extends State<HomePage> {
  Widget buildHomeStay(Homestay homestay) {
    return Center(
      child: Container(
        width: 320,
        height: 300,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image(
                image: AssetImage(homestay.thumbnailUrl),
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 260,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homestay.listingName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homestay.noRoom,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: Color(0xFF8A8989), fontSize: 13),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "RM" + homestay.listingPrice.toString() + "/night",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFFe6b56c),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xFFffcb66),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        homestay.ratings,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          width: 40,
          child: Image.asset('assets/loading.png'),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.zero,
          child: Text(
            "Homestay Listing",
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
      body: SafeArea(
        child: ListView.builder(
          itemCount: Homestay.listings.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeDetail(homestay: Homestay.listings[index]);
                    },
                  ),
                );
              },
              child: buildHomeStay(Homestay.listings[index]),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gohomestay/homestaydetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homestay.dart';
import 'homestaydetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildHomeStay(Homestay homestay) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image(
                image: AssetImage(homestay.thumbnailUrl),
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              title: Text(
                homestay.listingName,
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                homestay.listingAddress,
                style: TextStyle(fontSize: 10),
              ),
            )
          ],
        ),
      ),
    ));
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

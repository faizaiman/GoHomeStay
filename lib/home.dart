
import 'package:flutter/material.dart';
import 'package:gohomestay/homestaydetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homestay.dart';
import 'homestaydetail.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});
  @override 
  State<HomePage> createState() =>_HomePageState();
}

class _HomePageState extends State<HomePage>
{

  Widget buildHomeStay(Homestay homestay)
  {
    return Card
    (
      elevation: 1.5,
      shape: RoundedRectangleBorder
      (
        borderRadius: BorderRadius.circular
        (
          5.0
        )
      ),
      child: Padding
      (
      padding: const EdgeInsets.all
      (
        10.0
      ),
      child: Column
      (
        children:<Widget>
        [
        Image(image:AssetImage(homestay.thumbnailUrl)),
        const SizedBox(height: 10.0, width: 15.0,),
        Text
        (
          homestay.listingName,
          style:const TextStyle
          (
            fontSize: 20.0,
            fontWeight: FontWeight.w700, 
            fontFamily: 'GoogleFonts.lato()',
          ),
        ),
        Text
        (
          homestay.listingAddress,
          style:const TextStyle
          (
            fontSize: 14.0,
            fontWeight: FontWeight.w300, 
            fontFamily: 'GoogleFonts.lato()',
          ),
        ),
        Text
        (
          'RM ${homestay.listingPrice} Per Night',
          style:const TextStyle
          (
            fontSize: 14.0,
            fontWeight: FontWeight.w300, 
            fontFamily: 'GoogleFonts.lato()',
          ),
        ),
      ],
      ),
      ),
      );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      ( 
        centerTitle: true,
        title: SizedBox
        (
          width: 40,
          child: Image.asset('assets/loading.png'),
        ),
        bottom: const PreferredSize
        (
          preferredSize: Size.zero,
          child: Text
          (
            "Homestay Listing",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder
        (
          borderRadius: BorderRadius.only
          (
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5)
          ),
        ),
        backgroundColor: Colors.white,
      ),
      
      body: SafeArea
      (
            child: ListView.builder
            (
              itemCount: Homestay.listings.length,
              itemBuilder: (BuildContext context, int index)
              {
                return GestureDetector
                (
                  child: buildHomeStay(Homestay.listings[index]),
                  onTap:() 
                  {
                    Navigator.push
                    (
                      context, MaterialPageRoute
                      (
                        builder: (context)
                        {
                          return HomeDetail(homestay: Homestay.listings[index]);
                        }
                      )
                    );
                  },
                );           
              },
            ),
        ), 
      ); 
  }
}
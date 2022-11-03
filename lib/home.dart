import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homestay.dart';

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
        25.0
      ),
      child: Column
      (
        children:<Widget>
        [
        Image(image:AssetImage(homestay.imgUrl)),
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
          
          (homestay.listingPrice).toString(),
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
        backgroundColor: Colors.white,
        leading: IconButton
        (
          onPressed: () {},
          icon: Image.asset('assets/loading.png'),
        ),
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
              // onTap:() 
              // {
              //   Navigator.push(context, MaterialPageRoute(builder: (context)
              //   {
                  
              //   }
              // },
              child: buildHomeStay(Homestay.listings[index]),
            );           
          },
        ),
      ),
    );
  }
}
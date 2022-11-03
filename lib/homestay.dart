class Homestay
{
  String listingName;
  double listingPrice;
  String listingAddress;
  String imgUrl;
  String discountCode;
  Homestay(this.listingName, this.listingPrice, this.listingAddress, this.imgUrl, this.discountCode);

  static List<Homestay>listings =
  [
    Homestay
    (
      'Duplex @ Mutiara Ville', 
      200.00, 
      'Mutiara Ville, Cyberjaya, Selangor',
      'assets/bsp21.jpg',
      'ABC123'
    ),

    Homestay
    (
      'Homestay BSP21',
      400.00,
      'BSP21, Bandar Saujana Putra, Selangor',
      'assets/mutiaraville.jpg',
      'DEF456'
    ),

    Homestay
    (
      'Pent House @ KL Traders Square Residence',
      400.00,
      'KL Traders Square Residence, Setapak, Kuala Lumpur',
      'assets/kl-traders-square.jpg',
      'GHI789'
    ),
  ];
}
class Homestay {
  String listingName;
  double listingPrice;
  String listingAddress;
  String typeOfProperty;
  int capacity;
  List<String> images;
  String thumbnailUrl;
  String discountCode;
  Homestay(
      this.listingName,
      this.listingPrice,
      this.typeOfProperty,
      this.capacity,
      this.listingAddress,
      this.thumbnailUrl,
      this.images,
      this.discountCode);

  static List<Homestay> listings = [
    Homestay(
        'Duplex @ Mutiara Ville',
        200.00,
        'Duplex',
        8,
        'Mutiara Ville, Cyberjaya, Selangor',
        'assets/mutiaraville.jpg',
        ['assets/mutiaraville.jpg', 'assets/mutiaraville2.jpeg'],
        'ABC123'),
    Homestay(
        'Homestay BSP21',
        400.00,
        'Condo',
        5,
        'BSP21, Bandar Saujana Putra, Selangor',
        'assets/bsp21.jpg',
        ['assets/bsp21.jpg', 'assets/bsp212.jpeg'],
        'DEF456'),
    Homestay(
        'Pent House @ KLTS',
        400.00,
        'Pent House',
        10,
        'KLTS, Setapak, Kuala Lumpur',
        'assets/kl-traders-square.jpg',
        ['assets/kl-traders-square.jpg', 'assets/kl-traders-square2.jpeg'],
        'GHI789'),
  ];
}

class Homestay {
  String listingName;
  double listingPrice;
  String listingAddress;
  List<String> images;
  String thumbnailUrl;

  String discountCode;
  String noRoom;
  String ratings;
  Homestay(
      this.listingName,
      this.listingPrice,
      this.listingAddress,
      this.thumbnailUrl,
      this.images,
      this.discountCode,
      this.noRoom,
      this.ratings);

  static List<Homestay> listings = [
    Homestay(
        'Duplex @ Mutiara Ville',
        200.00,
        'Mutiara Ville, Cyberjaya, Selangor',
        'assets/mutiaraville.jpg',
        ['assets/mutiaraville.jpg', 'assets/mutiaraville2.jpeg'],
        'ABC123',
        'Triple Room',
        '4.0'),
    Homestay(
        'Homestay BSP21',
        400.00,
        'BSP21, Bandar Saujana Putra, Selangor',
        'assets/bsp21.jpg',
        ['assets/bsp21.jpg', 'assets/bsp212.jpeg'],
        'DEF456',
        'Double Room',
        '4.5'),
    Homestay(
        'Pent House @ KLTS',
        400.00,
        'KLTS, Setapak, Kuala Lumpur',
        'assets/kl-traders-square.jpg',
        ['assets/kl-traders-square.jpg', 'assets/kl-traders-square2.jpeg'],
        'GHI789',
        'Triple Room',
        '4.0'),
  ];
}

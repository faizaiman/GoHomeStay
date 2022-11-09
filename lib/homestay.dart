class Homestay {
  String listingName;
  double listingPrice;
  String listingAddress;
  String typeOfProperty;
  int capacity;
  List<String> images;
  String thumbnailUrl;
  String discountCode;
  String noRoom;
  String ratings;
  String description;
  Homestay(
      this.listingName,
      this.listingPrice,
      this.typeOfProperty,
      this.capacity,
      this.listingAddress,
      this.thumbnailUrl,
      this.images,
      this.discountCode,
      this.noRoom,
      this.ratings,
      this.description);

  static List<Homestay> listings = [
    Homestay(
        'Duplex @ Mutiara Ville',
        200.00,
        'Duplex',
        8,
        'Mutiara Ville, Cyberjaya, Selangor',
        'assets/mutiaraville.jpg',
        ['assets/mutiaraville.jpg', 'assets/mutiaraville2.jpeg'],
        'ABC123',
        'Triple Room',
        '4.0',
        'Featuring an outdoor swimming pool, a fitness centre, and a garden, My Dallynes Homestay at Mutiara Ville Cyberjaya provides accommodation in Cyberjaya with free WiFi and garden views.'),
    Homestay(
        'Homestay BSP21',
        400.00,
        'Condo',
        5,
        'BSP21, Bandar Saujana Putra, Selangor',
        'assets/bsp21.jpg',
        ['assets/bsp21.jpg', 'assets/bsp212.jpeg'],
        'DEF456',
        'Double Room',
        '4.5',
        'Boasting an outdoor swimming pool, a fitness centre, and a garden, The Minions Homestay@BSP 21 features accommodation in Bandar Saujana Putra with free WiFi and garden views.'),
    Homestay(
        'Pent House @ KLTS',
        400.00,
        'Pent House',
        10,
        'KLTS, Setapak, Kuala Lumpur',
        'assets/kl-traders-square.jpg',
        ['assets/kl-traders-square.jpg', 'assets/kl-traders-square2.jpeg'],
        'GHI789',
        'Triple Room',
        '4.0',
        'Conveniently situated in the Setapak part of Kuala Lumpur, this property puts you close to attractions and interesting dining options.'),
  ];
}

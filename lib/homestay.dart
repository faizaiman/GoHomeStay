class Homestay {
  int listingID;
  String listingName;
  double listingPrice;
  String listingAddress;
  String typeOfProperty;
  int capacity;
  List<String> images;
  String thumbnailUrl;

  String discountCode;
  Homestay(
      this.listingID,
      this.listingName,
      this.typeOfProperty,
      this.capacity,
      this.listingPrice,
      this.listingAddress,
      this.thumbnailUrl,
      this.images,
      this.discountCode);

  static List<Homestay> listings = [
    Homestay(
        0,
        'Duplex @ Mutiara Ville',
        'Duplex Condo',
        5,
        200.00,
        'Mutiara Ville, Cyberjaya, Selangor',
        'assets/mutiaraville.jpg',
        ['assets/mutiaraville.jpg', 'assets/mutiaraville2.jpeg'],
        'ABC123'),
    Homestay(
        1,
        'Homestay BSP21',
        'Condo',
        5,
        400.00,
        'BSP21, Bandar Saujana Putra, Selangor',
        'assets/bsp21.jpg',
        [
          'assets/bsp21'
              'assets/bsp212.png',
        ],
        'DEF456'),
    Homestay(
        2,
        'Pent House @ KL Traders Square Residence',
        'Pent House',
        9,
        400.00,
        'KL Traders Square Residence, Setapak, Kuala Lumpur',
        'assets/kl-traders-square.jpg',
        ['assets/kl-traders-square.jpg', 'assets/kl-traders-square2.jpeg'],
        'GHI789'),
  ];
}

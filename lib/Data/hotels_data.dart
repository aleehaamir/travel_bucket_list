import 'package:travel_bucket_list/models/hotel_model.dart';

List<City> citiesList() => [
      City(name: 'Paris', image: "assets/images/paris.jpg", hotels: [
        Hotel(
          name: 'Hotel Le Meurice',
          address: '228 Rue de Rivoli, 75001 Paris, France',
          imageUrl: 'assets/images/hotel0.jpg',
          price: 800,
        ),
        Hotel(
          name: 'Shangri-La Hotel',
          address: '10 Avenue d\'Iéna, 75116 Paris, France',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 1200,
        ),
        Hotel(
          name: 'Hôtel de Crillon',
          address: '10 Place de la Concorde, 75008 Paris, France',
          imageUrl: 'assets/images/hotel2.jpg',
          price: 1000,
        ),
        Hotel(
          name: 'Le Bristol Paris',
          address: '112 Rue du Faubourg Saint-Honoré, 75008 Paris, France',
          imageUrl: 'assets/images/hotel3.jpg',
          price: 950,
        ),
      ]),
      City(name: 'Dubai', image: "assets/images/dubai.jpg", hotels: [
        Hotel(
          name: 'Burj Al Arab Jumeirah',
          address: 'Jumeirah Street, Dubai, United Arab Emirates',
          imageUrl: 'assets/images/hotel0.jpg',
          price: 1500,
        ),
        Hotel(
          name: 'Atlantis The Palm',
          address:
              'Crescent Rd, The Palm Jumeirah, Dubai, United Arab Emirates',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 1200,
        ),
        Hotel(
          name: 'Armani Hotel Dubai',
          address: 'Burj Khalifa, Downtown Dubai, Dubai, United Arab Emirates',
          imageUrl: 'assets/images/hotel2.jpg',
          price: 2000,
        ),
        Hotel(
          name: 'Jumeirah Beach Hotel',
          address: 'Jumeirah Street, Dubai, United Arab Emirates',
          imageUrl: 'assets/images/hotel3.jpg',
          price: 1000,
        ),
      ]),
      City(name: 'New York', image: "assets/images/new_york.jpg", hotels: [
        Hotel(
          name: 'The Plaza Hotel',
          address: '768 5th Ave, New York, NY 10019, USA',
          imageUrl: 'assets/images/hotel0.jpg',
          price: 800,
        ),
        Hotel(
          name: 'The Ritz-Carlton New York',
          address: '50 Central Park S, New York, NY 10019, USA',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 1200,
        ),
        Hotel(
          name: 'Lotte New York Palace',
          address: '455 Madison Ave, New York, NY 10022, USA',
          imageUrl: 'assets/images/hotel2.jpg',
          price: 900,
        ),
        Hotel(
          name: 'The St. Regis New York',
          address: '2 E 55th St, New York, NY 10022, USA',
          imageUrl: 'assets/images/hotel3.jpg',
          price: 1100,
        ),
      ]),
      City(name: 'Tokyo', image: "assets/images/tokyo.jpg", hotels: [
        Hotel(
          name: 'The Ritz-Carlton Tokyo',
          address:
              'Tokyo Midtown, 9-7-1 Akasaka, Minato-ku, Tokyo 107-6245, Japan',
          imageUrl: 'assets/images/hotel0.jpg',
          price: 1000,
        ),
        Hotel(
          name: 'Park Hyatt Tokyo',
          address: '3-7-1-2 Nishi Shinjuku, Shinjuku-ku, Tokyo 163-1055, Japan',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 1200,
        ),
        Hotel(
          name: 'Aman Tokyo',
          address:
              'The Otemachi Tower, 1-5-6 Otemachi, Chiyoda City, Tokyo 100-0004, Japan',
          imageUrl: 'assets/images/hotel2.jpg',
          price: 1500,
        ),
        Hotel(
          name: 'Imperial Hotel Tokyo',
          address: '1-1-1 Uchisaiwaicho, Chiyoda City, Tokyo 100-8558, Japan',
          imageUrl: 'assets/images/hotel3.jpg',
          price: 900,
        ),
      ]),
      City(name: 'Cairo', image: "assets/images/cairo.jpg", hotels: [
        Hotel(
          name: 'Marriott Mena House, Cairo',
          address: '6 Pyramids Rd, Giza, Cairo Governorate 12556, Egypt',
          imageUrl: 'assets/images/hotel0.jpg',
          price: 400,
        ),
        Hotel(
          name: 'Four Seasons Hotel Cairo at Nile Plaza',
          address: '1089 Corniche El Nil, Cairo Governorate 11519, Egypt',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 600,
        ),
        Hotel(
          name: 'The St. Regis Cairo',
          address:
              '1189 Corniche El Nil, Boulaq, Cairo Governorate 11221, Egypt',
          imageUrl: 'assets/images/hotel2.jpg',
          price: 700,
        ),
        Hotel(
          name: 'Kempinski Nile Hotel Cairo',
          address:
              '12 Ahmed Ragheb Street, Corniche El Nile, Cairo 11519, Egypt',
          imageUrl: 'assets/images/hotel3.jpg',
          price: 500,
        ),
      ]),
      City(name: 'London', image: "assets/images/london.jpg", hotels: [
        Hotel(
          name: 'The Ritz London',
          address:
              '150 Piccadilly, St. James\'s, London W1J 9BR, United Kingdom',
          imageUrl: 'assets/images/hotel0.jpg',
          price: 1200,
        ),
        Hotel(
          name: 'The Langham, London',
          address:
              '1C Portland Place, Regent Street, London W1B 1JA, United Kingdom',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 1000,
        ),
        Hotel(
          name: 'Claridge\'s',
          address: 'Brook Street, Mayfair, London W1K 4HR, United Kingdom',
          imageUrl: 'assets/images/hotel2.jpg',
          price: 1300,
        ),
        Hotel(
          name: 'Shangri-La The Shard, London',
          address: '31 St Thomas Street, London SE1 9QU, United Kingdom',
          imageUrl: 'assets/images/hotel3.jpg',
          price: 1500,
        ),
      ]),
      City(name: 'Sydney', image: "assets/images/sydney.jpg", hotels: [
        Hotel(
          name: 'The Langham, Sydney',
          address: '89-113 Kent St, Millers Point, Sydney NSW 2000, Australia',
          imageUrl: 'assets/images/hotel0.jpg',
          price: 900,
        ),
        Hotel(
          name: 'Park Hyatt Sydney',
          address: '7 Hickson Rd, The Rocks, Sydney NSW 2000, Australia',
          imageUrl: 'assets/images/hotel1.jpg',
          price: 1200,
        ),
        Hotel(
          name: 'Shangri-La Hotel Sydney',
          address: '176 Cumberland St, The Rocks, Sydney NSW 2000, Australia',
          imageUrl: 'assets/images/hotel2.jpg',
          price: 1000,
        ),
        Hotel(
          name: 'The Star Grand Hotel and Residences',
          address: '80 Pyrmont St, Pyrmont NSW 2009, Australia',
          imageUrl: 'assets/images/hotel3.jpg',
          price: 800,
        ),
      ]),
    ];

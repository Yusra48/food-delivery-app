import 'package:flutter/material.dart';
import 'package:food_application/screens/Views/Categories/Restaurantpage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Browsepage extends StatelessWidget {
  const Browsepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF180649),
              Color(0xFF3910AA),
              Color(0xFF240970),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/Image.png',
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kinka Izakaya',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2927 Westheimer Rd. Santa Ana',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Chip(label: Text('Delivery fee: \$3.99')),
                                Chip(label: Text('Delivery fee: \$3.99')),
                                Chip(label: Text('Delivery fee: \$3.99')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Delivery',style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Take Out',style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Group Order',style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Featured Items',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => RestaurantPage(
                    imageUrl: 'https://cdn.pixabay.com/photo/2016/01/29/17/08/feast-noodles-1168322_640.jpg',
                    title: 'Udon Miso',
                    description: 'Thick handmade udon noodles',
                    price: '\$16.00',
                  ));
                },
                child: FeaturedItemCard(
                  imageUrl: 'https://cdn.pixabay.com/photo/2016/01/29/17/08/feast-noodles-1168322_640.jpg',
                  title: 'Udon Miso',
                  description: 'Thick handmade udon noodles ',
                  price: '\$16.00',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => RestaurantPage(
                    imageUrl: 'https://cdn.pixabay.com/photo/2021/09/10/20/35/pizza-6614141_640.jpg',
                    title: 'Pepperoni Pizza',
                    description: 'Classic pepperoni pizza with cheese and tomato sauce',
                    price: '\$12.00',
                  ));
                },
                child: FeaturedItemCard(
                  imageUrl: 'https://cdn.pixabay.com/photo/2021/09/10/20/35/pizza-6614141_640.jpg',
                  title: 'Pepperoni Pizza',
                  description: 'Classic pepperoni pizza with cheese and tomato sauce',
                  price: '\$12.00',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => RestaurantPage(
                    imageUrl: 'https://cdn.pixabay.com/photo/2023/07/18/19/19/spring-rolls-8135469_640.jpg',
                    title: 'California Roll',
                    description: 'Delicious California roll with crab and avocado',
                    price: '\$14.00',
                  ));
                },
                child: FeaturedItemCard(
                  imageUrl: 'https://cdn.pixabay.com/photo/2023/07/18/19/19/spring-rolls-8135469_640.jpg',
                  title: 'California Roll',
                  description: 'Delicious California roll with crab and avocado',
                  price: '\$14.00',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  const FeaturedItemCard({
    super.key, 
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF180649),
            Color(0xFF3910AA),
            Color(0xFF240970),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Text(
                  price,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

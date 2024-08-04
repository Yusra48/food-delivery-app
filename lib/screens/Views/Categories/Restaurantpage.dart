import 'package:flutter/material.dart';
import 'package:food_application/screens/Views/Categories/OrderDetail.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  const RestaurantPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

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
            children: [
              SizedBox(height: 10),
              _buildDishImage(),
              SizedBox(height: 10),
              _buildDishDetails(),
              SizedBox(height: 10),
              _buildNoodleTypeSection(),
              SizedBox(height: 10),
              _buildNoodleTypeOptions(),
              SizedBox(height: 20),
              _buildAddToBasketButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDishImage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDishDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(fontSize: 20, color: Colors.grey[300]),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: () {
                   
                  },
                ),
                Text(
                  '1',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoodleTypeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Noodle type',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(color: Colors.deepPurpleAccent, width: 2),
            ),
            child: Text(
              'Required',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoodleTypeOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          RadioListTile<String>(
            title: Text('Thin', style: TextStyle(color: Colors.white)),
            value: 'Thin',
            groupValue: 'Thick',
            onChanged: (String? value) {
            
            },
          ),
          RadioListTile<String>(
            title: Text('Thick', style: TextStyle(color: Colors.white)),
            value: 'Thick',
            groupValue: 'Thick',
            onChanged: (String? value) {
         
            },
          ),
          RadioListTile<String>(
            title: Text('Udon', style: TextStyle(color: Colors.white)),
            value: 'Udon',
            groupValue: 'Thick',
            onChanged: (String? value) {
              
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddToBasketButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            backgroundColor: Color(0xFF03237C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            final itemData = {
              'name': title,
              'price': price,
              'description': description,
              'quantity': 1,
              'noodleType': 'Thick',
            };
            Get.to(() => OrderDetail(itemData: itemData));
          },
          child: Text(
            'Add to Basket',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

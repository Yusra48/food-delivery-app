import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/controller/HomeController.dart';
import 'package:food_application/screens/Views/Navigation/Browsepage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = Get.put(HomeController());

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
            children: [
              _buildHeader(),
              SizedBox(height: 10),
              _buildSearchBar(),
              SizedBox(height: 10),
              _buildCategories(),
              SizedBox(height: 10),
              _buildImageGrid(),
              SizedBox(height: 10),
              _buildBanner(),
              SizedBox(height: 5),
              _buildFooterImage(),
              SizedBox(height: 10),
              _buildFastestNearYou(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.sort, color: Colors.white),
          Text(
            'Deliver',
            style: GoogleFonts.bonaNova(
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 30),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.pedal_bike,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: Icon(Icons.qr_code, color: Colors.white),
          hintText: 'Your Order?',
          hintStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Color(0xFF120536),
          filled: true,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: GoogleFonts.bonaNova(
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: GoogleFonts.bonaNova(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildImageContainer('assets/burger.png'),
        _buildImageContainer('assets/taco.png'),
        _buildImageContainer('assets/cake.png'),
        _buildImageContainer('assets/sushi.png'),
      ],
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.to(Browsepage());
        },
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Container(
            width: double.infinity,
            height: 290,
            decoration: BoxDecoration(
              color: Color(0xFF170646),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  bottom: 90,
                  left: 20,
                  right: 200,
                  child: Text(
                    '30% OFF',
                    style: GoogleFonts.bonaNova(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 200,
                  child: Text(
                      'Discover discounts in your favorite local restaurants',
                      style: GoogleFonts.bonaNova(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.center),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(Browsepage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF03237C),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Order Now',
                          style: GoogleFonts.bonaNova(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ))),
                ),
                Positioned(
                    left: 290,
                    right: 5,
                    bottom: 20,
                    top: 20,
                    child: Image.asset('assets/Pasta.png'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterImage() {
    return Center(
      child: Image.asset(
        'assets/animation.png',
        width: 400,
      ),
    );
  }

  Widget _buildFastestNearYou() {
    return Column(
      children: [
        Text(
          'Fastest Near You',
          style: GoogleFonts.bonaNova(
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/Image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF1B0261),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blue[100],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(color: Colors.deepPurpleAccent),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      currentIndex: _homeController.currentIndex.value,
      onTap: (index) => _homeController.onTabTapped(index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.folder_open),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            child: Icon(CupertinoIcons.shopping_cart, color: Colors.white),
            radius: 25,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.doc_append),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_circle),
          label: 'Account',
        ),
      ],
    );
  }
}

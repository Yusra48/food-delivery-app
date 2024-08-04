import 'package:flutter/material.dart';
import 'package:food_application/Services/APIServices.dart';
import 'package:food_application/controller/SignupController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatelessWidget {
  final SignupController _signUpController = Get.put(SignupController());
  final APIService _apiService = Get.put(APIService());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  SignupView({super.key});

  void _register() async {
    final userData = {
      'email': _emailController.text,
      'username': _usernameController.text,
      'password': _passwordController.text,
    };

    await _apiService.createUser(userData);
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF180649), Color(0xFF3910AA), Color(0xFF240970)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
            ),
            Text(
              'Deliver your Favourite Food',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 350,
              width: 400,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF211B33),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Signup',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontSize: 30,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFF2E2E2E),
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFF2E2E2E),
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFF2E2E2E),
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: _signUpController.navigateToHome,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        backgroundColor: Color(0xFF03237C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google.png', width: 30),
                        SizedBox(width: 20),
                        Image.asset('assets/facebook.png', width: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Already have an account?",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: _signUpController.navigateToLogin,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

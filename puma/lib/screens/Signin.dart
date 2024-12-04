import 'package:flutter/material.dart';
import 'Signup.dart';
import 'Admin_Dashboard..dart';
import 'Lecturer_Dashboard.dart';
import 'Student_Dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  bool _isPasswordVisible = false;
  int loginAttempts = 0;

  void onChangedUsername(String value) {
    setState(() {
      email = value;
    });
  }

  void onChangedPassword(String value) {
    setState(() {
      password = value;
    });
  }

  Future<void> onPressedSignIn() async {
    if (loginAttempts >= 3) {
      const snackBar = SnackBar(
          content: Text('You have been locked out! Please try again later.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (email.isEmpty || password.isEmpty) {
      const snackBar =
          SnackBar(content: Text('Please provide email and password'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (email == "admin@gmail.com" && password == "Admin123#") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Admin_Dashboard()),
      );
    } else if (email == "lecturer@example.com" && password == "lecturer123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Lecturer_Dashboard()),
      );
    } else if (email == "student@example.com" && password == "student123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Student_Dashboard()),
      );
    } else {
      loginAttempts++;
      const snackBar =
          SnackBar(content: Text('Email or Password is incorrect!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void onPressedSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB3C8CF),
                Color(0xffFFE3E3),
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22, right: 22),
              child: Text(
                'Stay Connected and Stay Informed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                // Wrap content to prevent overflow
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Email Input Field with box
                      TextField(
                        onChanged: onChangedUsername,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          label: const Text(
                            'Gmail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB3C8CF),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB3C8CF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Password Input Field with box
                      TextField(
                        obscureText: !_isPasswordVisible,
                        onChanged: onChangedPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          label: const Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB3C8CF),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB3C8CF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              50), // Adjust the spacing above the button if needed
                      GestureDetector(
                        onTap: onPressedSignIn,
                        child: Container(
                          height: 45, // Reduced height
                          width: 250, // Reduced width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Smaller border radius
                            gradient: const LinearGradient(colors: [
                              Color(0xffB3C8CF),
                              Color(0xffFFE3E3),
                            ]),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, // Reduced font size
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: onPressedSignUp,
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

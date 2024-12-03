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
  bool _isPasswordVisible = false; // Password visibility flag
  int loginAttempts = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PUMA IS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.black),
                            onChanged: onChangedUsername,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email,
                                  color: Colors.grey.shade700),
                              labelText: 'Email',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade700),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _passwordController,
                            obscureText:
                                !_isPasswordVisible, // Toggle visibility
                            style: const TextStyle(color: Colors.black),
                            onChanged: onChangedPassword,
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.grey.shade700),
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade700),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey.shade700,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible =
                                        !_isPasswordVisible; // Toggle password visibility
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          ElevatedButton(
                            onPressed: onPressedSignIn,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24.0), // Panjang tombol
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextButton(
                            onPressed: onPressedSignUp,
                            child: const Text(
                              'Don’t have an account? Sign Up',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

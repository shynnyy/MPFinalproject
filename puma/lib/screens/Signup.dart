import 'package:flutter/material.dart';
import 'Signin.dart';

// Centralized color structure
class AppColors {
  static const gradientStart = Color(0xffB3C8CF);
  static const gradientEnd = Color(0xffFFE3E3);
  static const textPrimary = Color(0xffB3C8CF);
  static const textSecondary = Colors.grey;
  static const buttonText = Colors.white;
  static const textFieldBorder = Color(0xffB3C8CF);
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String fullName = '';
  String ID = ''; // Changed from phoneNumber to ID
  String role = ''; // Default role is empty
  String batch = '';
  bool termsAccepted = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _idController = TextEditingController(); // for ID

  Future<void> onPressedSignUp() async {
    if (email.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty ||
        ID.isEmpty ||
        confirmPassword.isEmpty) {
      const snackBar = SnackBar(content: Text('Please fill in all fields.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (password != confirmPassword) {
      const snackBar = SnackBar(content: Text('Passwords do not match.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (!termsAccepted) {
      const snackBar =
          SnackBar(content: Text('You must accept the terms and conditions.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Firebase or backend logic here
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
                AppColors.gradientStart,
                AppColors.gradientEnd,
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _fullNameController,
                        label: 'Full Name',
                        onChanged: (value) => setState(() => fullName = value),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _idController,
                        label: 'ID',
                        onChanged: (value) => setState(() => ID = value),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _emailController,
                        label: 'Email',
                        onChanged: (value) => setState(() => email = value),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _passwordController,
                        label: 'Password',
                        obscureText: true,
                        onChanged: (value) => setState(() => password = value),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _confirmPasswordController,
                        label: 'Confirm Password',
                        obscureText: true,
                        onChanged: (value) =>
                            setState(() => confirmPassword = value),
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Role',
                          labelStyle: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: role.isEmpty ? null : role,
                        onChanged: (String? newValue) {
                          setState(() {
                            role = newValue!;
                          });
                        },
                        items: ['Student', 'Lecturer']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 100),
                          backgroundColor: Colors
                              .transparent, // Make button background transparent for gradient
                          foregroundColor: Colors
                              .transparent, // Ensure it's transparent on tap
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffB3C8CF),
                                Color(0xffFFE3E3),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.buttonText,
                              ),
                            ),
                          ),
                        ),
                        onPressed: onPressedSignUp,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required Function(String) onChanged,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            labelStyle: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

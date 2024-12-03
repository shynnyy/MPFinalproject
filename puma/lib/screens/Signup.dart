import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:final_project/utils/firebase_auth_service.dart';
import 'Signin.dart';

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
  String phoneNumber = '';
  String role = ''; // Default role is empty
  String ID = ''; // Change from studentId to ID
  String batch = '';
  bool termsAccepted = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _IDController =
      TextEditingController(); // Changed from _studentIdController
  final TextEditingController _batchController = TextEditingController();

  Future<void> onPressedSignUp() async {
    if (email.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty ||
        phoneNumber.isEmpty ||
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

  void onChangedEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void onChangedPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void onChangedConfirmPassword(String value) {
    setState(() {
      confirmPassword = value;
    });
  }

  void onChangedFullName(String value) {
    setState(() {
      fullName = value;
    });
  }

  void onChangedPhoneNumber(String value) {
    setState(() {
      phoneNumber = value;
    });
  }

  void onChangedRole(String? value) {
    setState(() {
      role = value ?? ''; // Default to empty if value is null
    });
  }

  void onChangedID(String value) {
    setState(() {
      ID = value; // Change to ID
    });
  }

  void onChangedBatch(String value) {
    setState(() {
      batch = value;
    });
  }

  void onChangedTerms(bool? value) {
    setState(() {
      termsAccepted = value ?? false; // Default to 'false' if value is null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18, // Ukuran font lebih kecil
            fontWeight: FontWeight.bold, // Membuat teks menjadi bold
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Enter your full name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: onChangedFullName,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Enter your phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: onChangedPhoneNumber,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: role.isEmpty ? null : role,
              items: ['Student', 'Lecturer'].map((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: onChangedRole,
              decoration: InputDecoration(
                labelText: 'Select Role',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: onChangedEmail,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: onChangedPassword,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: onChangedConfirmPassword,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _IDController,
              decoration: InputDecoration(
                labelText: 'Enter your ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: onChangedID,
            ),
            if (role == 'Student') ...[
              const SizedBox(height: 10),
              TextField(
                controller: _batchController,
                decoration: InputDecoration(
                  labelText: 'Enter your batch',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: onChangedBatch,
              ),
            ],
            Row(
              children: [
                Checkbox(
                  value: termsAccepted,
                  onChanged: onChangedTerms,
                ),
                const Text('I accept the terms and conditions'),
              ],
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: onPressedSignUp,
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: const Text('Already have an account? Sign In'),
              ),
            ),
            const Spacer(),
            const Divider(),
            const Center(
              child: Text('© 2024 PUMA IS by Avery - All Rights Reserved'),
            ),
          ],
        ),
      ),
    );
  }
}

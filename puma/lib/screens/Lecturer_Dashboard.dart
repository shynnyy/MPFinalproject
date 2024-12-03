import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:puma/reusable_widget/reusable_widget.dart';
class Lecturer_Dashboard extends StatefulWidget {
  const Lecturer_Dashboard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AdminDashboardState();
  }
}
class _AdminDashboardState extends State<Lecturer_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Admin Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
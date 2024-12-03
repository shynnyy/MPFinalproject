// import 'package:firebase_core/firebase_core.dart';
// import 'package:final_project/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:puma/screens/Signin.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MainApp());
// }
void main() {
  runApp(const MyApp()); // Ensure this is the main entry point
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Signin Page', home: SignIn());
  }
}
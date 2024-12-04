import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core package
import 'Screen/productlistpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDFjAWxIhkDBmVCdU_5fl3MkyyDbrTq0w8",
      authDomain: "productlist-3668a.firebaseapp.com",
      projectId: "productlist-3668a",
      storageBucket: "productlist-3668a.firebasestorage.app",
      messagingSenderId: "646787874220",
      appId: "1:646787874220:web:a0809ea901494414d78e09",
      measurementId: "G-V27Q82FLTK",
    ),
  ); // Initialize Firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(), // Navigate directly to ProductListPage
    );
  }
}

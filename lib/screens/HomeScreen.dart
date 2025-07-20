import 'package:flutter/material.dart';
import 'package:language_translator_app/screens/login.dart';
import 'package:language_translator_app/screens/pdf_tranlation_screen.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import 'text_translation_screen.dart';
import 'camera_translation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final pages = const [
    TextTranslationScreen(),
    PDFTranslationScreen(),
    CameraTranslationScreen(),
  ];

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const 
          Text('Translate'),
        ),
        backgroundColor: const Color.fromARGB(255, 79, 55, 83),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
            
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  LoginScreen()));
            },
          )
        ],
      ),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 79, 55, 83),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.white70,
        currentIndex: _index,
        onTap: (v) => setState(() => _index = v),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: 'PDF'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Camera'),
        ],
      ),
    );
  }
}

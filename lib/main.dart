import 'package:flutter/material.dart';
import 'package:language_translator_app/providers/auth__provider.dart';
import 'package:language_translator_app/providers/translation_provider.dart';
import 'package:language_translator_app/screens/login.dart';
import 'package:language_translator_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()..loadLogin()),
      ChangeNotifierProvider(create: (_) => TranslationProvider()),
      ],
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  SplashScreen(),
    ) ,
    );
  }
}


        
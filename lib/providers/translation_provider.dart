import 'package:flutter/material.dart';
import 'package:language_translator_app/Model/language_model.dart';

class TranslationProvider extends ChangeNotifier {
  List<Languages> languages = [
    Languages(name: 'English', code: 'en'),
    Languages(name: 'Spanish', code: 'es'),
    Languages(name: 'Vietnamese', code: 'vi'),
  ];

  Languages source = Languages(name: 'English', code: 'en');
  Languages target = Languages(name: 'Vietnamese', code: 'vi');
  String originalText = '';
  String translatedText = '';

  void setSource(Languages lang) {
    source = lang;
    notifyListeners();
  }

  void setTarget(Languages lang) {
    target = lang;
    notifyListeners();
  }

  void setOriginal(String text) {
    originalText = text;
    notifyListeners();
  }

  void setTranslated(String text) {
    translatedText = text;
    notifyListeners();
  }
}

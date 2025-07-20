
import 'package:translator/translator.dart';
class TranslationService {

  final _translator = GoogleTranslator();
  Future<String> translate(String text, String from , String to) async{
    final result = await _translator.translate(text, from: from, to: to);
    return result.text;
  }
}

//  shared_preferences: ^2.5.3
//   translator: ^1.0.3+1
//   provider: ^6.1.5
//   http: ^0.13.6
//   file_picker: ^6.1.3
//   pdf: ^3.10.4
//   path_provider: ^2.1.2
//   google_mlkit_text_recognition: ^0.9.0
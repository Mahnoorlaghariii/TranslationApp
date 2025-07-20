import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../providers/translation_provider.dart';
import '../utils/translation_service.dart';
import '../widgets/language_dropdown.dart';
import '../constants/app_colors.dart';

class CameraTranslationScreen extends StatefulWidget {
  const CameraTranslationScreen({super.key});
  @override
  State<CameraTranslationScreen> createState() =>
      _CameraTranslationScreenState();
}

class _CameraTranslationScreenState extends State<CameraTranslationScreen> {
  final picker = ImagePicker();
  final recognizer = TextRecognizer();
  String scanned = '';
  String translated = '';
  final _service = TranslationService();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TranslationProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      color: Color.fromARGB(255, 230, 201, 235),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: LanguageDropdown(
                  items: prov.languages,
                  selected: prov.source,
                  onChanged: (lang) {
                    if (lang != null) prov.setSource(lang);
                  },
                ),
              ),
              const Icon(Icons.swap_horiz, color: Color.fromARGB(255, 79, 55, 83)),
              Expanded(
                child: LanguageDropdown(
                  items: prov.languages,
                  selected: prov.target,
                  onChanged: (lang) {
                    if (lang != null) prov.setTarget(lang);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 79, 55, 83), foregroundColor: Colors.white),
            child: const Text('Scan & Translate'),
            onPressed: () async {
              final img = await picker.pickImage(source: ImageSource.camera);
              if (img == null) return;
              final input = InputImage.fromFilePath(img.path);
              final res = await recognizer.processImage(input);
              scanned = res.text;

              final tr = await _service.translate(
                scanned,
                prov.source.code,
                prov.target.code,
              );
              setState(() {
                translated = tr;
                prov.setOriginal(scanned);
                prov.setTranslated(tr);
              });
            },
          ),
          const SizedBox(height: 20),
          if (scanned.isNotEmpty)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Original:',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(scanned),
                    const SizedBox(height: 12),
                    const Text(
                      'Translated:',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(translated),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

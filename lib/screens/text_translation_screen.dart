import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/translation_provider.dart';
import '../utils/translation_service.dart';
import '../widgets/language_dropdown.dart';
import '../constants/app_colors.dart';

class TextTranslationScreen extends StatefulWidget {
  const TextTranslationScreen({super.key});
  @override
  State<TextTranslationScreen> createState() => _TextTranslationScreenState();
}

class _TextTranslationScreenState extends State<TextTranslationScreen> {
  final _controller = TextEditingController();
  final _service = TranslationService();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TranslationProvider>(context);
    return Container(
      color: Color.fromARGB(255, 230, 201, 235),
      padding: const EdgeInsets.all(16),
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
              const Icon(Icons.swap_horiz, color:Color.fromARGB(255, 29, 10, 61)),
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
          TextField(
            controller: _controller,
            maxLines: 4,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 221, 210, 224),
              hintText: 'Enter text...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 79, 55, 83)),
            child: const Text(
              'Translate',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              prov.setOriginal(_controller.text);
              final res = await _service.translate(
                _controller.text,
                prov.source.code,
                prov.target.code,
              );
              prov.setTranslated(res);
            },
          ),
          const SizedBox(height: 20),
          if (prov.translatedText.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Result:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 210, 224),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color.fromARGB(255, 79, 55, 83),
                      width: 2.0
                    )
                  ),
                  child: Text(
                    prov.translatedText,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

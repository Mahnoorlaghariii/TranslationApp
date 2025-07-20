import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/translation_provider.dart';
import '../utils/translation_service.dart';
import '../widgets/language_dropdown.dart';
import '../constants/app_colors.dart';

class PDFTranslationScreen extends StatefulWidget {
  const PDFTranslationScreen({super.key});
  @override
  State<PDFTranslationScreen> createState() => _PDFTranslationScreenState();
}

class _PDFTranslationScreenState extends State<PDFTranslationScreen> {
  File? file;
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
              const Icon(Icons.swap_horiz, color:  Color.fromARGB(255, 79, 55, 83)),
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
            style: ElevatedButton.styleFrom(backgroundColor:  Color.fromARGB(255, 79, 55, 83), foregroundColor: Colors.white),
            child: const Text('Pick & Translate PDF', ),
            onPressed: () async {
              final res = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (res == null) return;
              file = File(res.files.single.path!);

              final text = 'Extracted PDF text...';

              final tr = await _service.translate(
                text,
                prov.source.code,
                prov.target.code,
              );
              setState(() => translated = tr);

              final doc = pw.Document();
              doc.addPage(pw.Page(build: (_) => pw.Text(tr)));

              final dir = await getApplicationDocumentsDirectory();
              final outFile = File('${dir.path}/translated.pdf');
              await outFile.writeAsBytes(await doc.save());

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Translated PDF saved at ${outFile.path}'),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          if (translated.isNotEmpty)
            Expanded(child: SingleChildScrollView(child: Text(translated))),
        ],
      ),
    );
  }
}

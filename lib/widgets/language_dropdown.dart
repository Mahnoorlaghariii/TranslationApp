import 'package:flutter/material.dart';
import 'package:language_translator_app/Model/language_model.dart';

class LanguageDropdown extends StatelessWidget {
  

  final List<Languages> items;
  final Languages selected;
  final ValueChanged<Languages?> onChanged;

  const LanguageDropdown({super.key, required this.items, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Languages>(
      value: selected,
      items: items.map((l)=> DropdownMenuItem(value : l, child:  Text(l.name), )).toList(), 
      onChanged: onChanged);
  }
}
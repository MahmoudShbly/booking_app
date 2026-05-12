import 'package:flutter/material.dart';

class DropdownMenueComponent extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String) onChanged;

  const DropdownMenueComponent({super.key, 
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black54),
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down, size: 20),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Center(child: Text(e)),
              ),
            )
            .toList(),
        onChanged: (v) => onChanged(v!),
      ),
    );
  }
}
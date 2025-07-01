// lib/features/products/presentation/widgets/filter_sheet.dart

import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  final void Function(String min, String max, String color) onApply;

  const FilterSheet({super.key, required this.onApply});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Filtrlash", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TextField(
              controller: minPriceController,
              decoration: InputDecoration(
                labelText: "Minimal narx",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: maxPriceController,
              decoration: InputDecoration(
                labelText: "Maksimal narx",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.money_off),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedColor.isEmpty ? null : selectedColor,
              decoration: InputDecoration(
                labelText: "Rangni tanlang",
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: '', child: Text('Barchasi')),
                DropdownMenuItem(value: '#fffcfc', child: Text('Oq')),
                DropdownMenuItem(value: '#7d7070', child: Text('Kulrang')),
                DropdownMenuItem(value: '#050505', child: Text('Qora')),
                DropdownMenuItem(value: '#c78b8b', child: Text('Och jigarrang')),
              ],
              onChanged: (value) => setState(() {
                selectedColor = value ?? '';
              }),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onApply(
                    minPriceController.text,
                    maxPriceController.text,
                    selectedColor,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Qo'llash", style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

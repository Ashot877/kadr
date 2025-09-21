import 'package:flutter/material.dart';
import 'package:kadr/utils/constants/colors.dart';
import 'package:kadr/utils/constants/sizes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Top3SubmissionScreen extends StatefulWidget {
  const Top3SubmissionScreen({super.key});

  @override
  State<Top3SubmissionScreen> createState() => _Top3SubmissionScreenState();
}

class _Top3SubmissionScreenState extends State<Top3SubmissionScreen> {
  String? _selectedType;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Submit Your Top 3',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: TColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Type selector ---
            Text(
              'Type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                value: _selectedType ?? 'Film',
                items: ['Film', 'Series', 'Cartoon'].map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  elevation: 2,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[900] : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  offset: const Offset(0, 0), // всегда вниз
                ),
                iconStyleData: IconStyleData(
                  iconEnabledColor: isDark ? Colors.white : Colors.black,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                ),
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // --- Title ---
            Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter the title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
              ),
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),

            const SizedBox(height: 16),

            // --- Year ---
            Text(
              'Year',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter release year',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
              ),
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),

            const SizedBox(height: 16),

            // --- Reason ---
            Text(
              'Why we should watch it',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _reasonController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Write your reason',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
              ),
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),

            const SizedBox(height: 24),

            // --- Submit button ---
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Submission sent!'),
                      backgroundColor: TColor.primaryColor, // здесь задаём зелёный фон
                      duration: Duration(seconds: 2), // можно настроить длительность показа
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child:
                const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
